import { Players } from "@rbxts/services";

export function makeHello(name: string) {
	return Players.GetPlayers();
}
