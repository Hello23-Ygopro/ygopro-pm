--Farfetch'd (Kalos Starter Set 25/39)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	aux.AddHeight(c,2.07)
	--pokemon
	aux.EnablePokemonAttribute(c)
	--damage
	local e1=aux.AddPokemonAttack(c,0,nil,aux.AttackDamageOperation(30))
	e1:SetAttackCost(ENERGY_C)
end
scard.pokemon_basic=true
scard.weakness_x2={ENERGY_L}
scard.resistance_20={ENERGY_F}
