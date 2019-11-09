Spree::Admin::ProductsController.class_eval do
  def import_csv
    byebug
    redirect_to admin_products_path
  end

  def import
  end
end
