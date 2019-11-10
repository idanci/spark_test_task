Spree::Admin::ProductsController.class_eval do
  def import_csv
    product_upload = ProductUpload.create!
    product_upload.csv_file.attach(params[:file])

    # ProductsImportJob.perform_later(product_upload.id)
    ProductsImportJob.perform_now(product_upload.id)

    redirect_to admin_products_path
  end

  def import
  end
end
