class CommentsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new
    render :new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
    if comment.save
      redirect_to image_path(@image)
      flash[:notice] = "Comment successfully added to image"
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:image_id])
    @comment = Comment.find(params[:id])
    render :edit
  end

  def show
    @image = Image.find(params[:image_id])
    @comment = Comment.find(params[:id])
    render :show
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to image_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to image_path(@comment.image)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content_body, :author)
  end

end
