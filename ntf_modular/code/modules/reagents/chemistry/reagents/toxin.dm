/datum/reagent/toxin/xeno_aphrotoxin
	name = "Aphrotoxin"
	description = "An aphrodisiac mixed with larva growth toxin made naturally be some xenos, it is used to disorient hosts and prepare them for breeding. Also to boost larva growth."
	reagent_state = LIQUID
	color = COLOR_TOXIN_APHROTOXIN
	overdose_threshold = 10000
	scannable = TRUE
	custom_metabolism = REAGENTS_METABOLISM
	toxpwr = 0
	var/mob/living/carbon/debuff_owner
	var/obj/effect/abstract/particle_holder/particle_holder
	var/mob/living/carbon/human/debuff_ownerhuman
	var/clothesundoed = 0
/particles/aphrodisiac
	icon = 'ntf_modular/icons/effects/particles/generic_particles.dmi'
	icon_state = "heart"
	width = 100
	height = 100
	count = 1000
	spawning = 4
	lifespan = 9
	fade = 10
	grow = 0.2
	velocity = list(0, 0)
	position = generator(GEN_SPHERE, 10, 10, NORMAL_RAND)
	drift = generator(GEN_VECTOR, list(0, -0.15), list(0, 0.15))
	gravity = list(0, 0.4)
	scale = generator(GEN_VECTOR, list(0.3, 0.3), list(0.9,0.9), NORMAL_RAND)
	rotation = 0
	color = "#b002db"

/datum/reagent/toxin/xeno_aphrotoxin/on_mob_life(mob/living/L, metabolism)
	particle_holder.particles.spawning = 1 + round(debuff_owner.reagents.get_reagent_amount(/datum/reagent/toxin/xeno_aphrotoxin) / 4)
	switch(current_cycle)
		if(1 to 10)
			if(prob(10))
				to_chat(L, span_warning("You feel your [L.gender==MALE ? "cock throb a little," : "vagina get a bit wet,"] distracting you.") )
				L.AdjustConfused(1 SECONDS)
				L.adjustStaminaLoss(10)
				L.sexcon.adjust_arousal(10)
		if(11 to 30)
			if(prob(15))
				to_chat(L, span_warning("You feel your [L.gender==MALE ? "cock harden and throb." : "vagina drip down your legs."] your knees feel weak!") )
				L.blur_eyes(1)
				L.AdjustConfused(2 SECONDS)
				L.adjustStaminaLoss(15)
				L.sexcon.adjust_arousal(15)
			if(prob(10))
				L.AdjustConfused(1 SECONDS)
		if(31 to 50)
			if(prob(15))
				L.emote("blush")
				to_chat(L, span_warning("You feel your [L.gender==MALE ? "cock throb with need!" : "vagina drool like a waterfall!"] Your legs tremble, too weak to walk for a moment.") )
				L.blur_eyes(2)
				L.jitter(2)
				L.SetImmobilized(2 SECONDS)
				L.AdjustConfused(3 SECONDS)
				L.adjustStaminaLoss(20)
				L.sexcon.adjust_arousal(20)
			if(prob(15))
				L.AdjustConfused(2 SECONDS)
		if(51 to INFINITY)
			if(prob(15))
				L.emote("moan")
				to_chat(L, span_warning("You feel your [L.gender==MALE ? "cock throb hard as steel!" : "vagina drool like rain, burn like fire!"] your legs almost give up as you come near orgasm!") )
				L.blur_eyes(3)
				L.jitter(3)
				L.SetImmobilized(3 SECONDS)
				L.AdjustConfused(4 SECONDS)
				L.adjustStaminaLoss(25)
				L.sexcon.adjust_arousal(25)
			if(prob(20))
				L.AdjustConfused(2 SECONDS)
	return ..()

/// Called when the debuff's owner uses the Resist action for this debuff.
/datum/reagent/toxin/xeno_aphrotoxin/proc/call_resist_debuff()
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, PROC_REF(resist_debuff)) // grilled cheese sandwich

/// Resisting the debuff will allow the debuff's owner to remove some stacks from themselves.
/datum/reagent/toxin/xeno_aphrotoxin/proc/resist_debuff()
	var/channel = SSsounds.random_available_channel()
	var/t_his = p_their()
	if(length(debuff_owner.do_actions))
		return
	if(clothesundoed != 1)
		if(debuff_ownerhuman.w_uniform)
			debuff_ownerhuman.visible_message(span_warning("[debuff_ownerhuman] begins to undo [t_his] clothes and expose [t_his] [debuff_ownerhuman.gender==MALE ? "cock" : "pussy"]!"), span_warning("You begin to undo your clothes and expose your [debuff_ownerhuman.gender==MALE ? "cock" : "pussy"]."), span_warning("You hear ruffling."), 5)
			if(!do_after(debuff_owner, 5 SECONDS, TRUE, debuff_owner, BUSY_ICON_CLOCK))
				debuff_owner?.balloon_alert(debuff_owner, "Interrupted")
				return
	clothesundoed = 1
	playsound(debuff_owner, "sound/effects/squelch2.ogg", 30, channel = channel)
	debuff_ownerhuman.visible_message(span_warning("[debuff_ownerhuman] begins to [debuff_ownerhuman.gender==MALE ? "jack off" : "rub her slit"]!"), span_warning("You begin to [debuff_ownerhuman.gender==MALE ? "jack off" : "rub your vagina"]."), span_warning("You hear slapping."), 5)
	if(!do_after(debuff_owner, 10 SECONDS, TRUE, debuff_owner, BUSY_ICON_GENERIC))
		debuff_owner?.balloon_alert(debuff_owner, "Interrupted.")
		debuff_owner.stop_sound_channel(channel)
		clothesundoed = 0
		return
	if(!debuff_owner)
		usr.stop_sound_channel(channel)
		return
	debuff_owner.emote("moan")
	debuff_owner.visible_message(span_warning("[debuff_owner] cums on the floor!"), span_warning("You cum on the floor."), span_warning("You hear a splatter."), 5)
	debuff_owner.balloon_alert(debuff_owner, "Orgasmed.")
	debuff_owner.adjustStaminaLoss(75)

	playsound(usr.loc, "sound/effects/splat.ogg", 30)
	debuff_owner.reagents.remove_reagent(/datum/reagent/toxin/xeno_aphrotoxin, 10)
	debuff_owner.reagents.remove_reagent(/datum/reagent/consumable/larvajelly, 3)
	debuff_owner.sexcon.ejaculate()
	if(debuff_owner.getStaminaLoss() > 120)
		if(prob(5))
			debuff_owner.visible_message(span_warning("[debuff_owner] manages to black out from cumming too hard..."), 4)
			debuff_owner.SetUnconscious(8 SECONDS)
	if(debuff_owner.reagents.get_reagent_amount(/datum/reagent/toxin/xeno_aphrotoxin) > 0)
		resist_debuff() // We repeat ourselves as long as the debuff persists.
		return
	clothesundoed = 0

/datum/reagent/toxin/xeno_aphrotoxin/on_mob_add(mob/living/L)
	if(L.status_flags & GODMODE)
		qdel(src)
		return
	if(isxeno(L))
		qdel(src)
		return
	. = ..()
	debuff_ownerhuman = L
	debuff_owner = L
	RegisterSignal(L, COMSIG_LIVING_DO_RESIST, PROC_REF(call_resist_debuff))
	L.adjust_mob_scatter(10)
	L.adjust_mob_accuracy(-10)
	L.balloon_alert(L, "Aphrotoxin")
	particle_holder = new(L, /particles/aphrodisiac)
	particle_holder.particles.spawning = 1 + round(debuff_owner.reagents.get_reagent_amount(/datum/reagent/toxin/xeno_aphrotoxin) / 2)
	particle_holder.pixel_x = -2
	particle_holder.pixel_y = 0
	if(HAS_TRAIT(debuff_owner, TRAIT_INTOXICATION_RESISTANT) || (debuff_owner.get_soft_armor(BIO) >= 65))
		custom_metabolism = REAGENTS_METABOLISM

/datum/reagent/toxin/xeno_aphrotoxin/on_mob_delete()
	UnregisterSignal(debuff_owner, COMSIG_LIVING_DO_RESIST)
	debuff_owner.adjust_mob_scatter(-10)
	debuff_owner.adjust_mob_accuracy(10)
	debuff_owner = null
	QDEL_NULL(particle_holder)
	return ..()