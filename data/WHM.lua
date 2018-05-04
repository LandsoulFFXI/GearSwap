--------------------------------------------------------------------------------
--[[
	Author: Quetzalcoatl.Landsoul
--]]
--------------------------------------------------------------------------------
function get_sets()
	mote_include_version = 2

include('Mote-Mappings.lua')
include('Mote-Include.lua')
include('organizer-lib')
end


function job_setup()

		include('Land-Include.lua')

		state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
		state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false

		initialize_job()
end

function user_setup()
		state.CastingMode:options('Normal')
		
		send_command('bind ^f12 input /ja Celerity <me>')		
		send_command('bind f12 input /ja sublimation <me>')

		send_command('bind PAGEUP input /ma Repose <t>')
		send_command('bind PAGEDOWN input /ma silence <t>')
end


function user_unload()

end

function init_gear_sets()

		--==[Misc sets]==--
		sets.precast.FC = {ear2="Loquacious Earring",back=FCCape,feet="Rostrum Pumps"}
		sets.MND = {
			main="Mjollnir",				sub="Muse Tariqah",											ammo="Holy Ampulla",
			head="Healer's Cap +1",			neck="Ajari Necklace",		ear1="Star Earring",			ear2="Star Earring",
			body="Errant Hpl.",				hands="Blessed Mitts +1",	ring1="Aqua Ring",				ring2="Tamas Ring",
			back="Prism Cape",				waist="Cleric's Belt",		legs="Mahatma Slops",			feet="Clr. Duckbills +1"}

		--==[Precast Sets]==--
		sets.precast.FC = {ear2="Loquacious Earring",back=FCCape,feet="Rostrum Pumps"}
		sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Cure Clogs"})

		--==[Midcast sets]==--
		sets.midcast['Healing Magic'] = set_combine(sets.MND,{
			neck="Fylgja Torque +1",ear1="Novia Earring",ear2="Roundel Earring",
			body="Aristocrat's Coat",hands="Healer's Mitts +1",
			back=CureCape,legs="Bls. Trousers +1"})

		sets.midcast['Enhancing Magic'] = {head="Walahra Turban",feet="Clr. Duckbills +1"}

		sets.midcast['Enfeebling Magic'] = set_combine(sets.MND,{
			main="Chatoyant Staff",			sub="Raptor Strap +1",										ammo="Sturm's Report",
											neck="Spider torque", 
			body="Healer's briault", 		hands="Bricta's cuffs",
			back=MAccCape,																				feet="Avocat pigaches"})

		sets.midcast['Divine Magic'] = set_combine(sets.MND,{main="Chatoyant Staff",sub="Raptor Strap +1",ammo="Sturm's Report",back=MAccCape})
		sets.midcast['Stoneskin'] = set_combine(sets.MND, {})

		sets.midcast.Regen = {body="Cleric's Briault"}
		
		 sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'],{body="Blessed Briault",legs="Cleric's Pantaloons"})

        --==[Weaponskill sets]==--
        sets.engaged = {
			head="Walahra Turban",			neck="Peacock Amulet",		ear1="Assault Earring",			ear2="Fowling Earring",
			body="Demon's Harness",			hands="Dusk Gloves",		ring1="Sniper's Ring +1",		ring2="Sniper's Ring",
			back="Cerberus Mantle",			waist="Velocious Belt",		legs="Onyx Cuisses",			feet="Dusk Ledelsens"}

		--==[Weaponskill sets]==--
		sets.precast.WS = {}

		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Potent Belt",legs="Byakko's Haidate"})
		sets.precast.WS['True Strike'] = set_combine(sets.precast.WS, {feet="Chaos Sollerets",waist="Potent Belt"})
		sets.precast.WS['Retrobution'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Twilight Belt",legs="Byakko's Haidate"})
		sets.precast.WS['Full Swing'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Twilight Belt",legs="Byakko's Haidate"})
		sets.precast.WS['Spirit Taker'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Twilight Belt",legs="Byakko's Haidate"})

		sets.midcast.Sneak = {back="Skulker's Cape"}

		sets.midcast.Invisible = sets.midcast.Sneak

		sets.midcast.Enfeebling = {head=="Elite Beret +1",neck="Spider Torque",body="Healer's Briault"}

        sets.midcast.Enhancing = {
		neck="Enhancing Torque",ear2="Augment. Earring",back="Merciful Cape",feet="Clr. Duckbills +1"}

		--==[Idle sets]==--
		sets.idle = {
			main="Mjollnir",				sub="Genbu's Shield",
			head="Walahra Turban",			neck="Chocobo whistle",		ear1="Novia Earring",			ear2="Roundel Earring",
			body="Aristocrat's Coat",		hands="Blessed Mitts +1",	ring1="Aqua ring",				ring2="Tamas Ring",
			back="Umbra Cape",				waist="Cleric's Belt",		legs="Blessed Trousers +1",		feet="Herald's Gaiters"}

		sets.idle.Town = set_combine(sets.idle,{neck="Fylgja Torque +1",back="Nexus cape"})

		--==[Resting sets]==--
		sets.resting = {
			main="Mjollnir",				sub="Legion Scutum",		ammo="Bibiki Seashell",
			head="Mirror Tiara",			neck="Beak Necklace +1",	ear1="Rapture Earring",			ear2="Relaxing Earring",
			body="Oracle's Robe",			hands="Oracle's Gloves",	ring1="Star Ring",				ring2="Star Ring",
											waist="Cleric's Belt",		legs="Oracle's Braconi",		feet="Avocat pigaches"}

		--==[Defense sets]==--
		sets.defense.PDT = {}

		sets.defense.MDT = {}

		sets.Kiting = {feet="Herald's Gaiters"}

end

function job_post_aftercast(spell, action, spellMap, eventArgs)
		send_command('gs c update')
end

function job_update(cmdParams, eventArgs)
    if not areas.Cities:contains(world.area) then
        local needsArts =
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
           
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
				send_command('wait 3;input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('wait 3;input /ja "Afflatus Solace" <me>')
            end
        end
		
    end
end

function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end