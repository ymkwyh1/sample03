class CreateTimelines < ActiveRecord::Migration[6.1]
  def change
    create_table :timelines do |t|
      t.references :user,           null: false
      t.timestamps
    end
  end
end
