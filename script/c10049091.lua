--Cheren (Emerging Powers 91/98)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	--draw
	aux.PlayTrainerFunction(c,aux.DrawTarget(PLAYER_SELF),aux.DrawOperation(PLAYER_SELF,3))
end
scard.trainer_supporter=true
