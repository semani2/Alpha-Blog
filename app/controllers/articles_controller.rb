class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new

  end

  def create
    #render plain: params[:article]
    # Creating a new article from the params received on the post call.
    # Additionally, we are white listing title and description
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save

    # get this article_path from rails routes --expanded
    # can also use redirect_to @article
    redirect_to article_path(@article)
  end
end