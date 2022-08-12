require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', posts_counter: 0)
    Post.create!(author_id: first_user.id, title: 'Hello', text: 'This is my first post')

    it 'name must not be blank' do
      first_user.name = nil
      expect(first_user).to_not be_valid
      first_user.name = 'Evren'
    end

    it 'post counter must be an integer' do
      first_user.posts_counter = 'hi'
      expect(first_user).to_not be_valid
      first_user.posts_counter = 0
    end

    it 'should return recent posts' do
      first_user.recent_posts
      expect(first_user.recent_posts.length).to eq 1
    end
  end
end
