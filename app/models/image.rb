class Image < ActiveRecord::Base
  def self.save_image(upload)
    name =  upload['image_path'].original_filename
    format = name.split('.')[-1].downcase
    if(format == 'jpg' || format == 'jpeg')
      directory = "#{RAILS_ROOT}/public/images"
      # create the file path
      path = File.join(directory, name)
      # write the file
      File.open(path, "wb") { |f| f.write(upload['image_path'].read) }
      return path
    else
      raise 'Image Format error. Upload only jpg images'
    end
  end

end
