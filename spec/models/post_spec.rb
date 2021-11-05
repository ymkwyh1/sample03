require 'rails_helper'

RSpec.describe Post, type: :model do

  context '写真と内容が入力されている' do

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
 

    it '投稿を保存できる' do
  
      expect(post).to be_valid
  
    end

  end
  
end
