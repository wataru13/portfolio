class AddZoomlinkToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zoomlink, :string
  end
end
