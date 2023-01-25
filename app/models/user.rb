class User < ApplicationRecord
  has_secure_token
  has_secure_password

  has_many :orders, dependent: :destroy

  validates :email, uniqueness: true,
                    presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" }

  validates :name, :phone, :address, presence: true, on: :update, allow_nil: true

  def invalidate_token
    update(token: nil)
  end

  def self.authenticate(email, password)
    user = User.find_by(email:)
    return false unless user&.authenticate(password)

    user.regenerate_token
    user
  end
end
