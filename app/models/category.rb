class Category < ApplicationRecord

  # Validates that no article is created with an empty title with a min and max length
  validates :name, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 2, maximum: 25 }

end