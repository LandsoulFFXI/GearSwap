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

		state.Buff['Mighty Strikes']    = buffactive['Mighty Strikes'] or false
		state.Buff['Warrior\'s Charge'] = buffactive['Warrior\'s Charge'] or false
		state.Buff['Berserk'] = buffactive['Berserk'] or false
		state.Buff['Aggressor'] = buffactive['Aggressor'] or false

		initialize_job()

end

function user_setup()
		state.OffenseMode:options('Normal','FiveHit','Acc','Tank')
		state.WeaponskillMode:options('Normal','Acc','Tor','Cap')
		state.PhysicalDefenseMode:options('PDT')
		state.MagicalDefenseMode:options('MDT')

		send_command('bind f9 gs c cycle OffenseMode')
		send_command('bind f11 gs c cycle Kiting')

		send_command('bind PAGEUP ws "Metatron Torment" <t>')
		--send_command('bind PAGEUP ws "Penta Thrust" <t>')
		--send_command('bind PAGEUP ws "Scourge" <t>')
		send_command('bind PAGEDOWN ja "Third Eye" <me>')
		--send_command('bind ^f12 gs equip defense.MDT')

end


function user_unload()

end

function init_gear_sets()

		--==[Misc]==--
		sets.enmity = {
			head="Warrior's mask",			neck="Ritter's Gorget",		ear1="Hades Earring +1",		ear2="Hades Earring +1",
			body="Warrior's lorica",		hands="Warrior's mufflers",	ring1="Mermaid Ring",			ring2="Hercules' ring",
			back="Cerberus mantle +1",		waist="Trance belt",		legs="Warrior's cuisses",		feet="Warrior's calligae"}

		--==[Precast JAs]==--
		sets.precast.JA['Provoke'] = sets.enmity

		--==[Precast sets]==--
		sets.precast.FC = {waist="Velocious Belt",ear2="Loquacious Earring"}

		--==[Midcast sets]==--
		sets.midcast['Utsusemi'] = {
			head="Walahra Turban",
			hands="Dusk Gloves +1",ring1="Blitz Ring",
			waist="Velocious Belt",feet="Dusk Ledelsens +1"}

		--==[Default melee group]==--
		sets.engaged = {
			ammo="Fire Bomblet",
			head="Walahra Turban",			neck="Ancient Torque",		ear1="Assault Earring",			ear2="Brutal Earring",
			body="Hachiryu Haramaki",		hands="Dusk Gloves +1",		ring1=TRing1,					ring2=TRing2,
			back="Cerberus Mantle +1",		waist="Velocious Belt",		legs="Byakko's Haidate",		feet="Unicorn Leggings"}

		sets.engaged.Acc = set_combine(sets.engaged,{neck="Ancient Torque",ring2="Toreador's Ring",back="Cuchulain's Mantle",feet="Aurum Sabatons"})

		sets.engaged.Tank = set_combine(sets.engaged,{ammo="Bibiki seashell",back="Shadow mantle",ring2="Defending ring"})

		--==[Bravura]==--
		sets.engaged.Bravura = set_combine(sets.engaged,{ring2="Rajas Ring",ammo="White Tathlum",feet="Aurum Sabatons"})
		sets.engaged.Bravura.FiveHit = set_combine(sets.engaged,{body="Aurum Cuirass"})
		sets.engaged.Bravura.Acc  = set_combine(sets.engaged.Acc,{body="Armada Hauberk"})
		sets.engaged.Bravura.Tank = set_combine(sets.engaged.Bravura,{ammo="Bibiki seashell",back="Shadow mantle",ring1="Defending ring",feet="Aurum Sabatons"})

		--==[Bravura (SAM)]==--
		sets.engaged.Bravura.SAM = set_combine(sets.engaged,{ring2=TRing2,neck="Fortitude Torque",feet="Aurum Sabatons"})
		sets.engaged.Bravura.FiveHit.SAM = set_combine(sets.engaged,{body="Aurum Cuirass",ring2="Rajas Ring",neck="Fortitude Torque"})
		sets.engaged.Bravura.Acc.SAM = set_combine(sets.engaged.Bravura.SAM,{neck="Ancient Torque",ear1="Assault earring",back="Cuchulain's mantle",feet="Aurum sabatons"})
		sets.engaged.Bravura.Tank.SAM = set_combine(sets.engaged.Bravura.SAM,{ring1="Defending ring",feet="Aurum Sabatons",ring2=TRing1})

		--==[Ragnarok]==--
		sets.engaged.Ragnarok = set_combine(sets.engaged,{})
		sets.engaged.Ragnarok.Acc = set_combine(sets.engaged.Acc,{body="Aurum Cuirass"})

		--==[Ragnarok (SAM)]==--
		sets.engaged.Ragnarok.SAM = set_combine(sets.engaged.Ragnarok,{ring1=TRing2,ring2="Rajas Ring",feet="Aurum Sabatons"})		
		sets.engaged.Ragnarok.Acc.SAM = set_combine(sets.engaged.Ragnarok.Acc,{})

		--==[Ridill]==--
		sets.engaged.Ridill = set_combine(sets.engaged,{ear1="Suppanomimi"})		
		sets.engaged.Ridill.Acc  = set_combine(sets.engaged.Ridill,{})		
		sets.engaged.Ridill.Tank = set_combine(sets.engaged.Ridill,{ammo="Bibiki seashell",back="Shadow mantle",ring2="Defending ring"})

		--==[Level cap]==--
		sets.engaged['Couse +1'] = {
			head="Patroclus's Helm",		neck="Peacock Amulet",		ear1="Assault Earring",			ear2="Cassie Earring",
			body="Scorpion Harness +1",		hands="Ryl.Kgt. Mufflers",	ring1=TRing1,					ring2=TRing2,
			back="Amemet Mantle +1",		waist="Velocious Belt",		legs="Ryl.Kgt. Breeches",		feet="Bounding Boots"}

		--==[Global WS]==--
		sets.precast.WS = {
			head="Hecatomb Cap +1",			neck="Fotia Gorget",		ear1="Harmonius Earring",		ear2="Brutal Earring",
			body="Armada Hauberk",			hands="Alkyoneus's Brc.",	ring1="Flame Ring",				ring2="Rajas Ring",
			back="Cerberus Mantle +1",		waist="Warwolf Belt",		legs="Hachiryu Haidate",		feet="Hecatomb Leggings +1"}

		--==[Great Axe]==--
		sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {waist="Potent Belt"})
		sets.precast.WS['Raging Rush'].Acc = set_combine(sets.precast.WS.Acc, {waist="Potent Belt"})
		sets.precast.WS['Metatron Torment'] = set_combine(sets.precast.WS, {ammo="Bomb Core",waist="Warrior's Stone"})
		sets.precast.WS['Metatron Torment'].Acc = set_combine(sets.precast.WS, {ammo="Fire Bomblet",waist="Warrior's stone"})
		sets.precast.WS['Metatron Torment'].Tor = set_combine(sets.precast.WS, {ring1=TRing1,ring2=TRing2})

		--==[Polearm]==--
		sets.precast.WS['Penta Thrust'] = set_combine(sets.precast.WS, {ring1=TRing1,ring2=TRing2,waist="Warrior's Stone"})
		sets.precast.WS['Penta Thrust'].Acc = set_combine(sets.precast.WS.Acc, {})
		sets.precast.WS['Penta Thrust'].Cap = set_combine(sets.precast.WS.Cap, {ring1=TRing1,ring2,waist="Potent Belt",head="Empress Hairpin"})

		--==[Greatsword]==--
		sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {waist="Potent Belt"})
		sets.precast.WS['Scourge'] = set_combine(sets.precast.WS, {head="Nocturnus Helm",ear1="Assault Earring",hands="Tarasque mitts +1",wait="Swordbelt +1"})
		sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {waist="Potent Belt"})
		sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS, {legs="Byakko's Haidate"})

		--==[Sword]==--
		sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS,{body="Nocturnus Helm",body="Hachiryu Haramaki",hands="Hct. Mittens +1",ring1=TRing1,back="Cuchulain's mantle",legs="Hct. Subligar +1"})

		--==[Scythe]==--
		sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS, {legs="Byakko's Haidate"})

		--==[Idle]==--
		sets.idle = {
			ammo="Bibiki seashell",
			head="Nocturnus Helm",			neck="Chocobo whistle",		ear1="Merman's Earring",		ear2="Merman's Earring",
			body="Conte corazza",			hands="Heavy Gauntlets",	ring1="Defending Ring",			ring2="Shadow Ring",
			back="Shadow Mantle",			waist="Resolute Belt",		legs="Kaiser diechlings",		feet="Hermes' Sandals +1"}

		sets.idle.Town = set_combine(sets.idle,{neck="Orochi nodowa +1",ring2="Warp ring",back="Nexus cape"})

		--==[Defense sets]==--
		sets.defense.PDT = {ammo="Bibiki seashell",head="Nocturnus Helm",body="Valhalla breastplate",hands="Heavy gauntlets",ring1="Defending ring",ring2="Jelly ring",back="Shadow Mantle"}

		sets.defense.MDT = {
			head="Valhalla Helm",			neck="Jeweled Collar +1",	ear1="Merman's earring",		ear2="Merman's earring",
			body="Nocturnus Mail",			hands="Merman's Mittens",	ring1="Defending ring",			ring2="Shadow ring",
			back="Lamia Mantle +1",			waist="Resolute Belt",		legs="Merman's Subligar",		feet="Merman's leggings"}

		sets.Kiting = {feet="Powder Boots"}

end

--==[Idle]==--
function customize_idle_set(idleSet)
	if player.hpp < 70 then
		idleSet = set_combine(idleSet,{neck="Orochi nodowa +1"})
	end

	if daytime then
		idleSet = set_combine(idleSet,{waist="Lycopodium Sash"})
	end

	if player.hpp < 51 then
		idleSet = set_combine(idleSet,{ring2="Hercules' ring"})
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
	if player.sub_job == 'SAM' then
		classes.CustomMeleeGroups:append('SAM')
	end
end

function job_buff_change(buff, gain)
	update_neck(buff,gain)
end

--==[TP earring]==--
function customize_melee_set(meleeSet)

	if daytime and player.equipment.main ~= 'Ridill' then
		if state.OffenseMode.value == 'Normal' or state.OffenseMode.value == 'FiveHit' then
			meleeSet = set_combine(meleeSet,{ear1="Fenrir's earring"})
		end
	end

	return meleeSet

end

--==[WS earring]==--
function job_post_precast(spell,action,spellMap,eventsArgs)
	if spell.type == 'WeaponSkill' then
		
		if daytime and state.WeaponskillMode.value == 'Normal' then
			equip({ear1="Fenrir's earring"})
		end
		
		if state.WeaponskillMode.value == 'Tor' then
			if daytime then
				equip({ear1="Fenrir's earring"})
			end
			
			if state.Buff['Warrior\'s Charge'] then
				equip({ring1="Rajas Ring",ring2="Flame Ring"})
				if daytime then
					equip({ear1="Fenrir's earring"})
				end
			end

		end

	end

end