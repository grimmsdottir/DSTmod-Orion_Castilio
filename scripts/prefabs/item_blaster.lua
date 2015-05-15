local assets=
{
	Asset("ANIM", "anim/item_blaster.zip"),
    Asset("ANIM", "anim/swap_item_blaster.zip"),
	
	Asset("IMAGE", "images/inventoryimages/item_blaster.tex"),
	Asset("ATLAS", "images/inventoryimages/item_blaster.xml"),
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_item_blaster", "swap_item_blaster")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

--function to check the blaster's efficiency level
local function calcBattEfficiency(costdurr)

	local i = costdurr - ThePlayer.blasterbattefficiency
	if i < 1 or i == 1 then
		return 1
	else
		return i
	end	
end

--Checks if there are enough batteries, if there are, it returns true. If not, return false
local function useandrecyclebatt(basecost)

	--initialise batt as the stack of batteries in the inventory
	local batt = ThePlayer.components.inventory:FindItem(function(item) return item.prefab=="item_battery_charged" end) 
	
	--if there are no batteries at all, just end
	if not batt then
		ThePlayer.components.talker:Say("I have no batteries at all!")
		return false
	end
	
	--ThePlayer.components.talker:Say("Charged Battries " .. numbatt)
	local cost = calcBattEfficiency(basecost)
	local numbatt = batt.components.stackable:StackSize()
	if numbatt > cost or numbatt == cost then
		--ThePlayer.components.talker:Say("I have enough batteries")
		local batttobeused = batt.components.stackable:Get(cost)
		batttobeused:Remove()
		local i = cost
		repeat
			ThePlayer.components.inventory:GiveItem(SpawnPrefab("item_battery"))
			i = i - 1
		until i == 0
		return true
	else
		--ThePlayer.components.talker:Say("I do not have enough batteries")
		return false
	end
end

local function onattack_blaster(inst, attacker, target, skipsanity)

	
	if ThePlayer.blasterblaster then
	
		if useandrecyclebatt(ThePlayer.blasterblastercost) then
			--do blaster thingss
			--do damage
			ThePlayer.components.talker:Say("Get blasted!")
			target.components.health:DoDelta(-ThePlayer.blasterblasterdamage)
			
			--do normal combat triggers
			if target.components.sleeper and target.components.sleeper:IsAsleep() then
				target.components.sleeper:WakeUp()
			end
			if target.components.combat then
				target.components.combat:SuggestTarget(attacker)
			end
			if attacker and attacker.components.sanity and not skipsanity then
				attacker.components.sanity:DoDelta(-TUNING.SANITY_SUPERTINY)
			end
			attacker.SoundEmitter:PlaySound("dontstarve/wilson/fireball_explo")
			target:PushEvent("attacked", {attacker = attacker, damage = ThePlayer.blasterblasterdamage})
		else
			--dont do anything
			return
		end
	elseif ThePlayer.blasterstun then
	
		if useandrecyclebatt(ThePlayer.blasterblastercost) then
			ThePlayer.components.talker:Say("Night night!")
			if target.components.sleeper ~= nil then
				target.components.sleeper:AddSleepiness(ThePlayer.blasterstunpower, TUNING.PANFLUTE_SLEEPTIME)
			elseif target.components.grogginess ~= nil then
				target.components.grogginess:AddGrogginess(ThePlayer.blasterstunpower, TUNING.PANFLUTE_SLEEPTIME)
			else
				target:PushEvent("knockedout")
			end
		else
			return
		end
	end
	
end


local function fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	inst.entity:AddLight()

	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("item_blaster")
	inst.AnimState:SetBuild("item_blaster")
	inst.AnimState:PlayAnimation("idle")

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/item_blaster.xml"
	
	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(0)
    inst.components.weapon:SetRange(8, 10)
	inst.components.weapon:SetOnAttack(onattack_blaster)
    inst.components.weapon:SetProjectile("fire_projectile")
	
	inst.components.equippable.walkspeedmult = TUNING.CANE_SPEED_MULT
	


	return inst
end



return Prefab("common/inventory/item_blaster", fn, assets)