class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user,           null: false
      t.string   :name,          null: false
      t.text     :introduction,  null: false
      t.timestamps
    end
  end
end
