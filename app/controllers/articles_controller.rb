class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    # This is for the error case from create
    @article = Article.new
  end

  def create
    #render plain: params[:article]
    # Creating a new article from the params received on the post call.
    # Additionally, we are white listing title and description
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save

      flash[:notice] = "Article was created successfully!"

      # get this article_path from rails routes --expanded
      # can also use redirect_to @article
      redirect_to article_path(@article)
    else
      puts @article.errors.full_messages
      render 'new'
    end
  end

  # Find the article and display the form with the details
  def edit
    @article = Article.find(params[:id])
  end

  # Update the article on the database
  def update
    @article = Article.find(params[:id])
    @article.update(params.require(:article).permit(:title, :description))

    if @article.save

      flash[:notice] = "Article was updated successfully!"

      # get this article_path from rails routes --expanded
      # can also use redirect_to @article
      redirect_to article_path(@article)
    else
      puts @article.errors.full_messages
      render 'new'
    end
  end

end