require 'roo'
class HomeController < ApplicationController
  def index
  end

  def uploadFile
    payload = Roo::Spreadsheet.open(params['file'].tempfile)
    payload = payload.map {|a|  payload.first.zip(a).to_h unless a == payload.first }.compact
    @count = payload.count
  
    payload.each() do |row|

      if !client = Client.where(name: row['Cliente']).first
        client = Client.create(name: row['Cliente'])
      end
      if !product = Product.where(description: row['Descripción del Producto']).first
        product = Product.create(description: row['Descripción del Producto'], price: row['Precio por pieza'])
      end
      if !vendor = Vendor.where(name: row['Nombre del Vendedor']).first
        vendor = Vendor.create(name: row['Nombre del Vendedor'], address: row['Dirección del vendedor'])
      end
      Sale.create(client_id: client.id, vendor_id: vendor.id, product_id: product.id, quantity: row['Numero de piezas'])
    end
    render 'home/index'
  end

end
