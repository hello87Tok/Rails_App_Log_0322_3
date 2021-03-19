class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :article_categories
  has_many :categories,through: :article_categories

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 200}
  validates :user_id, presence: true

  def self.search(search)
    return Article.all unless search

    Article.where('title LIKE(?)', "%#{search}%")
  end
end
