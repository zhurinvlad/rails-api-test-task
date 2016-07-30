# Review model
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :text, presence: true
end
