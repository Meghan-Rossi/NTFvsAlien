/mob/living/carbon/xenomorph/bull
	caste_base_type = /datum/xeno_caste/bull
	name = "Bull"
	desc = "A bright red alien with a matching temper."
	icon = 'ntf_modular/icons/Xeno/castes/bull.dmi'
	icon_state = "Bull Walking"
	bubble_icon = "alienleft"
	health = 160
	maxHealth = 160
	plasma_stored = 200
	tier = XENO_TIER_TWO
	upgrade = XENO_UPGRADE_NORMAL

	pixel_x = -16
	pixel_y = -3


/mob/living/carbon/xenomorph/bull/handle_special_state()
	if(is_charging >= CHARGE_ON)
		icon_state = "[xeno_caste.caste_name][is_a_rouny ? " rouny" : ""] Charging"
		return TRUE
	return FALSE


/mob/living/carbon/xenomorph/bull/handle_special_wound_states(severity)
	. = ..()
	if(is_charging >= CHARGE_ON)
		return "wounded_charging_[severity]"
