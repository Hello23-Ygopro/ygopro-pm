--Mr. Briney's Compassion (Dragon 87/97)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	--return
	aux.PlayTrainerFunction(c,aux.CheckCardFunction(scard.thfilter,LOCATION_INPLAY,0),scard.op1)
end
scard.trainer_supporter=true
--return
function scard.thfilter(c)
	return c:IsFaceup() and c:IsPokemon() and not c:IsPokemonex() and c:IsAbleToHand()
end
function scard.op1(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_RTOHAND)
	local g=Duel.SelectMatchingCard(tp,scard.thfilter,tp,LOCATION_INPLAY,0,1,1,nil)
	if g:GetCount()==0 then return end
	Duel.HintSelection(g)
	g:Merge(g:GetFirst():GetAttachedGroup())
	Duel.SendtoHand(g,PLAYER_OWNER,REASON_EFFECT)
end
