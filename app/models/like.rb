class Like < ApplicationRecord
  belongs_to :author, dependent: :destroy
  belongs_to :post

  # A method that updates the likes counter for a post.
  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
