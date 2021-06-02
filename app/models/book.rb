class Book < ApplicationRecord
  attachment :book_image
  validates :title, presence:{ message: "can't be blank error" }
  validates :body, presence: { message: "can't be blank error" }, length: { in: 0..200 }
  belongs_to :user
end
