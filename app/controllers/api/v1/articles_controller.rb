class Api::V1::ArticlesController < ApplicationController
    def index
        @articles = Article.all
        render json: @articles
    end

    def show
        @article = Article.find(params[:id])
        render json: @article
    end

    def create
        @article = Article.create(article_params)
        if @article.valid?
            render json: @article
        else
            render json: {errors: @article.errors.full_messages}
        end
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        if @article.valid?
            render json: @article
        else
            render json: {errors: @article.errors.full_messages}
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @comments = Comment.where(article_id: @article.id).destroy_all
        @article.destroy
        redirect_to api_v1_articles_path
    end

    private
    
    def article_params
        params.permit(:title, :description)
    end
end
