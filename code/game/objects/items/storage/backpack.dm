/*
* Backpack
*/

/obj/item/storage/backpack
	name = "backpack"
	desc = "You wear this on your back and put items into it."
	icon_state = "backpack"
	icon = 'icons/obj/items/storage/backpack.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/backpacks_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/backpacks_right.dmi',
	)
	worn_icon_state = "backpack"
	sprite_sheets = list(
		"Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Sterling Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Chilvaris Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Hammerhead Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		"Ratcher Combat Robot" = 'icons/mob/species/robot/backpack.dmi',
		)
	w_class = WEIGHT_CLASS_BULKY
	equip_slot_flags = ITEM_SLOT_BACK	//ERROOOOO
	storage_type = /datum/storage/backpack

/obj/item/storage/backpack/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(storage_datum.use_sound)
		playsound(loc, storage_datum.use_sound, 15, 1, 6)

/obj/item/storage/backpack/equipped(mob/user, slot)
	if(slot == SLOT_BACK)
		mouse_opacity = 2 //so it's easier to click when properly equipped.
		if(storage_datum.use_sound)
			playsound(loc, storage_datum.use_sound, 15, 1, 6)
	return ..()

/obj/item/storage/backpack/dropped(mob/user)
	mouse_opacity = initial(mouse_opacity)
	return ..()

/obj/item/storage/backpack/vendor_equip(mob/user)
	..()
	return user.equip_to_appropriate_slot(src)

/*
* Backpack Types
*/

/obj/item/storage/backpack/holding
	name = "bag of holding"
	desc = "A backpack that opens into a localized pocket of Blue Space."
	icon_state = "holdingpack"
	storage_type = /datum/storage/backpack/holding

/obj/item/storage/backpack/holding/attackby(obj/item/I, mob/user, params)
	if(!istype(I, /obj/item/storage/backpack/holding))
		return ..()
	to_chat(user, span_warning("The Bluespace interfaces of the two devices conflict and malfunction."))
	qdel(I)

/obj/item/storage/backpack/santabag
	name = "Santa's Gift Bag"
	desc = "Space Santa uses this to deliver toys to all the nice children in space in Christmas! Wow, it's pretty big!"
	icon_state = "giftbag0"
	worn_icon_state = "giftbag"
	w_class = WEIGHT_CLASS_BULKY
	storage_type = /datum/storage/backpack/santabag

/obj/item/storage/backpack/cultpack
	name = "trophy rack"
	desc = "It's useful for both carrying extra gear and proudly declaring your insanity."
	icon_state = "cultpack"

/obj/item/storage/backpack/clown
	name = "Giggles von Honkerton"
	desc = "It's a backpack made by Honk! Co."
	icon_state = "clownpack"

/obj/item/storage/backpack/corpsman
	name = "medical backpack"
	desc = "It's a backpack especially designed for use in a sterile environment."
	icon_state = "medicalpack"

/obj/item/storage/backpack/security
	name = "security backpack"
	desc = "It's a very robust backpack."
	icon_state = "securitypack"

/obj/item/storage/backpack/captain
	name = "captain's backpack"
	desc = "It's a special backpack made exclusively for officers."
	icon_state = "captainpack"

/obj/item/storage/backpack/industrial
	name = "industrial backpack"
	desc = "It's a tough backpack for the daily grind of station life."
	icon_state = "engiepack"
	worn_icon_state = "engiepack"

/obj/item/storage/backpack/toxins
	name = "laboratory backpack"
	desc = "It's a light backpack modeled for use in laboratories and other scientific institutions."
	icon_state = "toxpack"

/obj/item/storage/backpack/hydroponics
	name = "herbalist's backpack"
	desc = "It's a green backpack with many pockets to store plants and tools in."
	icon_state = "hydpack"

/obj/item/storage/backpack/genetics
	name = "geneticist backpack"
	desc = "It's a backpack fitted with slots for diskettes and other workplace tools."
	icon_state = "genpack"

/obj/item/storage/backpack/virology
	name = "sterile backpack"
	desc = "It's a sterile backpack able to withstand different pathogens from entering its fabric."
	icon_state = "viropack"

/obj/item/storage/backpack/chemistry
	name = "chemistry backpack"
	desc = "It's an orange backpack which was designed to hold beakers, pill bottles and bottles."
	icon_state = "chempack"

/*
* Satchel Types
*/

/obj/item/storage/backpack/satchel
	name = "leather satchel"
	desc = "It's a very fancy satchel made with fine leather."
	icon_state = "satchel"
	storage_type = /datum/storage/backpack/satchel

/obj/item/storage/backpack/satchel/withwallet/Initialize(mapload, ...)
	. = ..()
	new /obj/item/storage/wallet/random( src )

/obj/item/storage/backpack/satchel/som
	name = "mining satchel"
	desc = "A satchel with origins dating back to the mining colonies."
	icon_state = "som_satchel"
	worn_icon_state = "som_satchel"

/obj/item/storage/backpack/satchel/norm
	name = "satchel"
	desc = "A trendy looking satchel."
	icon_state = "satchel-norm"

/obj/item/storage/backpack/satchel/rugged
	name = "satchel"
	desc = "A rugged satchel for workers of all types."
	icon_state = "satchel-norm"

/obj/item/storage/backpack/satchel/eng
	name = "industrial satchel"
	desc = "A tough satchel with extra pockets."
	icon_state = "satchel-eng"

/obj/item/storage/backpack/satchel/med
	name = "medical satchel"
	desc = "A sterile satchel used in medical departments."
	icon_state = "satchel-med"

/obj/item/storage/backpack/satchel/vir
	name = "virologist satchel"
	desc = "A sterile satchel with virologist colours."
	icon_state = "satchel-vir"

/obj/item/storage/backpack/satchel/chem
	name = "chemist satchel"
	desc = "A sterile satchel with chemist colours."
	icon_state = "satchel-chem"

/obj/item/storage/backpack/satchel/gen
	name = "geneticist satchel"
	desc = "A sterile satchel with geneticist colours."
	icon_state = "satchel-gen"

/obj/item/storage/backpack/satchel/tox
	name = "scientist satchel"
	desc = "Useful for holding research materials."
	icon_state = "satchel-tox"

/obj/item/storage/backpack/satchel/sec
	name = "security satchel"
	desc = "A robust satchel for security related needs."
	icon_state = "satchel-sec"

/obj/item/storage/backpack/satchel/hyd
	name = "hydroponics satchel"
	desc = "A green satchel for plant related work."
	icon_state = "satchel_hyd"

/obj/item/storage/backpack/satchel/cap
	name = "captain's satchel"
	desc = "An exclusive satchel for officers."
	icon_state = "satchel-cap"

//ERT backpacks.
/obj/item/storage/backpack/ert
	name = "emergency response team backpack"
	desc = "A spacious backpack with lots of pockets, used by members of the Emergency Response Team."
	icon_state = "ert_commander"

//Commander
/obj/item/storage/backpack/ert/commander
	name = "emergency response team commander backpack"
	desc = "A spacious backpack with lots of pockets, worn by the commander of a Emergency Response Team."

//Security
/obj/item/storage/backpack/ert/security
	name = "emergency response team security backpack"
	desc = "A spacious backpack with lots of pockets, worn by security members of a Emergency Response Team."
	icon_state = "ert_security"

//Engineering
/obj/item/storage/backpack/ert/engineer
	name = "emergency response team engineer backpack"
	desc = "A spacious backpack with lots of pockets, worn by engineering members of a Emergency Response Team."
	icon_state = "ert_engineering"

//Medical
/obj/item/storage/backpack/ert/medical
	name = "emergency response team medical backpack"
	desc = "A spacious backpack with lots of pockets, worn by medical members of a Emergency Response Team."
	icon_state = "ert_medical"


/*========================== MARINE BACKPACKS ================================
==========================================================================*/

/obj/item/storage/backpack/marine
	name = "\improper lightweight IMP backpack"
	desc = "The standard-issue pack of the NTC forces. Designed to slug gear into the battlefield."
	icon_state = "marinepack"
	worn_icon_state = "marinepack"

/obj/item/storage/backpack/marine/standard
	name = "\improper lightweight IMP backpack"
	desc = "The standard-issue pack of the NTC forces. Designed to slug gear into the battlefield."

/obj/item/storage/backpack/marine/corpsman
	name = "\improper NTC corpsman backpack"
	desc = "The standard-issue backpack worn by NTC corpsmen. You can recharge defibrillators by plugging them in."
	icon_state = "marinepackm"
	worn_icon_state = "marinepackm"
	var/obj/item/cell/high/cell //Starts with a high capacity energy cell.
	var/icon_skin

/obj/item/storage/backpack/marine/corpsman/Initialize(mapload, ...)
	. = ..()
	cell = new
	icon_skin = icon_state
	update_icon()

/obj/item/storage/backpack/marine/corpsman/proc/use_charge(mob/user, amount = 0, mention_charge = TRUE)
	var/warning = ""
	if(amount > cell.charge)
		playsound(src, 'sound/machines/buzz-two.ogg', 25, 1)
		if(cell.charge)
			warning = "<span class='warning'>[src]'s defibrillator recharge unit buzzes a warning, its battery only having enough power to partially recharge the defibrillator for [cell.charge] amount. "
		else
			warning = "<span class='warning'>[src]'s defibrillator recharge unit buzzes a warning, as its battery is completely depleted of charge. "
	else
		playsound(src, 'sound/machines/ping.ogg', 25, 1)
		warning = "<span class='notice'>[src]'s defibrillator recharge unit cheerfully pings as it successfully recharges the defibrillator. "
	cell.charge -= min(cell.charge, amount)
	if(mention_charge)
		to_chat(user, span_notice("[warning]<b>Charge Remaining: [cell.charge]/[cell.maxcharge]</b>"))
	update_icon()

/obj/item/storage/backpack/marine/corpsman/examine(mob/user)
	. = ..()
	if(cell)
		. += span_notice("Its defibrillator recharge unit has a loaded power cell and its readout counter is active. <b>Charge Remaining: [cell.charge]/[cell.maxcharge]</b>")
	else
		. += span_warning("Its defibrillator recharge unit does not have a power cell installed!")

/obj/item/storage/backpack/marine/corpsman/update_icon_state()
	. = ..()
	icon_state = icon_skin
	if(cell?.charge >= 0)
		switch(PERCENT(cell.charge/cell.maxcharge))
			if(75 to INFINITY)
				icon_state += "_100"
			if(50 to 74.9)
				icon_state += "_75"
			if(25 to 49.9)
				icon_state += "_50"
			if(0.1 to 24.9)
				icon_state += "_25"
	else
		icon_state += "_0"

/obj/item/storage/backpack/marine/corpsman/MouseDrop_T(obj/item/W, mob/living/user) //Dragging the defib/power cell onto the backpack will trigger its special functionality.
	var/obj/item/defibrillator/defib
	if(istype(W, /obj/item/defibrillator))
		defib = W
	else if(istype(W, /obj/item/clothing/gloves/defibrillator))
		var/obj/item/clothing/gloves/defibrillator/defib_gloves = W
		defib = defib_gloves.internal_defib
	if(defib)
		if(cell)
			var/charge_difference = defib.dcell.maxcharge - defib.dcell.charge
			if(charge_difference) //If the defib has less than max charge, recharge it.
				use_charge(user, charge_difference) //consume an appropriate amount of charge
				defib.dcell.charge += min(charge_difference, cell.charge) //Recharge the defibrillator battery with the lower of the difference between its present and max cap, or the remaining charge
				defib.update_icon()
			else
				to_chat(user, span_warning("This defibrillator is already at maximum charge!"))
		else
			to_chat(user, span_warning("[src]'s defibrillator recharge unit does not have a power cell installed!"))
	else if(istype(W, /obj/item/cell))
		if(user.drop_held_item())
			W.loc = src
			var/replace_install = "You replace the cell in [src]'s defibrillator recharge unit."
			if(!cell)
				replace_install = "You install a cell in [src]'s defibrillator recharge unit."
			else
				cell.update_icon()
				user.put_in_hands(cell)
			cell = W
			to_chat(user, span_notice("[replace_install] <b>Charge Remaining: [cell.charge]/[cell.maxcharge]</b>"))
			playsound(user, 'sound/weapons/guns/interact/rifle_reload.ogg', 25, 1, 5)
			update_icon()
	return ..()


/obj/item/storage/backpack/marine/tech
	name = "\improper NTC technician backpack"
	desc = "The standard-issue backpack worn by TGMC technicians. Specially equipped to hold sentry gun and HSG-102 emplacement parts."
	icon_state = "marinepackt"
	worn_icon_state = "marinepackt"
	storage_type = /datum/storage/backpack/tech

/obj/item/storage/backpack/marine/satchel
	name = "\improper NTC satchel"
	desc = "A heavy-duty satchel carried by some NTC soldiers and support personnel."
	icon_state = "marinesat"
	worn_icon_state = "marinesat"
	storage_type = /datum/storage/backpack/satchel

/obj/item/storage/backpack/marine/satchel/green
	name = "\improper NTC satchel"
	icon_state = "marinesat_green"

/obj/item/storage/backpack/marine/corpsman/satchel
	name = "\improper NTC corpsman satchel"
	desc = "A heavy-duty satchel carried by some NTC corpsmen. You can recharge defibrillators by plugging them in."
	icon_state = "marinesatm"
	worn_icon_state = "marinesatm"
	storage_type = /datum/storage/backpack/satchel
	cell = /obj/item/cell/apc

/obj/item/storage/backpack/marine/satchel/tech
	name = "\improper NTC technician satchel"
	desc = "A heavy-duty satchel carried by some NTC technicians. Can hold the ST-580 point defense sentry and ammo."
	icon_state = "marinesatt"
	worn_icon_state = "marinesatt"
	storage_type = /datum/storage/backpack/satchel/tech

/obj/item/storage/backpack/marine/smock
	name = "\improper M3 sniper's smock"
	desc = "A specially designed smock with pockets for all your sniper needs."
	icon_state = "smock"
	storage_type = /datum/storage/backpack/no_delay

/obj/item/storage/backpack/marine/smock/lite
	name = "\improper M2 sniper's smock-lite"
	desc = "A specially designed smock with pockets for all your sniper needs. This one has smaller storage similiar to a satchel but it is mass produced for standard use."
	icon_state = "smock"
	storage_type = /datum/storage/backpack/satchel

/obj/item/storage/backpack/marine/duffelbag
	name = "\improper TGMC Duffelbag"
	desc = "A hard to reach backpack with no draw delay but is hard to access. \
	Any squadmates can easily access the storage with right-click."
	icon = 'icons/obj/items/storage/duffelbag.dmi'
	icon_state = "duffel"
	worn_icon_state = "duffel"
	storage_type = /datum/storage/backpack/duffelbag

/obj/item/storage/backpack/marine/duffelbag/equipped(mob/equipper, slot)
	. = ..()
	if(slot == SLOT_BACK)
		RegisterSignal(equipper, COMSIG_CLICK_RIGHT, PROC_REF(on_rclick_duffel_wearer))
		RegisterSignal(equipper, COMSIG_MOVABLE_MOVED, PROC_REF(on_wearer_move))
		for(var/mob/M AS in storage_datum.content_watchers)
			storage_datum.close(M)

/obj/item/storage/backpack/marine/duffelbag/unequipped(mob/unequipper, slot)
	. = ..()
	UnregisterSignal(unequipper, list(COMSIG_CLICK_RIGHT, COMSIG_MOVABLE_MOVED))

/obj/item/storage/backpack/marine/duffelbag/Adjacent(atom/neighbor, atom/target, atom/movable/mover)
	if(item_flags & IN_INVENTORY && loc.Adjacent(neighbor)) //Special check to ensure that worn duffels are adjacent
		return TRUE
	return ..()

///Allows non-wearers to access this inventory
/obj/item/storage/backpack/marine/duffelbag/proc/on_rclick_duffel_wearer(datum/source, mob/clicker)
	SIGNAL_HANDLER
	if(clicker == loc || !source.Adjacent(clicker)) //Wearer can't use this to bypass restrictions
		return
	storage_datum.open(clicker)

///Closes the duffelbag when our wearer moves if it's worn on user's back
/obj/item/storage/backpack/marine/duffelbag/proc/on_wearer_move(datum/source)
	SIGNAL_HANDLER
	if(!iscarbon(source))
		return
	var/mob/living/carbon/carbon_user = source
	if(carbon_user.back == src && carbon_user.s_active == storage_datum)
		storage_datum.close(carbon_user)

/datum/storage/backpack/duffelbag
	access_delay = 0

/datum/storage/backpack/duffelbag/put_storage_in_hand(datum/source, obj/over_object, mob/living/carbon/human/user)
	//Taking off the duffelbag has a channel
	if(user.back != parent || !do_after(user, 3 SECONDS))
		return

	switch(over_object.name)
		if("r_hand")
			INVOKE_ASYNC(src, PROC_REF(put_item_in_r_hand), source, user)
		if("l_hand")
			INVOKE_ASYNC(src, PROC_REF(put_item_in_l_hand), source, user)

/datum/storage/backpack/duffelbag/open(mob/user)
	if(!iscarbon(user))
		return TRUE
	var/mob/living/carbon/carbon_user = user
	if(carbon_user.back == parent && !do_after(carbon_user, 2 SECONDS))
		return TRUE
	return ..()

/datum/storage/backpack/duffelbag/attempt_draw_object(mob/living/carbon/user, start_from_left)
	if(user.back == parent && user.s_active != src)
		to_chat(user, span_notice("You can't grab anything out of [parent] while it's on your back."))
		return
	return ..()

//CLOAKS

/obj/item/storage/backpack/marine/satchel/officer_cloak
	name = "Officer Cloak"
	desc = "A dashing cloak as befitting an officer."
	icon_state = "officer_cloak" //with thanks to Baystation12
	worn_icon_state = "officer_cloak" //with thanks to Baystation12

/obj/item/storage/backpack/marine/satchel/captain_cloak
	name = "Captain's Cloak"
	desc = "An opulent cloak detailed with your many accomplishments."
	icon_state = "commander_cloak" //with thanks to Baystation12
	worn_icon_state = "commander_cloak" //with thanks to Baystation12

/obj/item/storage/backpack/marine/satchel/officer_cloak_red
	name = "Officer Cloak - Red"
	desc = "A dashing cloak as befitting an officer, with fancy red trim."
	icon_state = "officer_cloak_red" //with thanks to Baystation12
	worn_icon_state = "officer_cloak_red" //with thanks to Baystation12

/obj/item/storage/backpack/marine/satchel/captain_cloak_red
	name = "Captain's Cloak - Red"
	desc = "An opulent cloak detailed with your many accomplishments, with fancy red trim."
	icon_state = "commander_cloak_red" //with thanks to Baystation12
	worn_icon_state = "commander_cloak_red" //with thanks to Baystation12


// Scout Cloak
/obj/item/storage/backpack/marine/satchel/scout_cloak
	name = "\improper NT-CyberGhost Prototype"
	desc = "NineTails Brand Prototype presence reduction device, it is attached at the back of most plate carriers and other armor, it was made generally as a testing platform before the technology could be fit into a smaller package and integrated into cybernetic addition to one's body, this device does not perform as well as the real thing, and it's sorta bulky. Unlike the real cyberware, this lacks the ability to wipe user's image from observation tools in-real-time."
	icon = 'ntf_modular/icons/obj/storage/storage.dmi'
	worn_icon_list = list(
		slot_l_hand_str = 'icons/mob/inhands/equipment/backpacks_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/equipment/backpacks_right.dmi',
		slot_back_str = 'ntf_modular/icons/mob/clothing/back.dmi',
	)
	icon_state = "scout_cloak"
	var/camo_active = 0
	var/camo_active_timer = 0
	var/camo_cooldown_timer = null
	var/camo_last_stealth = null
	var/camo_last_shimmer = null
	var/camo_energy = 100
	var/mob/living/carbon/human/wearer = null
	var/shimmer_alpha = 128
	var/stealth_delay = null
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/storage/backpack/marine/satchel/scout_cloak/Destroy()
	camo_off()
	return ..()

/obj/item/storage/backpack/marine/satchel/scout_cloak/dropped(mob/user)
	camo_off(user)
	wearer = null
	STOP_PROCESSING(SSprocessing, src)
	return ..()

/obj/item/storage/backpack/marine/satchel/scout_cloak/attack_self(mob/user)
	. = ..()
	camouflage()

/obj/item/storage/backpack/marine/satchel/scout_cloak/process()
	if(!wearer)
		camo_off()
		return
	else if(wearer.stat != CONSCIOUS)
		camo_off(wearer)
		return

	stealth_delay = world.time - SCOUT_CLOAK_STEALTH_DELAY
	if(camo_last_shimmer > stealth_delay) //Shimmer after taking aggressive actions; no energy regeneration
		wearer.alpha = shimmer_alpha //50% invisible
	else if(camo_last_stealth > stealth_delay ) //We have an initial reprieve at max invisibility allowing us to reposition; no energy recovery during this time
		wearer.alpha = SCOUT_CLOAK_STILL_ALPHA
		return
	//Stationary stealth
	// Note from DrCrawler: No more stationary stealth on an item that is supposed to allow repositioning during stealth. Changed the defines.
	else if( wearer.last_move_intent < stealth_delay )
		wearer.alpha = SCOUT_CLOAK_STILL_ALPHA
		camo_adjust_energy(wearer, SCOUT_CLOAK_ACTIVE_RECOVERY)

///Handles the wearer moving with the cloak active
/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/handle_movement(mob/living/carbon/human/source, atom/old_loc, movement_dir, forced, list/old_locs)
	SIGNAL_HANDLER
	if(!camo_active)
		return
	if(camo_last_shimmer > world.time - SCOUT_CLOAK_STEALTH_DELAY) //Shimmer after taking aggressive actions
		source.alpha = SCOUT_CLOAK_RUN_ALPHA
		camo_adjust_energy(source, SCOUT_CLOAK_RUN_DRAIN)
	else if(camo_last_stealth > world.time - SCOUT_CLOAK_STEALTH_DELAY) //We have an initial reprieve at max invisibility allowing us to reposition, albeit at a high drain rate
		source.alpha = SCOUT_CLOAK_STILL_ALPHA
		camo_adjust_energy(source, SCOUT_CLOAK_RUN_DRAIN)
	else if(source.m_intent == MOVE_INTENT_WALK)
		source.alpha = SCOUT_CLOAK_WALK_ALPHA
		camo_adjust_energy(source, SCOUT_CLOAK_WALK_DRAIN)
	else
		source.alpha = SCOUT_CLOAK_RUN_ALPHA
		camo_adjust_energy(source, SCOUT_CLOAK_RUN_DRAIN)

///Activates the cloak
/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/camouflage()
	if (usr.incapacitated(TRUE))
		return

	var/mob/living/carbon/human/M = usr
	if (!istype(M))
		return

	if (M.back != src)
		to_chat(M, "<span class='warning'>You must be wearing the cloak to activate it!")
		return

	if (camo_active)
		camo_off(usr)
		return

	//other sources of cloaking
	if(SEND_SIGNAL(M, COMSIG_MOB_ENABLE_STEALTH) & STEALTH_ALREADY_ACTIVE)
		to_chat(M, span_warning("You are already cloaked!"))
		return FALSE

	if (camo_cooldown_timer)
		to_chat(M, "<span class='warning'>Your CyberGhost is still recalibrating! It will be ready in [(camo_cooldown_timer - world.time) * 0.1] seconds.")
		return

	camo_active = TRUE
	camo_last_stealth = world.time
	wearer = M

	M.visible_message("[M] fades into thin air!", span_notice("You activate your CyberGhost's camouflage."))
	playsound(M.loc,'sound/effects/cloak_scout_on.ogg', 15, 1)

	stealth_delay = world.time - SCOUT_CLOAK_STEALTH_DELAY
	if(camo_last_shimmer > stealth_delay) //Shimmer after taking aggressive actions
		wearer.alpha = shimmer_alpha //50% invisible
	else
		wearer.alpha = SCOUT_CLOAK_STILL_ALPHA

	if (M.smokecloaked)
		M.smokecloaked = FALSE
	else
		GLOB.huds[DATA_HUD_SECURITY_ADVANCED].remove_from_hud(M)
		GLOB.huds[DATA_HUD_BASIC].remove_from_hud(M)
		GLOB.huds[DATA_HUD_XENO_INFECTION].remove_from_hud(M)
		GLOB.huds[DATA_HUD_XENO_HEART].remove_from_hud(M)

	addtimer(CALLBACK(src, PROC_REF(on_cloak)), 1)
	RegisterSignal(M, COMSIG_HUMAN_DAMAGE_TAKEN, PROC_REF(damage_taken))
	RegisterSignals(M, list(
		COMSIG_MOB_GUN_FIRED,
		COMSIG_MOB_GUN_AUTOFIRED,
		COMSIG_MOB_ATTACHMENT_FIRED,
		COMSIG_MOB_THROW,
		COMSIG_MOB_ITEM_ATTACK), PROC_REF(action_taken))

	START_PROCESSING(SSprocessing, src)
	RegisterSignal(wearer, COMSIG_MOVABLE_MOVED, PROC_REF(handle_movement))

	return TRUE

///Sig handler for other sources of cloaking
/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/on_other_activate()
	SIGNAL_HANDLER
	return STEALTH_ALREADY_ACTIVE


/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/on_cloak()
	if(wearer)
		anim(wearer.loc,wearer,'icons/mob/mob.dmi',,"cloak",,wearer.dir)

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/on_decloak()
	if(wearer)
		anim(wearer.loc,wearer,'icons/mob/mob.dmi',,"uncloak",,wearer.dir)

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/camo_off(mob/user)
	if(wearer)
		UnregisterSignal(wearer, COMSIG_MOB_ENABLE_STEALTH)
	if(!user)
		camo_active = FALSE
		wearer = null
		STOP_PROCESSING(SSprocessing, src)
		return FALSE

	if(!camo_active)
		return FALSE

	camo_active = FALSE

	user.visible_message(span_warning("[user.name] shimmers into existence!"), span_danger("Your CyberGhost's camouflage has deactivated!"))
	playsound(user.loc,'sound/effects/cloak_scout_off.ogg', 15, 1)
	user.alpha = initial(user.alpha)

	GLOB.huds[DATA_HUD_SECURITY_ADVANCED].add_to_hud(user)
	GLOB.huds[DATA_HUD_BASIC].add_to_hud(user)
	GLOB.huds[DATA_HUD_XENO_INFECTION].add_to_hud(user)
	GLOB.huds[DATA_HUD_XENO_HEART].add_to_hud(user)

	addtimer(CALLBACK(src, PROC_REF(on_decloak)), 1)

	var/cooldown = round( (initial(camo_energy) - camo_energy) / SCOUT_CLOAK_INACTIVE_RECOVERY * 10) //Should be 20 seconds after a full depletion with inactive recovery at 5
	if(cooldown)
		camo_cooldown_timer = world.time + cooldown //recalibration and recharge time scales inversely with charge remaining
		to_chat(user, "<span class='warning'>Your CyberGhost is recalibrating! It will be ready in [(camo_cooldown_timer - world.time) * 0.1] seconds.")
		process_camo_cooldown(user, cooldown)

	UnregisterSignal(user, list(
		COMSIG_HUMAN_DAMAGE_TAKEN,
		COMSIG_MOB_GUN_FIRED,
		COMSIG_MOB_GUN_AUTOFIRED,
		COMSIG_MOB_ATTACHMENT_FIRED,
		COMSIG_MOB_THROW,
		COMSIG_MOB_ITEM_ATTACK,
		COMSIG_MOVABLE_MOVED,
		))
	STOP_PROCESSING(SSprocessing, src)

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/process_camo_cooldown(mob/living/user, cooldown)
	if(!camo_cooldown_timer)
		return
	addtimer(CALLBACK(src, PROC_REF(cooldown_finished)), cooldown)

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/cooldown_finished()
	camo_cooldown_timer = null
	camo_energy = initial(camo_energy)
	playsound(loc,'sound/effects/EMPulse.ogg', 25, 0, 1)
	if(wearer)
		to_chat(wearer, span_danger("Your CyberGhost has recalibrated and is ready to cloak again."))

/obj/item/storage/backpack/marine/satchel/scout_cloak/examine(mob/user)
	. = ..()
	if(user != wearer) //Only the wearer can see these details.
		return
	var/list/details = list()
	details +=("It has [camo_energy]/[initial(camo_energy)] charge. </br>")

	if(camo_cooldown_timer)
		details +=("It will be ready in [(camo_cooldown_timer - world.time) * 0.1] seconds. </br>")

	if(camo_active)
		details +=("It's currently active.</br>")

	. += span_warning("[details.Join(" ")]")

/obj/item/storage/backpack/marine/satchel/scout_cloak/item_action_slot_check(mob/user, slot)
	if(!ishuman(user))
		return FALSE
	if(slot != SLOT_BACK)
		return FALSE
	return TRUE

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/camo_adjust_energy(mob/user, drain = SCOUT_CLOAK_WALK_DRAIN)
	camo_energy = clamp(camo_energy - drain,0,initial(camo_energy))

	if(!camo_energy) //Turn off the camo if we run out of energy.
		to_chat(user, span_danger("Your CyberGhost lacks sufficient energy to remain active."))
		camo_off(user)

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/damage_taken(datum/source, damage)
	SIGNAL_HANDLER
	var/mob/living/carbon/human/wearer = source
	if(damage >= 15)
		to_chat(wearer, span_danger("Your camo shimmers from the damage!"))
		apply_shimmer()

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/action_taken() //This is used by multiple signals passing different parameters.
	SIGNAL_HANDLER
	to_chat(wearer, span_danger("Your camo shimmers from your actions!"))
	apply_shimmer()

/obj/item/storage/backpack/marine/satchel/scout_cloak/proc/apply_shimmer()
	camo_last_shimmer = world.time //Reduces transparency to 50%
	wearer.alpha = max(wearer.alpha,shimmer_alpha)

/obj/item/storage/backpack/marine/satchel/scout_cloak/sniper
	name = "\improper M68-B Thermal Cloak"
	icon_state = "smock"
	icon = 'icons/obj/items/storage/backpack.dmi'
	desc = "The M68-B thermal cloak is a variant custom-purposed for snipers, allowing for faster, superior, stationary concealment at the expense of mobile concealment. It is designed to be paired with the lightweight M3 recon battle armor. Serves as a satchel."
	shimmer_alpha = SCOUT_CLOAK_RUN_ALPHA * 0.5 //Half the normal shimmer transparency.

/obj/item/storage/backpack/marine/satchel/scout_cloak/sniper/handle_movement(mob/living/carbon/human/source, atom/old_loc, movement_dir, forced, list/old_locs)
	if(!camo_active)
		return
	source.alpha = initial(source.alpha) //Sniper variant has *no* mobility stealth, but no drain on movement either

/obj/item/storage/backpack/marine/satchel/scout_cloak/sniper/process()
	if(!wearer)
		camo_off()
		return
	else if(wearer.stat == DEAD)
		camo_off(wearer)
		return

	stealth_delay = world.time - SCOUT_CLOAK_STEALTH_DELAY * 0.3
	if(camo_last_shimmer > stealth_delay) //Shimmer after taking aggressive actions; no energy regeneration
		wearer.alpha = max(wearer.alpha, shimmer_alpha) //50% invisible
	//Stationary stealth
	else if( wearer.last_move_intent < stealth_delay ) //If we're standing still and haven't shimmed in the past 2 seconds we become almost completely invisible
		wearer.alpha = SCOUT_CLOAK_STILL_ALPHA //95% invisible
		camo_adjust_energy(wearer, SCOUT_CLOAK_ACTIVE_RECOVERY)

// Welder Backpacks //

/obj/item/storage/backpack/marine/engineerpack
	name = "\improper NTC technician welderpack"
	desc = "A specialized backpack worn by NTC technicians. It carries a fueltank for quick welder refueling."
	icon_state = "engineerpack"
	worn_icon_state = "engineerpack"
	var/max_fuel = 260
	storage_type = /datum/storage/backpack/satchel

/obj/item/storage/backpack/marine/engineerpack/Initialize(mapload, ...)
	. = ..()
	var/datum/reagents/R = new/datum/reagents(max_fuel) //Lotsa refills
	reagents = R
	R.my_atom = WEAKREF(src)
	R.add_reagent(/datum/reagent/fuel, max_fuel)


/obj/item/storage/backpack/marine/engineerpack/attackby(obj/item/I, mob/user, params)
	if(iswelder(I))
		var/obj/item/tool/weldingtool/T = I
		if(T.welding)
			to_chat(user, span_warning("That was close! However you realized you had the welder on and prevented disaster."))
			return
		if(T.get_fuel() == T.max_fuel || !reagents.total_volume)
			return ..()

		reagents.trans_to(I, T.max_fuel)
		to_chat(user, span_notice("Welder refilled!"))
		playsound(loc, 'sound/effects/refill.ogg', 25, 1, 3)

	else if(istype(I, /obj/item/ammo_magazine/flamer_tank))
		var/obj/item/ammo_magazine/flamer_tank/FT = I
		if(FT.default_ammo != /datum/ammo/flamethrower)
			to_chat(user, span_warning("Not the right kind of fuel!"))
			return ..()
		if(FT.current_rounds == FT.max_rounds || !reagents.total_volume)
			return ..()

		//Reworked and much simpler equation; fuel capacity minus the current amount, with a check for insufficient fuel
		var/fuel_transfer_amount = min(reagents.total_volume, (FT.max_rounds - FT.current_rounds))
		reagents.remove_reagent(/datum/reagent/fuel, fuel_transfer_amount)
		FT.current_rounds += fuel_transfer_amount
		playsound(loc, 'sound/effects/refill.ogg', 25, 1, 3)
		FT.caliber = CALIBER_FUEL
		to_chat(user, span_notice("You refill [FT] with [lowertext(FT.caliber)]."))
		FT.update_icon()

	else if(istype(I, /obj/item/weapon/twohanded/rocketsledge))
		var/obj/item/weapon/twohanded/rocketsledge/RS = I
		if(RS.reagents.get_reagent_amount(/datum/reagent/fuel) == RS.max_fuel || !reagents.total_volume)
			return ..()

		var/fuel_transfer_amount = min(reagents.total_volume, (RS.max_fuel - RS.reagents.get_reagent_amount(/datum/reagent/fuel)))
		reagents.remove_reagent(/datum/reagent/fuel, fuel_transfer_amount)
		RS.reagents.add_reagent(/datum/reagent/fuel, fuel_transfer_amount)
		playsound(loc, 'sound/effects/refill.ogg', 25, 1, 3)
		to_chat(user, span_notice("You refill [RS] with fuel."))
		RS.update_icon()

	else if(istype(I, /obj/item/weapon/twohanded/chainsaw))
		var/obj/item/weapon/twohanded/chainsaw/saw = I
		if(saw.reagents.get_reagent_amount(/datum/reagent/fuel) == saw.max_fuel || !reagents.total_volume)
			return ..()

		var/fuel_transfer_amount = min(reagents.total_volume, (saw.max_fuel - saw.reagents.get_reagent_amount(/datum/reagent/fuel)))
		reagents.remove_reagent(/datum/reagent/fuel, fuel_transfer_amount)
		saw.reagents.add_reagent(/datum/reagent/fuel, fuel_transfer_amount)
		playsound(loc, 'sound/effects/refill.ogg', 25, 1, 3)
		to_chat(user, span_notice("You refill [saw] with fuel."))
		saw.update_icon()

	else
		return ..()

/obj/item/storage/backpack/marine/engineerpack/afterattack(obj/O as obj, mob/user as mob, proximity)
	if(!proximity) // this replaces and improves the get_dist(src,O) <= 1 checks used previously
		return
	if (istype(O, /obj/structure/reagent_dispensers/fueltank) && src.reagents.total_volume < max_fuel)
		O.reagents.trans_to(src, max_fuel)
		to_chat(user, span_notice("You crack the cap off the top of the pack and fill it back up again from the tank."))
		playsound(src.loc, 'sound/effects/refill.ogg', 25, 1, 3)
		return
	else if (istype(O, /obj/structure/reagent_dispensers/fueltank) && src.reagents.total_volume == max_fuel)
		to_chat(user, span_notice("The pack is already full!"))
		return
	..()

/obj/item/storage/backpack/marine/engineerpack/examine(mob/user)
	. = ..()
	. += "[reagents.total_volume] units of fuel left!"

/obj/item/storage/backpack/marine/engineerpack/som
	name = "\improper SOM technician welderpack"
	desc = "A specialized backpack worn by SOM technicians. It carries a fueltank for quick welder refueling."
	icon_state = "som_engineer_pack"
	worn_icon_state = "som_engineer_pack"
	storage_type = /datum/storage/backpack/satchel

/obj/item/storage/backpack/lightpack
	name = "\improper lightweight combat pack"
	desc = "A small lightweight pack for expeditions and short-range operations."
	icon_state = "ERT_satchel"
	storage_type = /datum/storage/backpack/no_delay

/obj/item/storage/backpack/commando
	name = "commando bag"
	desc = "A heavy-duty bag carried by Ninetails commandos."
	icon_state = "commandopack"
	storage_type = /datum/storage/backpack/commando

/obj/item/storage/backpack/captain
	name = "marine captain backpack"
	desc = "The contents of this backpack are top secret."
	icon_state = "marinepack"
	storage_type = /datum/storage/backpack/captain

/obj/item/storage/backpack/lightpack/som
	name = "mining rucksack"
	desc = "A rucksack with origins dating back to the mining colonies."
	icon_state = "som_lightpack"
	worn_icon_state = "som_lightpack"

/obj/item/storage/backpack/lightpack/icc
	name = "\improper Modello/190"
	desc = "A small lightweight buttpack made for use in a wide variety of operations, made with a synthetic tan fibre."
	icon_state = "icc_bag"

/obj/item/storage/backpack/lightpack/icc/guard
	name = "\improper Modello/190"
	desc = "A small lightweight buttpack made for use in a wide variety of operations, made with a synthetic black fibre."
	icon_state = "icc_bag_guard"

/obj/item/storage/backpack/lightpack/vsd
	name = "\improper Crasher branded combat backpack"
	desc = "A backpack design from 21st century still proves to be a good design in the 25th century."
	icon_state = "vsd_bag0"
