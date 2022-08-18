class CreateSpeeches < ActiveRecord::Migration[7.0]
  def change
    create_table :speeches do |t|
      t.string :president_name
      t.integer :country_age
      t.string :tagline
      t.text :content

      t.timestamps
    end
  end
end
