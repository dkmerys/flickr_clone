class ImagesController < ApplicationController

  def index
    @images = Image.all
    render :index
  end

  def new
    @image = Image.new
    render :new
  end

  def create
    @image = Images.new(image_params)
    if @image.save
      flash[:notice] = "Image successfully added!"
      redirect_to images_path
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
    render :edit
  end

  def show
    @image = Image.find(params[:id])
    render :show
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Image successfully updated!"
      redirect_to images_path
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destory
    flash[:notice] = "Image successfully destroyed"
    redirect_to images_path
  end

  private
    
  def image_params
    params.require(:image).permit(:id, :tags)
  end
end
