--Water Energy (EX Ruby & Sapphire 106/109) (Alias)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	--energy
	aux.EnableEnergyAttribute(c)
	--provide energy
	aux.EnableProvideEnergy(c,ENERGY_W)
end
scard.energy_basic=true
