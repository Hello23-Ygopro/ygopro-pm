--Sceptile Spirit Link (Ancient Origins 80/98)
local scard,sid=aux.GetID()
function scard.initial_effect(c)
	--pokemon tool
	aux.EnablePokemonToolAttribute(c)
	--spirit link
	aux.EnableSpiritLink(c,CARD_M_SCEPTILE_EX)
	aux.AddAttachedDescription(c,DESC_DONOT_END_TURN_MEGA,aux.SelfCardCodeCondition(CARD_M_SCEPTILE_EX))
end
scard.trainer_item=TYPE_POKEMON_TOOL
