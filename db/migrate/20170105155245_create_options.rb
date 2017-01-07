class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :body
      t.belongs_to :question
    end
  end
end