class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :author
      t.integer :pages
      t.string :genre
      t.timestamps
    end
  end
end
