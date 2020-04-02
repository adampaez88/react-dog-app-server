class CommentsController < ApplicationController
    before_aciton :authenticate, only: [:create, :update, :destroy]
    
    def index
        comments = Comment.all
        render json: {commets: comments}
    end

    def create
        comment = Comment.create(
            content: params[:content],
            user_id: params[:user_id],
            dog_id: params[:dog_id]
        )
        render json: {comment: comment}
    end

    def update
        comment = Comment.find(params[:id])
        comment.update(
            content: params[:content],
            user_id: params[:user_id],
            dog_id: params[:dog_id]
        )
        render json: {comment: comment}
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: {status: 204}
    end

    private 

    def comments_params
        params.require(:comment).permit(:content, :dog_id, :user_id)
    end
end
