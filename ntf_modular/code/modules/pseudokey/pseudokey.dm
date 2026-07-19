GLOBAL_LIST_EMPTY(ckey_to_pseudokey)
GLOBAL_LIST_EMPTY(pseudokey_to_ckey)

/proc/get_new_pseudokey()
	var/new_pseudokey
	do
		new_pseudokey = pick(SSstrings.get_list_from_file("names/operation_prefix"))
		new_pseudokey += " "
		new_pseudokey += pick(SSstrings.get_list_from_file("names/operation_postfix"))
		new_pseudokey += " "
		new_pseudokey += pick(SSstrings.get_list_from_file("names/prototype_supersoldier"))
		new_pseudokey += "-"
		new_pseudokey += pick(SSstrings.get_list_from_file("names/death_squad"))
		new_pseudokey += " "
		new_pseudokey += pick(SSstrings.get_list_from_file("names/robotic"))
	while(GLOB.pseudokey_to_ckey[new_pseudokey])
	return new_pseudokey

ADMIN_VERB(test_pseudokey_gen, R_ADMIN, "Test Codename Gen","Generate 10 random codenames.", ADMIN_CATEGORY_MAIN)
	for(var/i = 1 to 10)
		to_chat(src, get_new_pseudokey())

/// Takes a ckey and returns the associated psuedokey
/proc/get_pseudokey(ckey_for)
	if(!ckey_for || !istext(ckey_for))
		return "*?NONE?*"
	. = GLOB.ckey_to_pseudokey[ckey_for]
	if(.)
		return
	. = get_new_pseudokey()
	GLOB.ckey_to_pseudokey[ckey_for] = .
	GLOB.pseudokey_to_ckey[.] = ckey_for

/proc/cmp_pkey_asc(client/a, client/b)
	return sorttext(get_pseudokey(b.ckey), get_pseudokey(a.ckey))

/proc/cmp_pkey_dsc(client/a, client/b)
	return sorttext(get_pseudokey(a.ckey), get_pseudokey(b.ckey))

