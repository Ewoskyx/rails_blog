class Author < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
