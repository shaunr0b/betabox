def strip_blank_hash(str)
  str = str[0] if str.class.to_s == "Array"
  str = str.to_s 
  str = str == '{}' ? nil : str.to_s
end


def new_product_group(name, parent=nil)
  p = ProductGroup.new(:name => name)
  unless parent.nil?
    p.parent = parent
  end
  p.save!
  p
end

def new_product(name, parent = nil, price = 0.00)
  desc = Forgery::LoremIpsum.text(:sentence)
  price = Forgery::Monetary.money
  p = Product.new(:name => name, :description => desc, :price => price )
  unless parent.nil?
    p.product_group = parent
  end
  p.save!
  p
end

def parse_products(node, parent = nil)
  # Recursively parse a YAML => hash of product groups and products
  node.each do |k,v|
    parent_string = parent.nil? ? '' : "#{parent.name}:"
    puts "### SEEDING PRODUCT GROUP #{parent_string}#{k}"
    product_group = ProductGroup.create(:name => k)
    
    unless parent.nil? 
      product_group.parent = parent
      product_group.save!
    end
    
    if v.class.to_s == 'Hash' # Parent nodes: groups
      parse_products v, product_group
    elsif v.class.to_s == 'Array' # End nodes: products
      v.each do |product|
        price = Forgery::Monetary.money
        inventory = rand(1000)
        puts "#### SEEDING PRODUCT #{product} (#{inventory} at $#{price})"
        unless product == '' && product.nil? # no blanks
          prod = Product.create(:name => product, :price => price, :inventory => inventory)
          prod.product_group  = product_group
          prod.save
        end
      end
    end
  end
end

