class Api::ArticlesController < ApplicationController
  before_action :authorize, only: [:create, :update, :destroy]
  before_action :set_article, only: [:update, :destroy]

  def show
    @article = Article.find_by(slug: params[:slug])

    if @article
      @user = @article.author
      render json: single_article_response_json, status: :ok
    else
      render json: { errors: { 'article' => ['is not found'] } }, status: :not_found
    end
  end

  def create
    @article = Article.create(article_params.merge(author: @user))

    if @article.valid?
      render json: single_article_response_json, status: :created
    else
      render json: { errors: @article.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: single_article_response_json, status: :ok
    else
      render json: { errors: @article.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
  end

  private
  def article_params
    params.require(:article).permit(:title, :description, :body)
  end

  def set_article
    @article = @user.articles.find_by(slug: params[:slug])
    if !@article
      render json: { errors: { 'article' => ['is not found'] } }, status: :not_found
    end
  end

  def single_article_response_json
    {
      article: {
        slug: @article.slug,
        title: @article.title,
        description: @article.description,
        body: @article.body,
        createdAt: @article.created_at,
        updatedAt: @article.updated_at,
        author: {
          username: @user.username,
          bio: @user.bio,
          image: @user.image,
          following: false
        }
      }
    }
  end
end
