# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  
  attr_reader :password
  
  after_initialize :ensure_token
  
  has_many :goals,
    foreign_key: :user_id,
    class_name: :Goal
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    # errors = ""
    # errors += "User not found " unless user
    return nil unless user && user.valid_password?(password)
    user
  end
  
  def valid_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def ensure_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
  
  def reset_session_token
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end
end
