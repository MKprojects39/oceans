class AddArticleTagToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :article_tag, :text
  end
end
