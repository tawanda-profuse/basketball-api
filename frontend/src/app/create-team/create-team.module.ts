import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common"; 
import { CreateTeamComponent } from "./create-team.component";
import { routing } from "./create-team.routing";
import { TeamsService } from "app/_services/teams.service";
import { FormsModule } from "@angular/forms";

@NgModule({
    declarations: [CreateTeamComponent],
    imports: [
        CommonModule,
        routing,
        FormsModule
    ],
    providers: [TeamsService],
    bootstrap: [CreateTeamComponent]
})
export class CreateTeamModule { }