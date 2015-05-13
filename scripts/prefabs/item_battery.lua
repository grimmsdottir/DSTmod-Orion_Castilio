local assets=
{
	Asset("ANIM", "anim/item_battery.zip"),
	
	Asset("IMAGE", "images/inventoryimages/item_battery.tex"),
	Asset("ATLAS", "images/inventoryimages/item_battery.xml"),
}


local function fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	inst.entity:AddLight()

	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("item_battery")
	inst.AnimState:SetBuild("item_battery")
	inst.AnimState:PlayAnimation("idle")

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/item_battery.xml"
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.ORION.BATTERYSTACKSIZE
	
	inst:AddComponent("cookable")
    inst.components.cookable.product = "item_battery_charged"


	return inst
end



return Prefab("common/inventory/item_battery", fn, assets)