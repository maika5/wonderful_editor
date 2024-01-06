# module Api::V1　は　config/routes.rb　で　URLが　/api/v1/articlesになるように設定
module Api::V1
  class ArticlesController < BaseApiController
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
  end
end
