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
      born: params[:photo][:born],
      description: params[:photo][:description],
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
    @photo.born = params[:photo][:born]
    @photo.description = params[:photo][:description]
    @photo.save
    redirect_to "/photos"
  end

  def destroy
    @photo = Photo.find_by(id: params[:id])
    @photo.destroy
    redirect_to "/photos", status: :see_other
  end
end
