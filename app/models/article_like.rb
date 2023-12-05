# == Schema Information
#
# Table name: article_likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint
#
# Indexes
#
#  index_article_likes_on_article_id  (article_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#
class ArticleLike < ApplicationRecord
  # article_likeは一つのUserに所属しています(article_like belongs to a User.) 
  belongs_to :user
  # carticle_likeは一つのarticleに所属しています(article_like belongs to a article.) 
  belongs_to :article
end
