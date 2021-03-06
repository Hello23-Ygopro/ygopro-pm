--Fossil Researcher (Furious Fists 92/111)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	aux.AddSetcode(c,SETNAME_FOSSIL)
	--search (to bench)
	aux.PlayTrainerFunction(c,scard.tg1,scard.op1)
end
scard.trainer_supporter=true
--search (to bench)
function scard.tg1(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsNotBenchFull(tp) and Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)>0 end
end
function scard.tbfilter(c,e,tp)
	return c:IsCode(CARD_AMAURA,CARD_TYRUNT) and c:IsCanBePlayed(e,0,tp,true,false)
end
function scard.op1(e,tp,eg,ep,ev,re,r,rp)
	if Duel.IsBenchFull(tp) then return end
	local ct=Duel.GetFreeBenchCount(tp)
	if ct>2 then ct=2 end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOBENCH)
	local g=Duel.SelectMatchingCard(tp,scard.tbfilter,tp,LOCATION_DECK,0,0,ct,nil,e,tp)
	if g:GetCount()>0 then
		Duel.PlayPokemon(g,0,tp,tp,true,false,POS_FACEUP_UPSIDE)
	else
		Duel.ShuffleDeck(tp)
	end
end
