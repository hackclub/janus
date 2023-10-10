class CommentsController < ApplicationController
  before_action :set_commentable, only: [:new, :create]
  before_action :set_comment, except: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    if @commentable.comments.create(comment_params)
      redirect_to @commentable
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def set_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return @commentable = $1.classify.constantize.find(value)
      end
    end
  end

  def set_comment
    @comment = Comment.where(creator: Current.user).find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
