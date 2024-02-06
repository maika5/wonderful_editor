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
class Article < ApplicationRecord
  # Articleは一つのUserに所属しています(Article belongs to a User.) 
  belongs_to :user

  # ArticleはたくさんのCommentを持っています(Article has many Comments.)
  has_many :comments, dependent: :destroy

  # ArticleはたくさんのCommentを持っています(Article has many article_likes.)
  has_many :article_likes, dependent: :destroy

  validates :title, :body, presence: true

  # 0が「draft」、1が「published」で操作／参照できるようになる
  # 公開済み(published) / 下書き(draft)
  enum status: { draft: 0, published: 1 }
end
