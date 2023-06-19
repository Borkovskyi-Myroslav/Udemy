class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: "Article has been created" }
      else
        flash.now[:danger] = "Article has not been created"
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  def show
  @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
