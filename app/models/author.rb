# Author model
class Author < ApplicationRecord
  include Nameable

  validates :first_name, presence: true, uniqueness: {
    scope: :last_name, case_sensitive: false
  }
  validates :last_name, presence: true
end
