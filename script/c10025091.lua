--Sitrus Berry (Unseen Forces 91/115)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	--pokemon tool
	aux.EnablePokemonToolAttribute(c)
	--heal
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(sid,0))
	e1:SetType(EFFECT_TYPE_ATTACHED+EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e1:SetCode(EVENT_PHASE+PHASE_END)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e1:SetLabelObject(c)
	e1:SetCondition(scard.con1)
	e1:SetTarget(aux.HintTarget)
	e1:SetOperation(scard.op1)
	c:RegisterEffect(e1)
	aux.AddAttachedDescription(c,DESC_REMOVE_COUNTER_SELF_EOT,scard.con1)
end
scard.trainer_item=TYPE_POKEMON_TOOL
--heal
function scard.con1(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return c:GetCounter(COUNTER_DAMAGE)>=3 and c:IsCanBeHealed()
end
function scard.op1(e,tp,eg,ep,ev,re,r,rp)
	Duel.HealDamage(tp,e:GetHandler(),30,REASON_EFFECT)
	Duel.SendtoDPile(e:GetLabelObject(),REASON_EFFECT+REASON_DISCARD)
end
