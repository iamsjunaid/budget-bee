class Purchase < ApplicationRecord
  belongs_to :user
  has_many :purchase_categories
  has_many :categories, through: :purchase_categories

  validates :name, presence: true
  validates :amount, presence: true

  default_scope { order(created_at: :desc) }
end
