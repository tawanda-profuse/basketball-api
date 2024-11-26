import { ChangeDetectorRef, Component, ViewEncapsulation } from '@angular/core'
import { ActivatedRoute } from '@angular/router'
import { untilDestroyed, UntilDestroy } from '@ngneat/until-destroy'
import { TeamsService } from 'app/_services/teams.service'

@UntilDestroy()
@Component({
  selector: 'app-all-teams',
  templateUrl: './all-teams.component.html',
  styleUrl: './all-teams.component.scss',
  encapsulation: ViewEncapsulation.None
})
export class AllTeamsComponent {
  teamsData: []
  loading: boolean = true

  constructor (
    protected activatedRoute: ActivatedRoute,
    protected cdr: ChangeDetectorRef,
    protected teamsService: TeamsService
  ) {}

  ngOnInit (): void {
    this.fetchTeamsData()
  }

  fetchTeamsData (): void {
    this.teamsService
      .getAllTeams()
      .pipe(untilDestroyed(this))
      .subscribe(data => {
        this.teamsData = data.apiResponse
        this.loading = false;
      })
  }

  ngOnDestroy () {
    this.fetchTeamsData()
  }
}
