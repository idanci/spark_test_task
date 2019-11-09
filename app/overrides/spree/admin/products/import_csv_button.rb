Deface::Override.new(virtual_path: 'spree/admin/products/index',
                     name: 'import_csv_button',
                     insert_before: "erb[silent]:contains('if can?(:create, Spree::Product)')",
                     partial: 'spree/products/import_csv_button')
