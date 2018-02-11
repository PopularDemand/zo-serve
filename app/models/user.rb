class User < ApplicationRecord
  has_secure_password
  attr_accessor :auth_token

  # ASSOCIATIONS
  has_many :receiver_games,
           class_name: 'Game',
           foreign_key: :receiver_id
  has_many :selections,
           through: :receiver_games

  # MAILERS
  def send_welcome_email
    UserMailer.welcome(self).deliver!
  end

  # SESSIONS
  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end
end
