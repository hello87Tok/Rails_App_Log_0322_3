class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :article_categories
  has_many :categories,through: :article_categories


  def self.search(search)
    return Article.all unless search

    Article.where('title LIKE(?)', "%#{search}%")
  end
end
