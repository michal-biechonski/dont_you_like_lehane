class MessageForm < Reform::Form
  property :title
  validates :title, presence: true

  property :content
  validates :content, presence: true

  property :length
  validates :length, presence: true
end
