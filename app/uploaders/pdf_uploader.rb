class PdfUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_path(for_file = filename)
    self.model.class.name.underscore.pluralize + (version_name ? "/" + version_name.to_s : '') + "/" + "#{model.id}.pdf"
  end
end