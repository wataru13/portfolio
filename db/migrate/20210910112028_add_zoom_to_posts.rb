class AddZoomToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :zoom, :string
  end
end
