--Inkay (Kalos Starter Set 18/39)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	aux.AddHeight(c,1.04)
	--pokemon
	aux.EnablePokemonAttribute(c)
	--damage
	local e1=aux.AddPokemonAttack(c,0,nil,aux.AttackDamageOperation(10))
	e1:SetAttackCost(ENERGY_D)
end
scard.pokemon_basic=true
scard.weakness_x2={ENERGY_F}
scard.resistance_20={ENERGY_P}
