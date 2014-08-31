class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title

      t.timestamps
    end

    add_index :books, :user_id
    add_index :books, :title
  end
end
