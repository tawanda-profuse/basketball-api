import { ChangeDetectorRef, Component } from '@angular/core'
import { Router } from '@angular/router';
import { UntilDestroy, untilDestroyed } from '@ngneat/until-destroy'
import { TeamsService } from 'app/_services/teams.service'

@UntilDestroy()
@Component({
  selector: 'app-create-team',
  templateUrl: './create-team.component.html',
  styleUrl: './create-team.component.scss'
})
export class CreateTeamComponent {
  teamId: number;
  teamName: string = '';

  constructor (
    protected cdr: ChangeDetectorRef,
    protected teamsService: TeamsService,
    private router: Router
  ) {}

  addTeamData(): void {
    if (!this.teamName.trim()) {
      alert('Team name is required.');
      return;
    }

    this.teamsService
      .createTeam({ name: this.teamName, id: this.teamId })
      .pipe(untilDestroyed(this))
      .subscribe(
        data => {
          alert('Team created successfully!');
          this.teamName = ''; // Reset the form
          this.router.navigate(['/teams']);
        },
        error => {
          alert('Error creating team.');
          console.error(error);
        }
      );
  }
}
