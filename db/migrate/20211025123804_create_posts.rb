class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user,           null: false
      t.text :content,              null: false, default: ""
      t.timestamps
    end
  end
end
