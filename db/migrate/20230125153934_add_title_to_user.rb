class AddTitleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :title, :text
  end
end
