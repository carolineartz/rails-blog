class ArticlesController < ApplicationController
  before_action :get_article, :only => [:show, :edit, :update, :destroy]
  
  include ArticlesHelper


  def index
    @articles = Article.all
  end


  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end


  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end


  def edit
    # @article = Article.find(params[:id])
  end


  def update
    @article.update(article_params)
    # @article = Article.find(params[:id])


    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to action: "index"
  end


  # private

end

















#######################NOTES####################
# MYNOTE: trick to get params: put 'fail' in create and then check the error message:
# {"utf8"=>"✓",
#"authenticity_token"=>"HGhK9feovYRoPqUx/1IWLWoCdHq14TTQPhPgTPEQvcI=",
#  "article"=>{"title"=>"",
#  "body"=>""},
#  "commit"=>"Create Article"}


   #fail => see note
    #MYNOTE: @article = Article.new(params[:article]) => will make blow up for security reasons not a good idea to blindly save parameters sent into us via the params hash (USE STRONG PARAMETERS)
    # MYNOTE: @article.title = params[:article][:title] #one way
    # @article = Article.new(article_params)  # MYNOTE: fix by putting methods require and permit, usually in helper file
