class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @articles = Article.includes(:user).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title,:description,:image).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
