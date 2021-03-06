class ArticlesController < ApplicationController

  # Performs this action before the required method
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.page(params[:page]).per(5)
  end

  def new
    # This is for the error case from create
    @article = Article.new
  end

  def create
    #render plain: params[:article]
    # Creating a new article from the params received on the post call.
    # Additionally, we are white listing title and description
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save

      flash[:notice] = "Article was created successfully!"

      # get this article_path from rails routes --expanded
      # can also use redirect_to @article
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  # Find the article and display the form with the details
  def edit
  end

  # Update the article on the database
  def update
    @article.update(article_params)
    if @article.save
      flash[:notice] = "Article was updated successfully!"

      # get this article_path from rails routes --expanded
      # can also use redirect_to @article
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end

end