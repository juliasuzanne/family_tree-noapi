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
    @photo = Photo.new
    render template: "photos/new"
  end

  def create
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

  def edit
    @photo = Photo.find_by(id: params[:id])
    render template: "photos/edit"
  end

  def update
    @photo = Photo.find_by(id: params[:id])
    @photo.name = params[:photo][:name]
    @photo.width = params[:photo][:width]
    @photo.height = params[:photo][:height]
    @photo.save
    redirect_to "/photos"
  end

  def destroy
    @photo = Photo.find_by(id: params[:id])
    @photo.destroy
    redirect_to "/photos", status: :see_other
  end
end
