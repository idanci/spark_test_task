class CreateProductUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :product_uploads do |t|
      t.string :status, default: 'processing', null: false

      t.timestamps null: false
    end
  end
end
