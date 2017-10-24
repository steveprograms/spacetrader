class Store < ApplicationRecord
	belongs_to :planet

  def items
    {narcotics_price: narcotics_price, plastic_price: plastic_price, scrap_metal_price: scrap_metal_price, medicine_price: medicine_price, grain_price: grain_price, gold_price: gold_price, missiles_price: missiles_price, bananas_price: bananas_price, uranium_price: uranium_price, tang_price: tang_price, potatoes_price: potatoes_price, furs_price: furs_price, steel_price: steel_price}
  end
end
