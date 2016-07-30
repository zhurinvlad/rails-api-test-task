# Review Serializer
class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :text
  # has_one :user
  # has_one :book
end
