# BOOKS MODEL
class Book < ApplicationRecord
  # TODO: fix adding books covers => invalid picture 
  has_attached_file :picture,
                    styles: { medium: "300x300>",
                              thumb: "100x100>" },
                    default_url: ":style/books_square.jpg"
  has_many :comments, dependent: :destroy
  has_many :future_readers, dependent: :destroy
  has_many :readers, dependent: :destroy

  validates_attachment_content_type :picture, content_type: %r{/\Aimage\/.*\z/}
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :published_at, presence: true
end
