--Team Aqua's Great Ball (Double Crisis 27/34)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	aux.AddSetcode(c,SETNAME_TEAM_AQUA,SETNAME_BALL)
	--search (to hand)
	aux.PlayTrainerFunction(c,aux.CheckDeckFunction(PLAYER_SELF),scard.op1)
end
scard.trainer_item=true
--search (to hand)
function scard.thfilter1(c)
	return c:IsBasicPokemon() and c:IsSetCard(SETNAME_TEAM_AQUA) and c:IsAbleToHand()
end
function scard.thfilter2(c)
	return c:IsBasicEnergy() and c:IsEnergy(ENERGY_W) and c:IsAbleToHand()
end
function scard.op1(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g1=Duel.SelectMatchingCard(tp,scard.thfilter1,tp,LOCATION_DECK,0,0,1,nil)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g2=Duel.SelectMatchingCard(tp,scard.thfilter2,tp,LOCATION_DECK,0,0,1,nil)
	g1:Merge(g2)
	if g1:GetCount()>0 then
		Duel.SendtoHand(g1,PLAYER_OWNER,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g1)
	else
		Duel.ShuffleDeck(tp)
	end
end
