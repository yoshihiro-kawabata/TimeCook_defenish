class Recipe < ApplicationRecord
  has_many :tasks
  has_and_belongs_to_many :users
  has_one_attached :portrait
  paginates_per 5
end
