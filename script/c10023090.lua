--Professor Cozmo's Discovery (Deoxys 90/107)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	--draw
	aux.PlayTrainerFunction(c,aux.DrawTarget(PLAYER_SELF),scard.op1)
end
scard.trainer_supporter=true
--draw
function scard.op1(e,tp,eg,ep,ev,re,r,rp)
	if Duel.TossCoin(tp,1)==RESULT_HEADS then
		Duel.Draw(tp,3,REASON_EFFECT,true)
	else
		Duel.Draw(tp,2,REASON_EFFECT)
	end
end
