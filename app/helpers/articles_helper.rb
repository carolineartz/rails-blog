module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def get_article
    @article = Article.find(params[:id])
  end
end
