class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimale, :precision=>8, :scale=>2, :default=>0

  end
end
