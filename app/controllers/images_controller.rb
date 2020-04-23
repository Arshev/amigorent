class ImagesController < ApplicationController
  before_action :set_car

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @car.save
    redirect_back(fallback_location: upload_photos_admin_path)
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @car.save
    redirect_back(fallback_location: upload_photos_admin_path)
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def add_more_images(new_images)
    images = @car.images 
    images += new_images
    @car.images = images
  end

  def remove_image_at_index(index)
     remain_images = @car.images
     if index == 0 && @car.images.size == 1
       @car.remove_images!
     else
       deleted_image = remain_images.delete_at(index) 
       deleted_image.try(:remove!)
       @car.images = remain_images
     end
  end

  def images_params
    params.require(:car).permit({images: []}) # allow nested params as array
  end
end
