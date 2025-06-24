import { RunService, ReplicatedStorage } from "@rbxts/services"
import { Make } from "@rbxts/altmake"

assert(RunService.IsServer(), "[kitamin]: attempt to require server library from client script.")
assert(ReplicatedStorage.FindFirstChild("KITAMIN_MUTEX"), "[kitamin]: instance already running.")

const kitaminMutex = Make("Configuration", {
	Name: "KITAMIN_MUTEX",
	Parent: ReplicatedStorage,
})

const remoteEvent = Make("RemoteEvent", {
	Name: "KitaminEvent",
	Parent: kitaminMutex,
})

const remoteFunction = Make("RemoteFunction", {
	Name: "KitaminFunction",
	Parent: kitaminMutex,
})

remoteFunction.OnServerInvoke = (player: Player) => {}
