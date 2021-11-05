require 'rails_helper'

RSpec.describe 'Posts', type: :request do

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
  
  describe 'GET /posts' do
    it '200ステータスが返ってくる' do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end



end
