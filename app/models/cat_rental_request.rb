# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord
  STATUS_STATES = %w(APPROVED DENIED PENDING).freeze

  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: STATUS_STATES
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def approved?
    self.status == "APPROVED"
  end

  def pending?
    self.status == "PENDING"
  end

  def denied?
    self.status == "DENIED"
  end

  private

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where.not('start_date > :end_date OR end_date < :start_date', start_date: start_date, end_date: end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where('status = \'APPROVED\'')
  end

  def does_not_overlap_approved_request
    return true if self.denied?

    unless !overlapping_approved_requests.exists?
      errors.add(:base, message: 'Request conflicts with existing approved request')
    end
  end
end
