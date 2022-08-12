require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like model' do
    first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.')
    first_post = Post.create!(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
    like = Like.create!(post_id: first_post.id, author_id: first_user.id)

    it 'update_likes_counter should increment the total likes by 1' do
      like.update_likes_counter
      expect(like.post.likes_counter).to eq 1
    end

    it 'like must have a correct author' do
      expect(Like.first.author.name).to eq 'Tom'
    end
  end
end
