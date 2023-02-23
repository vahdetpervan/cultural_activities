class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.text :title
      t.date :start_date
      t.date :end_date
      t.string :web_source

      t.timestamps
    end
  end
end
