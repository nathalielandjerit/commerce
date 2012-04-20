class SwitchToDevise < ActiveRecord::Migration
  def up
  	change_table :users do |t|
  		t.remove :hashed_password, :salt, :email
  	end
  end

  def down
  	change_table :users do |t|
  		t.string :hashed_password
  		t.string :salt
  		t.string :email
  	end
  end
end
