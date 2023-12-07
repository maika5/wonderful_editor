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
