class Store < ApplicationRecord
	belongs_to :planet

  def items
    {narcotics: narcotics, plastic: plastic, scrap_metal: scrap_metal, medicine: medicine, grain: grain, gold: gold, missiles: missiles, bananas: bananas, uranium: uranium, tang: tang, potatoes: potatoes, furs: furs, steel: steel}
  end
end
