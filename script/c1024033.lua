--Furfrou (Kalos Starter Set 33/39) (Alias)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	aux.AddHeight(c,3.11)
	--pokemon
	aux.EnablePokemonAttribute(c)
	--paralyzed
	local e1=aux.AddPokemonAttack(c,0,nil,scard.op1)
	e1:SetAttackCost(ENERGY_C,ENERGY_C)
	--damage
	local e2=aux.AddPokemonAttack(c,1,nil,aux.AttackDamageOperation(50))
	e2:SetAttackCost(ENERGY_C,ENERGY_C,ENERGY_C)
end
scard.pokemon_basic=true
scard.weakness_x2={ENERGY_F}
--paralyzed
function scard.op1(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetActivePokemon(1-tp)
	Duel.AttackDamage(e,20)
	if tc:IsInPlay() and Duel.TossCoin(tp,1)==RESULT_HEADS then
		tc:ApplySpecialCondition(tp,SPC_PARALYZED)
	end
end
