--Psychic Energy (EX Holon Phantoms 109/110) (Alias)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	--energy
	aux.EnableEnergyAttribute(c)
	--provide energy
	aux.EnableProvideEnergy(c,ENERGY_P)
end
scard.energy_basic=true
