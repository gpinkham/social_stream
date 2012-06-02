class Audio < Document  
  has_attached_file :file, 
                    :url => '/:class/:id.:extension',
                    :path => ':rails_root/documents/:class/:id_partition/:style',
                    :styles => {:webma => {:format => 'webm'}                                
                    },:processors => [:ffmpeg]
  
  process_in_background :file    
  
  define_index do
    activity_object_index

    indexes file_file_name, :as => :file_name
  end 
              
  # Thumbnail file
  def thumb(size, helper)
      "#{ size.to_s }/audio.png"
  end
  
end
