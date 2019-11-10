class CreateProductUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :product_uploads do |t|
      t.string :status, default: 'pending', null: false

      t.timestamps null: false
    end
  end
end
