class Article < ApplicationRecord

  belongs_to :user

  # Validates that no article is created with an empty title with a min and max length
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }

  # Validates that no description is created with an empty description with a min and max length
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end