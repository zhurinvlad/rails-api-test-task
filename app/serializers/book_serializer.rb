# Book Serializer
class BookSerializer < ActiveModel::Serializer
  attributes :id, :isbn, :title, :description, :pages, :website,
             :published

  belongs_to :author
end
