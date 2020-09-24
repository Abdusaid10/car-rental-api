class RemoveImagesFromCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :images, :string
  end
end
