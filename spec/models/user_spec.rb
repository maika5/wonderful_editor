# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  image                  :string
#  name                   :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
require "rails_helper"

# spec ファイルは３つの構文で成り立つ
# describe は 「テストの対象」を指定
# context は 「テストの条件」を指定「〜するとき」
# it は 「結果」を指定
RSpec.describe User, type: :model do
  context "ユーザー情報が全てあるとき" do
    it "ユーザー登録に成功しました" do
      user = User.new(name: "foo", email: "foo@example.com", password: "abc0000")
      # expect(user.valid?).to eq true
      # be_valid  有効であるか
      expect(user).to be_valid # user.valid? が true になればパスする
    end
  end

  context "名前のみ入力してるとき" do
    it "ユーザー登録に失敗しました" do
      user = User.new(name: "foo")
      expect(user).to be_invalid # be_invalid  無効であるか
    end
  end

  context "emailが存在しないとき" do
    it "ユーザー登録に失敗しました" do
      user = User.new(name: "foo", password: "abc0000")
      expect(user).to be_invalid
    end
  end

  context "passwordが存在しないとき" do
    it "ユーザー登録に失敗しました" do
      user = User.new(name: "foo", email: "foo@example.com")
      expect(user).to be_invalid
    end
  end
end
