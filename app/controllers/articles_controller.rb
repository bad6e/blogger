class ArticlesController < ApplicationController
  include ArticlesHelper

  before_action :load_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}'' has been saved!"
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' has been updated!"

    redirect_to article_path(@article)
  end

  private

    def load_article
      @article = Article.find(params[:id])
    end
end
