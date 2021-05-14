# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  username         :string           not null
#  password_digest  :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_sessions_id :integer
#
class User < ApplicationRecord
  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }

  after_create :ensure_user_sessions

  def self.find_by_credentials(username, pw)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(pw) ? user : nil
  end

  def self.find_by_session_token(session_token)
    token = SessionToken.find_by(token: session_token)
    user = token ? token.user : nil
  end

  def generate_user_sessions_table
    user_session_table = UserSession.create!(user_id: self.id)
    self.user_sessions_id = user_session_table.id
    self.save!
    user_session_table
  end
 
  def generate_session_token(device = "desktop", location = "")
    SessionToken.create!(
      user_sessions_table_id: self.user_sessions_id, 
      token: SecureRandom::urlsafe_base64(16),
       env: device,
       location: location)
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

  has_one :sessions_table,
    dependent: :destroy,
    primary_key: :user_sessions_id,
    foreign_key: :id,
    class_name: :UserSession

  has_many :session_tokens,
    dependent: :destroy,
    through: :sessions_table,
    source: :tokens
  
  def pending_rental_requests
    requests_to_rent
      .where("status LIKE ?", "PENDING")
  end

  def destroy_session_token!(token)
    self.session_tokens.where("token LIKE ?", token).first.destroy
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  private

  def ensure_user_sessions
    self.user_sessions_id.nil? ? self.generate_user_sessions_table : self.sessions_table
  end
end
