class CreateHits < ActiveRecord::Migration[6.1]
  def change
    create_table :hits do |t|
      t.belongs_to :link, foreign_key: true
      t.inet :address

      t.timestamps
    end
  end
end
