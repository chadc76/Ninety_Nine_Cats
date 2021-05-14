# == Schema Information
#
# Table name: session_tokens
#
#  id                     :bigint           not null, primary key
#  user_sessions_table_id :integer          not null
#  token                  :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  env                    :string
#  location               :string
#
class SessionToken < ApplicationRecord
  validates :user_sessions_table_id, :token, presence: true
  validates :token, uniqueness: true
  before_create :generate_env_location

  belongs_to :session_table,
    primary_key: :id,
    foreign_key: :user_sessions_table_id,
    class_name: :UserSession
  
  has_one :user,
    through: :session_table,
    source: :sessions_owner

  def generate_env_location
    self.env ||= "desktop"
  end
end
