# == Schema Information
#
# Table name: user_sessions
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSession < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true

  belongs_to :sessions_owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
    
  has_many :tokens,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :user_sessions_table_id,
    class_name: :SessionToken
end
