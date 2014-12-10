class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      
      t.references :content_owner, polymorphic: true
      t.string "type", :limit => 10, :default => "comment"
      t.string "content_type", :limit => 5, :default => "text"
      t.string "content"
      t.integer "likes", :default =>0
      t.integer "dislikes", :default =>0
      t.timestamps
    end
    
    add_index :contents, ["content_owner_id", "content_owner_type"]

  end
  
end
