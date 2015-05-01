class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books, :id => false do |t|
      t.column :book_id, 'serial NOT NULL PRIMARY KEY'
      t.string :title
      t.string :description
      t.string :author

      t.timestamps null: false
    end
  end
end
