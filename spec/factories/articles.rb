# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  status     :string           default(NULL)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
FactoryBot.define do
  factory :article do
    title { Faker::Lorem.word } # ランダムな単語を生成
    body { Faker::Lorem.sentence } # ランダムな文章を生成
    user # articleに紐付くuserをランダムに生成
    # userはuserファクトリーがあるのでここではfaker記載不要　

    trait :draft do
      status { :draft }
    end

    trait :published do
      status { :published }
    end
  end
end
