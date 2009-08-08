module Paperclip

  module ClassMethods
    def has_attached_file_with_destroy(*args)
      has_attached_file_without_destroy *args
      name = args[0]
      
      attr_accessor_with_default "#{name}_destroy", false
      before_save :clear_attached_files
    end
    
    alias_method_chain :has_attached_file, :destroy
  end
  
  module InstanceMethods
    def clear_attached_files
      each_attachment do |name, attachment|
        attachment_for(name).clear if self.send("#{name}_destroy").to_s == "true"
      end
    end
  end

  class Attachment
    def authenticated_url(style = default_style)
      if @storage.to_s == "s3" and file?
        AWS::S3::S3Object.url_for(path(style), @bucket)
      else
        url
      end
    end
  end
  
end