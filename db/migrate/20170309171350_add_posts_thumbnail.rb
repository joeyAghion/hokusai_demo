class AddPostsThumbnail < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :thumbnail_url, :string, limit: 1023
  end
end
