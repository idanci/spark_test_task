class ProductsImportJob < ApplicationJob
  queue_as :default

  def perform(product_upload_id)
    upload = ProductUpload.find_by(id: product_upload_id)
    return unless upload&.csv_file&.attached?

    # parse & save
  end
end
