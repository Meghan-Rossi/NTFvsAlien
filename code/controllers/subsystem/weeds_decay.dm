SUBSYSTEM_DEF(weeds_decay)
	name = "Weed Decay"
	priority = FIRE_PRIORITY_WEED
	flags = SS_NO_INIT
	runlevels = RUNLEVEL_LOBBY|RUNLEVEL_SETUP|RUNLEVEL_GAME|RUNLEVEL_POSTGAME
	wait = 5 SECONDS

	/// List of decaying weeds on the map
	var/list/obj/alien/weeds/decaying_list = list()

/datum/controller/subsystem/weeds_decay/stat_entry()
	return ..("Decay Nodes: [length(decaying_list)]")

/datum/controller/subsystem/weeds_decay/fire(resumed = FALSE)
	for(var/obj/alien/weeds/weed AS in decaying_list)
		if(MC_TICK_CHECK)
			return

		if(QDELETED(weed))
			decaying_list -= weed
			continue

		var/decay_chance = 100
		for(var/direction in GLOB.cardinals)
			var/turf/adj = get_step(weed, direction)
			var/obj/alien/weeds/nearbyweed = locate() in adj
			if(weed.issamexenohive(nearbyweed))
				decay_chance -= 20

		if(prob(decay_chance))
			addtimer(CALLBACK(weed, TYPE_PROC_REF(/obj/alien/weeds, check_for_parent_node)), rand(3, 10 SECONDS))
			decaying_list -= weed

