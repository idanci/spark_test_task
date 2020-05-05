module Importers
  class ProductsImporter
    def initialize(product_upload_id)
      @product_upload = ProductUpload.find_by(id: product_upload_id)
    end

    def run
      return unless attachment_present?

      @product_upload.update(status: 'processing')

      parse_products
      save_products

      @product_upload.update(status: 'done')

    rescue Exception => ex
      @product_upload.update(status: 'failed')
    end

  private

    def parse_products
      @products = ProductsParser.new(@product_upload.csv_file.download).parse
    end

    def save_products
      @products.each do |product_hash|
        next if Spree::Product.where(slug: product_hash['slug']).exists?

        product = Spree::Product.create!(
          name: product_hash['name'],
          price: product_hash['price'],
          description: product_hash['description'],
          slug: product_hash['slug'],
          available_on: date_for(product_hash),
          shipping_category_id: category_for(product_hash)
        )
      end
    end

    def attachment_present?
      Timeout::timeout(10) do
        loop do
          return true if @product_upload&.csv_file&.attached?
        end
      end
    rescue Timeout::Error
      false
    end

    def category_for(product_hash)
      @default_category ||= Spree::ShippingCategory.find_by(name: 'Default').id
      Spree::ShippingCategory.find_by_name(product_hash['category'] || product_hash['shipping_category_id'])&.id || @default_category
    end

    def date_for(product_hash)
      Time.parse(product_hash['available_on'])
    rescue ArgumentError
      Time.now
    end
  end
end
