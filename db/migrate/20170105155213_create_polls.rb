class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :poll_name
      t.belongs_to :user
      t.timestamps
    end
  end
end
