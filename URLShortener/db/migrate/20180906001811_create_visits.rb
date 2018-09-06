class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.timestamps
      t.integer :short_url_id
      t.integer :user_id
    end
    
    add_index :visits, :short_url_id
    add_index :visits, :user_id
  end
end
