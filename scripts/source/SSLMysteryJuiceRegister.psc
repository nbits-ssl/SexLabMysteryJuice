Scriptname SSLMysteryJuiceRegister extends Quest  

SexLabFramework Property SexLab Auto
Potion Property SSLMysteryJuiceSkooma  Auto

Event OnInit()
	RegisterForModEvent("HookOrgasmEnd", "SSLMJOnOrgasmEnd")
EndEvent

Event SSLMJOnOrgasmEnd(int tid, bool hasPlayer)
	sslThreadController controller = SexLab.GetController(tid)
	Actor victim = controller.Positions[0]
	Actor aggr = controller.Positions[1]
	
	if (victim && aggr)
		ObjectReference sperm = self.getSperm(aggr)
		if (sperm)
			victim.AddItem(sperm, 1)
		endif
	endif
EndEvent

ObjectReference Function getSperm(Actor aggr)
	string mjname = SSLMysteryJuiceSkooma.GetName()

	string aggrname = aggr.GetActorBase().GetName()
	if (aggrname == "")
		aggrname = aggr.GetLeveledActorBase().GetName()
	endif
	
	ObjectReference sperm = aggr.PlaceAtMe(SSLMysteryJuiceSkooma, 1)
	sperm.SetDisplayName(mjname + "(" + aggrname + ")")
	
	return sperm
EndFunction
