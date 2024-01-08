class Api::V1::BaseApiController < ApplicationController
  # APIのバージョン1（V1）のためのベースとなるコントローラクラス
  def current_user
    # @current_user ：現在のユーザーを表す変数
    # ||= ：「または等しい」の意味 もし左側が nil または false  なら右側の値を代入
    # user.first : 仮実装としてusersテーブルの一番初めのユーザーを取得
    @current_user ||= User.first
  end
end
