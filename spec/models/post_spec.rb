require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post model' do
    first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', posts_counter: 0)
    first_post = Post.create!(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
    Comment.create!(post_id: first_post.id, author_id: first_user.id, text: 'Hi Tom!')

    it 'title must not be blank' do
      post = Post.first
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'title must not exceed 250 characters.' do
      # rubocop:disable Layout/LineLength
      post = Post.first
      post.title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum, rhoncus sit morbi facilisis ipsum pellentesque pellentesque. Nunc scelerisque ullamcorper nibh ut nunc. Ut magnis viverra vitae ut tellus lobortis. Odio eget elementum enim aliquam morbi facilisis morbi. Eget phasellus sed morbi'
      # rubocop:enable Layout/LineLength
      expect(post).to_not be_valid
    end

    it 'comments_counter must be an integer greater than or equal to 0' do
      post = Post.first
      post.comments_counter = -1
      expect(post).to_not be_valid
    end

    it 'likes_counter must be an integer greater than or equal to 0' do
      post = Post.first
      post.likes_counter = -1
      expect(post).to_not be_valid
    end

    it 'update_posts_counter should increment the total posts by 1' do
      first_post.update_posts_counter
      expect(first_post.author.posts_counter).to eq 1
    end

    it 'returns recent comments' do
      res = first_post.recent_comments
      expect(res.length).to eq 1
    end
  end
end
