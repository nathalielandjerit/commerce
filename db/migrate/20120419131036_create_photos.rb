class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :product_id
      t.has_attached_file :image

      t.timestamps
    end
  end
end
