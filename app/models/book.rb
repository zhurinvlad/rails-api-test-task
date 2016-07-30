# Book model
class Book < ApplicationRecord
  belongs_to :author

  validates :isbn,  presence: true, length: { maximum: 13 },
                    uniqueness: { case_sensitive: false }
  validates :title, presence: true
  validates :pages, numericality: { greater_than: 0 }
  validates :published, presence: true
end
