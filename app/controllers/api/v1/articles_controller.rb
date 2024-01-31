# module Api::V1　は　config/routes.rb　で　URLが　/api/v1/articlesになるように設定
module Api::V1
  class ArticlesController < BaseApiController
    before_action :authenticate_user!, only: [:create, :update, :destroy]
    def index
      # orderメソッド　(updated_at: :desc)  は記事を更新日順（昇順）
      articles = Article.order(updated_at: :desc)
      # each_serializer: ArticlesIndexSerializer で記事のデータをJSON形式にして送ってくれる
      render json: articles, each_serializer: Api::V1::ArticlePreviewSerializer
    end

    def show
      # findは modelの検索機能の1つ
      # params[:id]は HTTPリクエストのパラメータから取得された記事のIDを表す
      article = Article.find(params[:id])
      # each_serializer: ArticlesIndexSerializer で記事のデータをJSON形式にして送ってくれる
      render json: article, each_serializer: Api::V1::ArticlePreviewSerializer
    end

    def create
      # current_user.articles.new(article_params)
      # 現在のユーザーに関連付けた新しい Article オブジェクトを作成
      article = current_user.articles.new(article_params)

      if article.save
        # 保存が成功した場合は記事のデータをJSON形式で返す
        # Api::V1::ArticleSerializer  が記事のデータをJSONに変換
        render json: article, serializer: Api::V1::ArticleSerializer
      else
        # 保存に失敗した場合はエラーメッセージを返す
        render json: { error: "記事の保存に失敗しました" }, status: :unprocessable_entity
      end
    end

    def update
      article = current_user.articles.find(params[:id])
      article.update!(article_params)

      render json: article, serializer: Api::V1::ArticleSerializer
    end

    def destroy
      article = current_user.articles.find(params[:id])
      article.destroy!
      render json: article, serializer: Api::V1::ArticleSerializer
    end

    private

      def article_params
        # require: 受け取る値のキーを設定　articleというキーを持つハッシュを取得
        # permit: 許可するカラムを設定 ：articleキーからtitle,bodyのみ許可
        params.require(:article).permit(:title, :body)
      end
  end
end
