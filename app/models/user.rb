# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  attr_reader :password

  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  def self.find_by_credentials(username, pw)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(pw) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  has_many :cats,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Cat

  has_many :requests_to_rent,
    dependent: :destroy,
    primary_key: :id, 
    foreign_key: :user_id,
    class_name: :CatRentalRequest

  has_many :rental_requests,
    through: :cats,
    source: :rental_requests

  def pending_rental_requests
    requests_to_rent
      .where("status LIKE ?", "PENDING")
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save
    self.session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
