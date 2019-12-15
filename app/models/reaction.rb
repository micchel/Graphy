class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :photographer

  enum status: { dislike: 0, like: 1 }
end
