--Mysterious Treasure (Forbidden Light 113/131)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	--search (to hand)
	aux.PlayTrainerFunction(c,aux.CheckDeckFunction(PLAYER_SELF),scard.op1,nil,aux.DiscardHandCost(1))
end
scard.trainer_item=true
--search (to hand)
function scard.thfilter(c)
	return c:IsPokemon() and c:IsEnergyType(ENERGY_P+ENERGY_N) and c:IsAbleToHand()
end
function scard.op1(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,scard.thfilter,tp,LOCATION_DECK,0,0,1,nil)
	if g:GetCount()>0 then
		Duel.SendtoHand(g,PLAYER_OWNER,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	else
		Duel.ShuffleDeck(tp)
	end
end
--[[
	Rulings
		Q. Can I play Mysterious Treasure and discard a card if there are no cards left in my deck?
		A. No, you cannot. Discarding the card is a cost not the effect, and you cannot play Trainer cards for no effect.
		(Mar 21, 2019 TPCi Rules Team)
		http://compendium.pokegym.net/compendium-bw.html#652
]]
