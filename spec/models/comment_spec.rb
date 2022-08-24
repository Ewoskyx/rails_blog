require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', posts_counter: 0)
    first_post = Post.create!(author_id: first_user.id, title: 'Hello', text: 'This is my first post',
                              likes_counter: 0, comments_counter: 0)
    comment = Comment.create!(post_id: first_post.id, author_id: first_user.id, text: 'Hi Tom!')

    it 'update_comments_counter should increment the total comments by 1' do
      comment.update_comments_counter
      expect(comment.post.comments_counter).to eq 2
    end

    it 'comment must have a correct text' do
      expect(comment.text).to eq 'Hi Tom!'
    end
  end
end
