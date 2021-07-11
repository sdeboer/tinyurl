class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.text :destination, null: false, index: {unique: true, name: 'unique_links'}

      t.timestamps
    end
  end
end
