class Chef < ApplicationRecord
  extend FriendlyId
  friendly_id :chefname, use: :slugged

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_secure_password
  validates :password, presence: true, length: {minimum: 5},allow_nil: true


    before_save {self.email = email.downcase}
    validates :chefname, presence: true, length: {maximum: 30}
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
                      format: { with: VALID_EMAIL_REGEX},
                      uniqueness: { case_sensitive: false}

end