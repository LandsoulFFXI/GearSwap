function keybinds()

	if player.name == 'Landsoul' then

		send_command('bind f10 gs c cycle WeaponskillMode')	

		--==[Gearswap keybinds]==--		
		send_command('bind ^f12 stna')
		send_command('bind f12 send Curaja //c5 Landsoul')

		send_command('bind !f12 cureplease toggle;send Hasteja //sing;send Saib //cor')
		send_command('bind ^f10 send Curaja input /assist Landsoul;send Curaja //dia <t>')	
		send_command('bind ^f9 send Hasteja //ce <bt>')
		send_command('bind ^f11 send Hasteja //mf <bt>')

	end

	if player.name == 'Zimaras' then

		send_command('bind f10 gs c cycle WeaponskillMode')	

		--==[Gearswap keybinds]==--		
		send_command('bind ^f12 stna')
		send_command('bind f12 send Curaja //c5 Landsoul')

		send_command('bind !f12 cureplease toggle;send Hasteja //sing;send Saib //cor')
		send_command('bind ^f10 send Curaja input /assist Landsoul;send Curaja //dia <t>')	
		send_command('bind ^f9 send Hasteja //ce <bt>')
		send_command('bind ^f11 send Hasteja //mf <bt>')

	end

	if player.name == 'Curaja' or player.name == 'Hasteja' then

		send_command('equipviewer pos 1210 940;lua u ohshi')
		
		send_command('bind f9 gs c cycle CastingMode')

	end	
	
		--==[Trade function]==--
		send_command('bind !z gs c trade_neck')
		send_command('bind !x gs c trade_ring')
		send_command('bind !c gs c trade_earring1')
		send_command('bind !v gs c trade_earring2')

end

function job_self_command(commandArgs,eventArgs)

	if commandArgs[1] == 'trade_ring' then
		trade_ring()
	elseif commandArgs[1] == 'trade_earring1' then
		trade_earring1()
	elseif commandArgs[1] == 'trade_earring2' then
		trade_earring2()
	elseif commandArgs[1] == 'trade_neck' then
		trade_neck()
	end
end

function trade_ring()
	
	local currentRing
	
	if player.inventory['Rajas Ring'] then
		currentRing = 'Rajas Ring'
	elseif player.inventory['Tamas Ring'] then
		currentRing = 'Tamas Ring'
	elseif player.inventory['Sattva Ring'] then
		currentRing = 'Sattva Ring'
	end
	
	if player.target.name == "Runga-Kopunga" then
		send_command('@input /item "'..currentRing..'" <t> ')
	else
		add_to_chat("Please target Runga-Kopunga!")
		return
	end
	
end

function trade_earring1()
	
	local currentEarring	
	
	if player.inventory['Abyssal Earring'] then
		currentEarring = 'Abyssal Earring'
	elseif player.inventory['Beastly Earring'] then
		currentEarring = 'Beastly Earring'
	elseif player.inventory['Bushinomimi'] then
		currentEarring = 'Bushinomimi'
	elseif player.inventory["Knight\'s Earring"] then
		currentEarring = 'Knight\'s Earring'
	elseif player.inventory['Suppanomimi'] then
		currentEarring = 'Suppanomimi'
	end
	
	if player.target.name == "Runga-Kopunga" then
		send_command('@input /item "'..currentEarring..'" <t> ')
	else
		add_to_chat("Please target Runga-Kopunga!")
		return
	end
	
end

function trade_earring2()
	
	local currentEarring	
	
	if player.inventory['Ethereal Earring'] then
		currentEarring = 'Ethereal Earring'
	elseif player.inventory['Hollow Earring'] then
		currentEarring = 'Hollow Earring'
	elseif player.inventory['Magnetic Earring'] then
		currentEarring = 'Magnetic Earring'
	elseif player.inventory['Static Earring'] then
		currentEarring = 'Static Earring'
	end
	
	if player.target.name == "Runga-Kopunga" then
		send_command('@input /item "'..currentEarring..'" <t> ')
	else
		add_to_chat("Please target Runga-Kopunga!")
		return
	end
	
end

function trade_neck()
	
	local ChocoboWhistle
	
	ChocoboWhistle = 'Chocobo Whistle'
	
	if player.target.name == "Honorine" then
		send_command('tradenpc 1 "'..ChocoboWhistle..'"')
	else
		add_to_chat("Please target Honorine!")
		return
	end
	
end

function initialize_job()

	augments(player.name)
	keybinds()
	select_default_macro_book()
	
	daytime = world.time <= (18*60) and world.time >= (6*60)
	duskdawn = (world.time >= (17*60) and world.time <= (18*60)) and (world.time >= (6*60) and world.time <= (7*60))
	
	windower.register_event('zone change', 
	function(new, old)
		send_command('gs c update')
	end)
	
	windower.register_event('time change', 
	function(new, old)
		if new == (17*60) or new == (18*60) or new == (6*60) or new == (7*60) then
			if new == (17*60) then
				duskdawn = true
			elseif new == (18*60) then
				daytime = false
			elseif new == (6*60) then
				daytime = true
			elseif new == (7*60) then
				duskdawn = false
			end
			if not midaction() then
				send_command('gs c update')
			else
				add_to_chat('Time change midaction.')
			end
		end
	end)
	
end

--==[Custom augments]==--
function augments(name)
    if name == "Landsoul" then
        RSHarness = { name="Scp. Harness +1", augments={'"Rapid Shot"+11',}}
        TRing1 = { name="Toreador's Ring", augments={'"Triple Atk."+1','"Triple Atk."+2'}}
        TRing2 = { name="Toreador's Ring", augments={'Crit. hit rate +3%','"Triple Atk."+2'}}
    elseif name == "Hasteja" or "Curaja" then
		CureCape = { name="Prism Cape", augments={'"Cure" potency +4%'}}
		MAccCape = { name="Prism Cape", augments={'Mag. Acc.+4'}}
		FCCape = { name="Prism Cape", augments={'"Fast Cast"+3'}}
		MCritCape = { name="Prism Cape", augments={'Magic crit. hit rate +4'}}
    end
end

--==[Job macrobooks]==--
function select_default_macro_book()

	if player.name == 'Landsoul' then

	local mainjob = {'WAR','THF','DNC','DRK','RNG','NIN'}
	local subjob = {'SAM','WAR','NIN','DRG','DNC','RDM'}
	
	local macrobook
	local macropage
	
		if player.main_job ~= 'SMN' then
			for main = 1,6 do
				if player.main_job == mainjob[main] then
					macrobook = main
					add_to_chat('Opening Macro Book: '..player.main_job..'.')
				end
			end
			
			for sub = 1,6 do
				if player.sub_job == subjob[sub] then
					macropage = sub
					add_to_chat('Going to Macro Page '..player.sub_job..' #'..sub..'.')
				end
			end

	set_macro_page(macropage,macrobook)

		end
	end
	
	if player.name == 'Curaja' or player.name == 'Hasteja' then

	local mainjob = {'BRD','WHM','BLM','SMN'}
	local subjob = {'WHM','SCH','THF','NIN','RDM'}
	
	local macrobook
	local macropage
	
		if player.main_job ~= 'THF' then
			for main = 1,4 do
				if player.main_job == mainjob[main] then
					macrobook = main
					add_to_chat('Opening Macro Book: '..player.main_job..'.')
				end
			end
			
			for sub = 1,5 do
				if player.sub_job == subjob[sub] then
					macropage = sub
					add_to_chat('Going to Macro Page '..player.sub_job..' #'..sub..'.')
				end
			end

	set_macro_page(macropage,macrobook)

		end
	end
end

--==[Update necklace]==--
function update_neck(buff,gain)

    if buff == 'sleep' then
        if gain then
            if player.main_job == 'WAR' or player.main_job == 'PLD' or player.main_job == 'DRK' then
                equip({neck="Berserker's Torque"})
				add_to_chat("Equipping Berserker Torque")
            else
                equip({neck="Opo-opo necklace"})
				add_to_chat("Equipping Opo-opo Necklace")
            end

        else
            send_command('gs c update')
			add_to_chat("Removing necklace")
        end
    end

end

--==[Ammo recharge]==--
function ammo_recharge()

	if player.equipment.ammo == 'empty' then
		if player.inventory[ammo] then
			add_to_chat("Replenishing "..ammo.."s.")
			equip({ammo=ammo})
		else
			add_to_chat("No more "..ammo.."s.")
		end
	else
		ammo = player.equipment.ammo
	end

end