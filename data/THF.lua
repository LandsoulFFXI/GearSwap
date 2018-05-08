--------------------------------------------------------------------------------
--[[
	Author: Quetzalcoatl.Landsoul
--]]
--------------------------------------------------------------------------------
function get_sets()
	mote_include_version = 2

	include('Mote-Include.lua')
end


function job_setup()

	include('Land-Include.lua')

	state.Buff['Sneak Attack'] 		 = buffactive['Sneak Attack'] or false
	state.Buff['Trick Attack'] 		 = buffactive['Trick Attack'] or false
	state.Buff['Assassin\'s Charge'] = buffactive['Assassin\'s Charge'] or false

	single_hit_ws = S{'Wasp Sting','Shadowstitch','Viper Bite','Mercy Stroke','Mandalic Stab'}

	initialize_job()

end

function user_setup()

		include('Mote-TreasureHunter.lua')

		state.OffenseMode:options('Normal','HNM')
		state.WeaponskillMode:options('Normal','Acc')
		state.PhysicalDefenseMode:options('PDT')
		state.MagicalDefenseMode:options('MDT')

		send_command('bind f9 gs c cycle OffenseMode')
		send_command('bind f11 gs c cycle Kiting')
		send_command('bind f12 gs c cycle TreasureMode')

		--send_command('bind PAGEUP ws "Evisceration" <t>')
		send_command('bind PAGEUP input /ws "Mercy Stroke" <t>')
		--send_command('bind PAGEDOWN ra <t>')
		send_command('bind PAGEDOWN ws "Mandalic Stab" <t>')

end


function user_unload()

end

function init_gear_sets()

		--==[Misc]==--
		sets.TreasureHunter = {hands="Asn. Armlets +1"}
		sets.TreasureHunterWAR = set_combine(sets.TreasureHunter,{main="Thief's Knife"})

		--==[Precast sets]==--
		sets.precast.FC = {waist="Velocious Belt",ear2="Loquacious Earring",legs="Homam Legs"}

		--==[Midcast sets]==--
		sets.midcast['Utsusemi'] = {
			head="Walahra Turban",
											hands="Dusk Gloves +1",		ring1="Blitz Ring",
											waist="Velocious Belt",		legs="Homam Cosciales",			feet="Homam Gambieras"}

		-- ranged
		sets.precast.RA = {head="Zha'Go's barbut",body="Scorpion Harness +1"}
		
		sets.midcast.RA = {
			head="Zha'Go's barbut",			neck="Peacock amulet",		ear1="Drone earring",			ear2="Drone earring",
			body="Rapparee harness",		hands="Barbarossa's moufles",ring1="Behemoth ring +1",		ring2="Behemoth ring +1",
     		back="Mamool Ja mantle",		waist="Buccaneer's belt",	legs="Dusk trousers +1",		feet="Homam gambieras"}

		--==[Default melee group]==--
		sets.engaged = {
			main="Mandau",
			ammo="Fire Bomblet",
			head="Walahra Turban",			neck="Ancient Torque",		ear1="Suppanomimi",				ear2="Brutal Earring",
			body="Rapparee Harness",		hands="Dusk Gloves +1",		ring1=TRing1,					ring2=TRing2,
			back="Cuchulain's Mantle",		waist="Velocious Belt",		legs="Homam Cosciales",			feet="Homam Gambieras"}

		sets.engaged.HNM = set_combine(sets.engaged,{body="Homam Corazza",hands="Homam Manopolas"})

        sets.engaged.HNM.WAR = set_combine(sets.engaged.HNM,{ear1="Merman's Earring"})

        sets.engaged.WAR = set_combine(sets.engaged,{ear1="Merman's Earring"})

        sets.engaged.Mandau = set_combine(sets.engaged,{})

        sets.engaged.Mandau.HNM = set_combine(sets.engaged.HNM,{})

        sets.engaged.Mandau.WAR = set_combine(sets.engaged.WAR,{})

        sets.engaged.Mandau.HNM.WAR = set_combine(sets.engaged.HNM,{ear1="Merman's Earring"})

		sets.engaged['Vajra'] = {
			ammo="Fire Bomblet",
			head="Walahra Turban",			neck="Ancient Torque",		ear1="Suppanomimi",				ear2="Brutal Earring",
			body="Rapparee Harness",		hands="Dusk Gloves +1",		ring1=TRing1,					ring2=TRing2,
			back="Cuchulain's Mantle",		waist="Velocious Belt",		legs="Homam Cosciales",			feet="Homam Gambieras"}
		
		sets.precast.RA = {head="Zha'Go's barbut",body="Scorpion Harness +1"}

		--==[Global WS]==--
		sets.precast.WS = {
			ammo="Bomb Core",
			head="Hecatomb Cap +1",			neck="Fotia Gorget",		ear1="Pixie Earring",			ear2="Brutal Earring",
			body="Antares harness",			hands="Hct. Mittens +1",	ring1="Rajas Ring",				ring2="Flame Ring",
			back="Cerberus Mantle +1",		waist="Warwolf Belt",		legs="Hecatomb Subligar +1",	feet="Hecatomb Leggings +1"}

		--==[Dagger]==--
		sets.precast.WS['Mercy Stroke']	= set_combine(sets.precast.WS,{body="Hecatomb harness",hands="Alkyoneus's bracelets",ear1="Harmonius Earring"})
		sets.precast.WS['Mercy Stroke'].Acc = set_combine(sets.precast.WS['Mercy Stroke'],{ammo="Fire bomblet",hands="Enkidu's mittens",back="Cuchulain's mantle"})
		sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS,{head="Gnadbhod's helm",ear1="Merman's earring",body="Enkidu's Harness",hands="Tarasque Mitts +1",ring1="Thunder Ring",waist="Swordbelt +1"})
		sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS,{head="Hecatomb cap +1"})

		--==[SA WS]==--
		sets.precast.WS.SA = set_combine(sets.precast.WS,{ear1="Pixie earring"})
		sets.precast.WS['Mercy Stroke'].SA = set_combine(sets.precast.WS['Mercy Stroke'],{ear1="Pixie Earring",hands="Hecatomb mittens +1"})
		sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'],{ear1="Pixie earring"})

		--==[TA WS]==--
		sets.precast.WS.TA = set_combine(sets.precast.WS,{ear1="Drone earring",hands="Rogue's armlets +1"})
		sets.precast.WS['Mercy Stroke'].TA = set_combine(sets.precast.WS['Mercy Stroke'],{ear1="Drone earring",hands="Rogue's armlets +1"})
		sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'],{ear1="Drone earring",hands="Rogue's armlets +1",back="Assassin's cape"})

		--==[SATA WS]==--
		sets.precast.WS.SATA = set_combine(sets.precast.WS.TA,{back="Assassin's cape"})
		sets.precast.WS['Mercy Stroke'].SATA = set_combine(sets.precast.WS['Mercy Stroke'].TA,{body="Antares harness",back="Assassin's cape"})
		sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'].TA,{ear1="Pixie earring"})

		--==[Idle]==--
		sets.idle = {
			ammo="Bibiki seashell",
											neck="Chocobo whistle",		ear1="Merman's Earring",		ear2="Merman's Earring",
			body="Avalon Breastplate",		hands="Asn. Armlets +1",	ring1="Defending Ring",			ring2="Shadow Ring",
			back="Shadow Mantle",			waist="Lycopodium Sash",	legs="Dst. Subligar +1",		feet="Trotter Boots"}
        
		sets.idle.Town = set_combine(sets.idle,{ammo="Fire Bomblet",neck="Orochi nodowa +1",ring2="Warp ring",back="Nexus cape"})

		--==[Defense sets]==--
		sets.defense.PDT = {}

		sets.defense.MDT = {
			head="Valhalla Helm",			neck="Jeweled Collar +1",	ear1="Merman's earring",		ear2="Merman's earring",
			body="Avalon Breastplate",		hands="Merman's Mittens",	ring1="Defending ring",			ring2="Shadow ring",
			back="Lamia Mantle +1",			waist="Resolute Belt",		legs="Merman's Subligar",		feet="Merman's leggings"}

		sets.Kiting = {feet="Trotter Boots"}

end

--==[Idle]==--
function customize_idle_set(idleSet)
	if daytime then
		idleSet = set_combine(idleSet,{hands="Garden Bangles"})
	end

	if player.sub_job == 'WAR' then
		idleSet = set_combine(idleSet,{sub="Tatami Shield"})
	end
    return idleSet
end

--==[Melee groups]==--
function job_status_change(newStatus, oldStatus, eventArgs)
	update_combat_weapon()
	update_melee_groups()
end

function update_combat_weapon()
	state.CombatWeapon:set(player.equipment.main)
end

function update_melee_groups()

	classes.CustomMeleeGroups:clear()
	if player.sub_job == 'WAR' then
		classes.CustomMeleeGroups:append('WAR')
	end
end

function job_buff_change(buff,gain)

	update_neck(buff,gain)
	
	if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end

end

function check_range_lock()
	if player.equipment.range ~= 'empty' then
		disable('range', 'ammo')
	else
		enable('range', 'ammo')
	end
end

function customize_melee_set(meleeSet)

	if state.TreasureMode.value == 'Fulltime' then
		if player.sub_job == 'WAR' then
			meleeSet = set_combine(meleeSet, sets.TreasureHunterWAR)
		end

		if player.sub_job ~= 'WAR' then
			meleeSet = set_combine(meleeSet, sets.TreasureHunter)
		end
	end

	if daytime and player.sub_job == 'WAR' then
		if state.OffenseMode.value == 'Normal' or 'HNM' then
			meleeSet = set_combine(meleeSet,{ear1="Fenrir's earring"})
		end
	end

	return meleeSet

end

function job_post_precast(spell,action,spellMap,eventArgs)

	if spell.type == 'WeaponSkill' then
		if daytime then
			if state.Buff['Assassin\'s Charge'] then
				if single_hit_ws:contains(spell.name) then
					equip({ear2="Fenrir's earring"})
				else
					equip({ear1="Fenrir's earring"})
				end
			else
				equip({ear1="Fenrir's earring"})
			end
		else
			if state.Buff['Assassin\'s Charge'] then
				if single_hit_ws:contains(spell.name) then
					equip({ear2="Merman's earring"})
				end
			end
		end
	end


end

function get_custom_wsmode(spell,spellMap,default_wsmode)

    local wsmode
    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
    if state.Buff['Trick Attack'] then
        wsmode = (wsmode or '') .. 'TA'
    end
	--add_to_chat(state.CustomWeaponskillMode.value)
    return wsmode
	
end

function job_handle_equipping_gear(playerStatus,eventArgs)
	check_range_lock()

    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
	check_buff('Assassin\'s Charge', eventArgs)
	
end

function check_buff(name,eventArgs)
	
	if state.Buff[name] then
        equip(sets.buff[name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
	
end