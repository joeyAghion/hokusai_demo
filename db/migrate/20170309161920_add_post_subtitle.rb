class AddPostSubtitle < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :subtitle, :string, limit: 127
  end
end
