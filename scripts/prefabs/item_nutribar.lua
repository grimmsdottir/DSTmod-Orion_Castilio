local assets=
{
	Asset("ANIM", "anim/item_nutribar.zip"),
	
	Asset("IMAGE", "images/inventoryimages/item_nutribar.tex"),
	Asset("ATLAS", "images/inventoryimages/item_nutribar.xml"),
}


local function fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	inst.entity:AddLight()

	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("item_nutribar")
	inst.AnimState:SetBuild("item_nutribar")
	inst.AnimState:PlayAnimation("idle")
	
	inst:AddComponent("edible")
    inst.components.edible.hungervalue = TUNING.CALORIES_SMALL
    inst.components.edible.healthvalue = TUNING.HEALING_MEDSMALL
    inst.components.edible.sanityvalue = TUNING.SANITY_TINY
    inst.components.edible.foodtype = "ORIONNUTRI"

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/item_nutribar.xml"
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.ORION.BATTERYSTACKSIZE
	
	


	return inst
end



return Prefab("common/inventory/item_nutribar", fn, assets)