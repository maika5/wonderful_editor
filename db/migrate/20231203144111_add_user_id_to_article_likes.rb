class AddUserIdToArticleLikes < ActiveRecord::Migration[6.1]
  def change
    change_table :article_likes, bulk: true do |t|
      t.column :user_id, :bigint
    end

    add_column :article_likes, null: false
    add_column :article_like,  null: false
  end
end
