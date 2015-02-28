class PdfUploader < CarrierWave::Uploader::Base
  storage :fog

end