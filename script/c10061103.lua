--Herbal Energy (Furious Fists 103/111)
--Note: EVENT_BECOME_ATTACHED won't be raised if SetType is EFFECT_TYPE_TRIGGER
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	--energy
	aux.EnableEnergyAttribute(c,aux.FilterBoolFunction(Card.IsEnergyType,ENERGY_G))
	--provide energy
	aux.EnableProvideEnergy(c,ENERGY_G,1,aux.FilterBoolFunction(Card.IsEnergyType,ENERGY_G))
	--heal
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(sid,0))
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_CUSTOM+EVENT_BECOME_ATTACHED)
	e1:SetCondition(scard.con1)
	e1:SetOperation(scard.op1)
	c:RegisterEffect(e1)
end
scard.energy_special=true
--heal
function scard.con1(e)
	local c=e:GetHandler()
	local tc=c:GetAttachedTarget()
	return c:IsPlayedFromHand() and tc and tc:IsEnergyType(ENERGY_G) and tc:IsCanBeHealed()
end
function scard.op1(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=c:GetAttachedTarget()
	Duel.Hint(HINT_CARD,0,c:GetOriginalCode())
	Duel.HealDamage(ep,tc,30,REASON_EFFECT)
end
