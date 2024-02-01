class AddStatusToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :status, :string, default: 0
  end
end
