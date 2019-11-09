Spree::Admin::ProductsController.class_eval do
  def import_csv
    product_upload = ProductUpload.create!(created_by: current_spree_user.id)
    product_upload.csv_file.attach(params[:file])

    redirect_to admin_products_path
  end

  def import
  end
end
