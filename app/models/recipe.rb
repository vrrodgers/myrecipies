class Recipe < ApplicationRecord
  mount_uploader :image, RecipeUploader

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :chef
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 500}
  validates :chef_id, presence: true
  default_scope -> { order(updated_at: :desc)}
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

end