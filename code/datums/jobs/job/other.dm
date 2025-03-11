//Colonist
/datum/job/colonist
	title = "Colonist"
	paygrade = "C"
	outfit = /datum/outfit/job/other/colonist

//Passenger
/datum/job/passenger
	title = "Passenger"
	paygrade = "C"


//Pizza Deliverer
/datum/job/pizza
	title = "Pizza Deliverer"
	access = ALL_MARINE_ACCESS
	minimal_access = ALL_MARINE_ACCESS
	outfit = /datum/outfit/job/other/pizza

//Spatial Agent
/datum/job/spatial_agent
	title = "Spatial Agent"
	access = ALL_ACCESS
	minimal_access = ALL_ACCESS
	skills_type = /datum/skills/spatial_agent
	outfit = /datum/outfit/job/other/spatial_agent

/datum/job/spatial_agent/galaxy_red
	outfit = /datum/outfit/job/other/spatial_agent/galaxy_red

/datum/job/spatial_agent/galaxy_blue
	outfit = /datum/outfit/job/other/spatial_agent/galaxy_blue

/datum/job/spatial_agent/xeno_suit
	outfit = /datum/outfit/job/other/spatial_agent/xeno_suit

/datum/job/spatial_agent/marine_officer
	outfit = /datum/outfit/job/other/spatial_agent/marine_officer


/datum/job/zombie
	title = "Zombie"

/datum/job/other/prisoner
	title = "Prisoner"
	paygrade = "Psnr"
	comm_title = "Psnr"
	outfit = /datum/outfit/job/prisoner
	supervisors = "Corpsec Officers"
	display_order = JOB_DISPLAY_ORDER_PRISONER
	skills_type = /datum/skills/civilian
	total_positions = -1
	selection_color = "#e69704"
	job_flags = JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_LATEJOINABLE|JOB_FLAG_OVERRIDELATEJOINSPAWN|JOB_FLAG_ADDTOMANIFEST
	job_category = JOB_CAT_CIVILIAN

/datum/outfit/job/prisoner
	id = /obj/item/card/id
	w_uniform = /obj/item/clothing/under/rank/prisoner
	shoes = /obj/item/clothing/shoes/orange
	ears = /obj/item/radio/headset/mainship
/datum/job/other/prisonersom
	title = "SOM Prisoner"
	paygrade = "Psnr"
	comm_title = "Psnr"
	outfit = /datum/outfit/job/prisonersom
	supervisors = "The SOM"
	skills_type = /datum/skills/civilian
	total_positions = -1
	job_flags = JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_LATEJOINABLE|JOB_FLAG_OVERRIDELATEJOINSPAWN|JOB_FLAG_ADDTOMANIFEST
	job_category = JOB_CAT_CIVILIAN

/datum/outfit/job/prisonersom
	id = /obj/item/card/id
	w_uniform = /obj/item/clothing/under/rank/prisoner
	shoes = /obj/item/clothing/shoes/orange
	ears = /obj/item/radio/headset

/datum/job/worker
	title = "Worker"
	paygrade = "Wrkr"
	comm_title = "Wrkr"
	outfit = /datum/outfit/job/worker
	supervisors = "Ninetails Corp"
	access = list(ACCESS_MARINE_ENGINEERING, ACCESS_MARINE_PREP, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_CARGO, ACCESS_CIVILIAN_ENGINEERING)
	minimal_access = list(ACCESS_MARINE_ENGINEERING, ACCESS_MARINE_PREP, ACCESS_MARINE_MEDBAY, ACCESS_MARINE_DROPSHIP, ACCESS_MARINE_CARGO, ACCESS_CIVILIAN_ENGINEERING)
	skills_type = /datum/skills/civilian/worker
	total_positions = -1
	selection_color = "#f3f70c"
	job_flags = JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_LATEJOINABLE|JOB_FLAG_ALLOWS_PREFS_GEAR|JOB_FLAG_PROVIDES_BANK_ACCOUNT|JOB_FLAG_ADDTOMANIFEST
	faction = FACTION_TERRAGOV
	job_category = JOB_CAT_CIVILIAN

/datum/outfit/job/worker
	id = /obj/item/card/id
	w_uniform = /obj/item/clothing/under/colonist
	shoes = /obj/item/clothing/shoes/marine
	l_store = /obj/item/storage/pouch/survival/full
	ears = /obj/item/radio/headset/mainship

/datum/job/worker/radio_help_message(mob/M)
	. = ..()
	to_chat(M, {"\nYou are a standard worker with wide access among the ship,
	you can use a worker locker to get equipped and use your access to do your job properly,
	you should not sabotage the station with this access."})

//Morale officer
/datum/job/worker/moraleofficer
	title = "Morale Officer"
	paygrade = "MO"
	comm_title = "MO"
	outfit = /datum/outfit/job/mo
	supervisors = "Ninetails Corp"
	access = list(ACCESS_MARINE_PREP)
	minimal_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_DROPSHIP)
	skills_type = /datum/skills/civilian/survivor
	total_positions = -1
	selection_color = "#ef0cf7"
	job_flags = JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_LATEJOINABLE|JOB_FLAG_ALLOWS_PREFS_GEAR|JOB_FLAG_PROVIDES_BANK_ACCOUNT|JOB_FLAG_ADDTOMANIFEST
	faction = FACTION_TERRAGOV
	job_category = JOB_CAT_CIVILIAN

/datum/outfit/job/mo
	id = /obj/item/card/id
	w_uniform = /obj/item/clothing/under/swimsuit/purple
	shoes = /obj/item/clothing/shoes/black
	l_store = /obj/item/storage/pouch/general/large
	ears = /obj/item/radio/headset/mainship

/datum/job/worker/moraleofficer/radio_help_message(mob/M)
	. = ..()
	to_chat(M, {"\nYou are a 'Morale Officer' fancy name for a free-use whore hired by a corporation to keep employees happy,
	do your job and try not to 'stain' the ship too much."})
