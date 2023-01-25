# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  before_validation :generate_auth_token, on: [:create]
  before_validation :downcase_title, on: %i[create update]

  validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :email, presence: true, format: { with: /.+@[^@]+\.[^*]{2,}\S/, message: 'Email invalid' }, uniqueness: { case_sensitive: false }
  validates :title, inclusion: { in: %w[mr ms mrs], message: 'is not a valid title' }

  validate :check_full_name_length, on: %i[create update]
  before_validation :convert_lowercase_email, on: %i[create update]
  
  def generate_auth_token(force = false) 
    self.auth_token ||= SecureRandom.urlsafe_base64

    sef.auth_token = SecureRandom.urlsafe_base64 if force
  end

  def jwt(exp = 1.day.from_now)
    payload = { exp: exp.to_i, auth_token: self.auth_token }
    JWT.encode payload, Rails.application.credentials.secret_key_base, 'HS256'
  end

  def downcase_title
    self.title = title&.downcase
  end

  def check_full_name_length
    return unless (first_name + last_name).length < 20

    errors.add(:full_name, 'is to short')
    
  end

  def convert_lowercase_email
    self.email = email.downcase if email.present?
  end

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
