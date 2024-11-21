import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common"; 
import { AllPlayersComponent } from "./all-players.component";
import { routing } from "./all-players.routing";
import { TeamsService } from "app/_services/teams.service";

@NgModule({
    declarations: [AllPlayersComponent],
    imports: [
        CommonModule,
        routing
    ],
    providers: [TeamsService],
    bootstrap: [AllPlayersComponent]
})
export class AllPlayersModule { }