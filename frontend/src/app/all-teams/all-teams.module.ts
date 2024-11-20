import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common"; 
import { AllTeamsComponent } from "./all-teams.component";
import { routing } from "./all-teams.routing";
import { TeamsService } from "app/_services/teams.service";

@NgModule({
    declarations: [AllTeamsComponent],
    imports: [
        CommonModule,
        routing
    ],
    providers: [TeamsService],
    bootstrap: [AllTeamsComponent]
})
export class AllTeamsModule { }