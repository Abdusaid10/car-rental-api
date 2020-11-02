class AddLogoToManufacturers < ActiveRecord::Migration[6.0]
  def change
    add_column :manufacturers, :logo, :string
  end
end
