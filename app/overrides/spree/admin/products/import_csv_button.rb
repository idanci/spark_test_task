Deface::Override.new(virtual_path: 'spree/admin/products/index',
                     name: 'import_csv_button',
                     insert_before: "erb[silent]:contains('if can?(:create, Spree::Product)')",
                     :text => "<%= button_link_to 'Import CSV', admin_products_import_path %>")
