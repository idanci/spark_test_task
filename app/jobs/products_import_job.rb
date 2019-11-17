class ProductsImportJob < ApplicationJob
  queue_as :default

  def perform(product_upload_id)
    Importers::ProductsImporter.new(product_upload_id).run
  end
end
