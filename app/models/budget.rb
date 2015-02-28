class Budget < ActiveRecord::Base
  mount_uploader :upload, PdfUploader
end