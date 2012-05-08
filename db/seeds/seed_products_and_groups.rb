# encoding: UTF-8

def seed_products_and_groups

  shows = pg('Shows')
  
  ##########
  # FOOD 
  ##########
  food = pg('Food')
    apps = pg('Appetizers', food)
      salads = pg('Salads', food)
        prod('Cesar', salads)
        prod('Chopped', salads)
        
      prod('Sliders', apps)
      prod('Nachos', apps)
      prod('Wings', apps)
      
    entrees = pg('Entrees', food)
      prod('Hamburger', entrees)
      prod('Chicken Sandwich', entrees)
      prod('Wings', entrees)
      
    desserts = pg('Appetizers', food)
    
  ##########
  # BEVERAGES 
  ##########
  bev = pg('Beverage')
    soft = pg('Soft', bev)
      prod('Coke', soft)
      prod('Sprite', soft)
      prod('Fanta', soft)
      prod('Club Soda', soft)
      
    beer = pg('Beer', bev)
      prod('Miller', beer)
      prod('Bud', beer)
      prod('Fosters', beer)
      prod('Heineken', beer)
    
    wine = pg('Wine', bev)
    
      prod('House Red', wine)
      prod('House White', wine)
      prod('Pouilly Frisé', wine)
      prod('Merlot', wine)
      
    liquor = pg('Liquor', bev)
    
      prod('Jack Daniels', liquor)
      prod('Rails Rum', liquor)
      prod('Vodka', liquor)
      prod('Water', liquor)
  
  
  
end


def pg(name, parent=nil)
  p = ProductGroup.new(:name => name)
  unless parent.nil?
    p.parent = parent
  end
  p.save!
  p
end

def prod(name, parent = nil, price = 0.00)
  desc = Forgery::LoremIpsum.text(:sentence)
  price = Forgery::Monetary.money
  p = Product.new(:name => name, :description => desc, :price => price )
  unless parent.nil?
    p.product_group = parent
  end
  p.save!
  p
end