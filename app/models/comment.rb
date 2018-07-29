# COMMENTS MODEL
class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :content, presence: true

  def belongs_to_user?(user)
    user_id == user&.id || user&.admin?
  end
end
