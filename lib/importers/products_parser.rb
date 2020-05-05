require 'csv'

module Importers
  class ProductsParser
    def initialize(file)
      @file = file
      @products = []
      @headers = {}
    end

    def parse
      @header_parsed = false

      CSV.parse(@file, :col_sep => ';') do |row|
        @header_parsed ? parse_row(row) : parse_header_row(row)
      end

      @products
    end

  private

    def parse_row(row)
      return unless valid_row?(row)

      @products << @headers.each_with_object({}) do |(attribute, index), hash|
        hash[attribute] = row[index] unless row[index].nil?
      end
    end

    def parse_header_row(row)
      return unless valid_header?(row)

      row.each_with_index do |column, index|
        case column
        when 'name', 'description', 'price', 'slug', 'category', 'shipping_category_id'
          @headers[column] = index
        when 'availability_date', 'available_on'
          @headers['available_on'] = index
        when 'stock', 'stock_total'
          @headers['stock'] = index
        end
      end

      @header_parsed = true
    end

    def valid_header?(row)
      row.include?('name') && row.include?('price') && row.any? { |field| field =~ /category/ }
    end

    def valid_row?(row)
      row[@headers['name']] &&
      row[@headers['price']] &&
      (row[@headers['category']] || row[@headers['shipping_category_id']])
    end
  end
end
