class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    render template: "photos/index"
  end

  def show
    @photo = Photo.find(params[:id])
    render template: "photos/show"
  end

  def new
    @photo = Photo.new(
      name: params[:photo][:name],
      width: params[:photo][:width],
      height: params[:photo][:width],
    )

    if @photo.save
      redirect_to "/photos"
    else
      render json: { errors: @photo.errors.full_messages }, status: unprocessable_entity
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
