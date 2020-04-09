class Api::V1::CommentsController < ApplicationController
    def index
        @comments = Comment.where(article_id: params[:article_id])
        render json: @comments
    end

    def show
        @comment = Comment.find(params[:id])
        render json: @comment    
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment.valid?
            render json: @comment
        else
            render json: {errors: @comment.errors.full_messages}
        end
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        if @comment.valid?
            render json: @comment
        else
            render json: {errors: @comment.errors.full_messages}
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to api_v1_article_comment_path
    end

    private

    def comment_params
        params.permit(:content, :owner, :article_id)
    end
end
