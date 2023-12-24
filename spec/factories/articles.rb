FactoryBot.define do
  factory :article do
    title { Faker::Lorem.word } # ランダムな単語を生成
    body { Faker::Lorem.sentence } # ランダムな文章を生成
    user # articleに紐付くuserをランダムに生成
    # userはuserファクトリーがあるのでここではfaker記載不要　
  end
end
