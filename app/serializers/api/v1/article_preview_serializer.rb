class Api::V1::ArticlePreviewSerializer < ActiveModel::Serializer
  # レスポンスに含める属性を指定。
  # ここではid, タイトル, 更新日を指定。
  attributes :id, :title, :updated_at
  # API のエンドポイント /api/v1/articles データを取得するとき
  # その記事を書いたユーザー情報も返されるようになる
  belongs_to :user, serializer: Api::V1::UserSerializer # 　追記
end
