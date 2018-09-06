class CreateShortenedUrl < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.timestamps
      t.integer :user_id
      t.string :long_url
      t.string :short_url
    end
      
    add_index :shortened_urls, :user_id, unique: true
    add_index :shortened_urls, [:short_url, :long_url], unique: true
    add_index :shortened_urls, :long_url, unique: true
  end
end
