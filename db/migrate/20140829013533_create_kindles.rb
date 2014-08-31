class CreateKindles < ActiveRecord::Migration
  def change
    create_table :kindles do |t|
      t.integer :user_id
      t.string :name
      t.string :email

      t.timestamps
    end

    add_index :kindles, :user_id
    add_index :kindles, :name
    add_index :kindles, :email
  end
end
