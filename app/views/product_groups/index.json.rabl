collection @product_groups
attributes(:id, :name, :slug, :description)
child(:products) { attributes(:id, :name, :price, :slug) }