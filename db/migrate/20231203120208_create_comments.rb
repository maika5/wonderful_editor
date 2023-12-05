class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      # t.references カラムが他のテーブルを参照していることを示す
      # foreign_key: true 外部キーであることを示す つまり　
      # 外部キーの指定:user、article　user・articleテーブルの値しか選択できないように制限
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
