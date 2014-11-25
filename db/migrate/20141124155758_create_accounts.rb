class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string 'first_name', :limit => 50
      t.string 'last_name', :limit => 50
      t.string 'email', :null => false
      t.string 'password', :null =>false
      t.timestamps
    end
  end
  def down
  	drop_table :users
  end
end
