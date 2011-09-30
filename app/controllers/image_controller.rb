require 'iqengines'
require 'json'
require 'image_size'
class ImageController < ApplicationController
  def index
  end

  def upload_images
    begin
      file = Image.save_image(params[:image])
      open(file) do |fh|
        @img_size = ImageSize.new(fh)
      end
      if((@img_size.get_width.to_i <= 600) && (@img_size.get_height.to_i <= 600))
        image = Image.create(:path => file)
        Delayed::Job.enqueue(FetchData.new(image.id))
        flash[:message] = "Images Uploaded Succuessfully"
        redirect_to :action => 'index'
      else
        system("rm", file)
        raise "Image size should be less than 600 x 600"
      end
    rescue => ex
      flash[:message] = ex.message
      redirect_to :action => 'index'
    end
  end
end
