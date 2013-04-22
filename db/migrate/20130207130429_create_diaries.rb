class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.datetime :title
      t.text :body

      t.timestamps
    end
  end
end
