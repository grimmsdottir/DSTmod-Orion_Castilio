local assets=
{
	Asset("ANIM", "anim/item_blaster.zip"),
	
	Asset("IMAGE", "images/inventoryimages/item_blaster.tex"),
	Asset("ATLAS", "images/inventoryimages/item_blaster.xml"),
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_spear", "swap_spear")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
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
	


	return inst
end



return Prefab("common/inventory/item_blaster", fn, assets)