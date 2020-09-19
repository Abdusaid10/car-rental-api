class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.references :manufacturer, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :model, nul: false
      t.numeric :price
      t.string :status
      t.string :color
      t.string :year
      t.text :description

      t.timestamps
    end
  end
end
