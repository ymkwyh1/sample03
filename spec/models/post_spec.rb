require 'rails_helper'

RSpec.describe Post, type: :model do

  it '写真と内容が入力されていれば、投稿を保存できる' do

    user = User.create!({
      email: 'test@example.com',
      password: 'password',
      username: 'aaaaa'
    })

    post = user.posts.build({
      picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/heart.png')),
      content: 'aaaaa'
    })

    expect(post).to be_valid

  end

end
