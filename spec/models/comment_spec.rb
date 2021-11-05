require 'rails_helper'

RSpec.describe Comment, type: :model do

  it '内容が入力されていれば、コメントを保存できる' do

    user = User.create!({
      email: 'test@example.com',
      password: 'password',
      username: 'aaaaa'
    })

    post = user.posts.build({
      picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/heart.png')),
      content: 'aaaaa'
    })

    comment = post.comments.build({
      content: 'aaaaa'
    })

    comment.user_id = user.id

    expect(comment).to be_valid

  end
  
end
