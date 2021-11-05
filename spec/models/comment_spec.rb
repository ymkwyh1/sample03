require 'rails_helper'

RSpec.describe Comment, type: :model do

  context '内容が入力されている' do

    let!(:user) do
      user = User.create!({
        email: 'test@example.com',
        password: 'password',
        username: 'aaaaa'
      })
    end
  
    let!(:post) do
      post = user.posts.build({
        picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/heart.png')),
        content: 'aaaaa'
      })
    end

    let!(:comment) do
      comment = post.comments.build({
        content: 'aaaaa'
      })
    end


    it 'コメントを保存できる' do
 
      comment.user_id = user.id
      expect(comment).to be_valid
  
    end


  end

  
end
