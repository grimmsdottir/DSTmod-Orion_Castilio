local assets=
{
	Asset("ANIM", "anim/up_health.zip"),
	
	Asset("IMAGE", "images/inventoryimages/up_health.tex"),
	Asset("ATLAS", "images/inventoryimages/up_health.xml"),
}


local function fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	inst.entity:AddLight()

	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("up_health")
	inst.AnimState:SetBuild("up_health")
	inst.AnimState:PlayAnimation("idle")

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/up_health.xml"
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.ORION.BATTERYSTACKSIZE
	
	inst:AddComponent("edible")
    inst.components.edible.foodtype = "ORIONUPHEALTH"


	return inst
end



return Prefab("common/inventory/up_health", fn, assets)