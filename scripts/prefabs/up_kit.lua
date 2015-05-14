local assets=
{
	Asset("ANIM", "anim/up_kit.zip"),
	
	Asset("IMAGE", "images/inventoryimages/up_kit.tex"),
	Asset("ATLAS", "images/inventoryimages/up_kit.xml"),
}


local function fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	inst.entity:AddLight()

	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("up_kit")
	inst.AnimState:SetBuild("up_kit")
	inst.AnimState:PlayAnimation("idle")

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:SetPristine()

	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/up_kit.xml"
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.ORION.BATTERYSTACKSIZE


	return inst
end



return Prefab("common/inventory/up_kit", fn, assets)