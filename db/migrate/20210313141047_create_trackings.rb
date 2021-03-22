class CreateTrackings < ActiveRecord::Migration[6.1]
  def change
    create_table :trackings do |t|
      t.references :book, null: false, foreign_key: true
      t.datetime :date
      t.integer :page_no
      t.timestamps
    end
  end
end
