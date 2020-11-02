class RemoveLogoFromManufacturers < ActiveRecord::Migration[6.0]
  def change
    remove_column :manufacturers, :logo, :string
  end
end
