--Fire Energy (Generations 76/83) (Alias)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	--energy
	aux.EnableEnergyAttribute(c)
	--provide energy
	aux.EnableProvideEnergy(c,ENERGY_R)
end
scard.energy_basic=true
