class Item < ActiveRecord::Base
    has_many :stocks, dependent: :destroy
  attr_accessible :nombre, :espesor, :material, :quantity, :marca
  accepts_nested_attributes_for :stocks

  self.per_page = 50

 def self.search(search_term)
  # where('nombre ILIKE ?', '%#{search_term}%')
  where("CONCAT(nombre, marca, material, espesor) ILIKE '%#{search_term}%'" )
 end

 protected


end
