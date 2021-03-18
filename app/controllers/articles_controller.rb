class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.includes(:user).order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
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

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to root_path
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(article)
    else
      render 'edit'
    end
  end

  def search
    @articles = Article.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end


  private
  def article_params
    params.require(:article).permit(:title,:description,:image,category_ids: []).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own article"
      redirect_to root_path
    end
  end

end
