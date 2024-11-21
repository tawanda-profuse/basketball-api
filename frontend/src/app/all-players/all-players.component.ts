import { ChangeDetectorRef, Component, ViewEncapsulation } from '@angular/core'
import { ActivatedRoute } from '@angular/router'
import { untilDestroyed, UntilDestroy } from '@ngneat/until-destroy'
import { PlayersService } from 'app/_services/players.service'

@UntilDestroy()
@Component({
  selector: 'app-all-players',
  templateUrl: './all-players.component.html',
  styleUrl: './all-players.component.scss'
})
export class AllPlayersComponent {
  playersData: []

  constructor (
    protected activatedRoute: ActivatedRoute,
    protected cdr: ChangeDetectorRef,
    protected playersService: PlayersService
  ) {}

  ngOnInit (): void {
    this.fetchPlayersData()
  }

  fetchPlayersData (): void {
    this.playersService
      .getAllPlayers()
      .pipe(untilDestroyed(this))
      .subscribe(data => {
        this.playersData = data?.apiResponse?.sort((a, b) => a.id - b.id)
      })
  }

  ngOnDestroy () {
    this.fetchPlayersData()
  }
}
