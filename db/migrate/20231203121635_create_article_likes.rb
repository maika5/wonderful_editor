class CreateArticleLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :article_likes do |t|
      # t.references カラムが他のテーブルを参照していることを示す
      # null: false  空欄を許可しないという指定
      # foreign_key: true 外部キーであることを示す
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
