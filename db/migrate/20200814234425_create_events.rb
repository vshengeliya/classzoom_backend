class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.text :description
      t.string :zoom_url
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
