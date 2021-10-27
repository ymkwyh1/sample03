class Timelines < ActiveRecord::Migration[6.1]
  def change
    drop_table :timelines
  end
end
