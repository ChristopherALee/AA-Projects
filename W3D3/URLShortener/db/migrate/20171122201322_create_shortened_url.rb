class CreateShortenedUrl < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null: false
      t.string :short_url, null: false
      t.string :user_id, null: false
      t.timestamps
    end
    
    add_index :shortened_urls, :short_url
  end
end
