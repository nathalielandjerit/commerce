class AddTotalToCards < ActiveRecord::Migration
  def change
    add_column :cards, :total, :decimal, :precision => 8, :scale => 2, :default => 0

  end
end
