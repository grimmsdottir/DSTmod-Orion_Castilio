local assets=
{
	Asset("ANIM", "anim/item_battery_charged.zip"),
	
	Asset("IMAGE", "images/inventoryimages/item_battery_charged.tex"),
	Asset("ATLAS", "images/inventoryimages/item_battery_charged.xml"),
}


local function fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	inst.entity:AddLight()

	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("item_battery_charged")
	inst.AnimState:SetBuild("item_battery_charged")
	inst.AnimState:PlayAnimation("idle")

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/item_battery_charged.xml"
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.ORION.BATTERYSTACKSIZE
	
	inst:AddComponent("cookable")
    inst.components.cookable.product = "item_battery_charged"
	
	inst:AddTag("show_spoilage")
	inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.ORION.BATTERYLIFE)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "item_battery"


	return inst
end



return Prefab("common/inventory/item_battery_charged", fn, assets)