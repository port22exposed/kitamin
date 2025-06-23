import { RunService } from "@rbxts/services"

assert(!RunService.IsServer, "[kitamin]: attempt to require server library from client script.")
