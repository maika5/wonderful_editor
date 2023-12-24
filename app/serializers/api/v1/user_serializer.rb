class Api::V1::UserSerializer < ActiveModel::Serializer
  # レスポンスに含める属性を指定。
  # ここではid, タイトル, 更新日を指定。
  attributes :id, :name, :email
end
