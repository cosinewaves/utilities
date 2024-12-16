--[[

	Name: RarityProviderService.lua
	Date: 16/12/24
	Author: cosinewaves
	
	Description: Psuedorandom number generated table key picker from rarity table values
  Example: 
      local myRarities: {[string]: number} = {
				Basic = 1,
				Rare = 2,
				Epic = 3,
				Legendary = 4,
			}
	
			RarityProviderService(myRarities) -> "Basic" | "Rare" | "Epic" | "Legendary"

]]


return function (rarities_table: {[string]: number}): string
	local RNG: Random = Random.new(os.time())
	local weight: number = 0
	
	do
		for _: number | string, rarity_number: number in rarities_table do
			weight += rarity_number
		end
	end
	
	local randomNumber: number = RNG:NextNumber(0, weight)
	weight = 0
	
	do
		for k, v in rarities_table do
			weight += v
			if weight >= randomNumber then
				return k
			end
		end	
	end
	
end
