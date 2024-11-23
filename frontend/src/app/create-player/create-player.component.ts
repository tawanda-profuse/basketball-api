import { ChangeDetectorRef, Component } from '@angular/core'
import { Router } from '@angular/router'
import { UntilDestroy, untilDestroyed } from '@ngneat/until-destroy'
import { PlayersService } from 'app/_services/players.service'

@UntilDestroy()
@Component({
  selector: 'app-create-player',
  templateUrl: './create-player.component.html',
  styleUrl: './create-player.component.scss'
})
export class CreatePlayerComponent {
  playerName: string = ''
  playerPoster: string = ''

  constructor (
    protected cdr: ChangeDetectorRef,
    protected playersService: PlayersService,
    private router: Router
  ) {}

  addPlayerData (): void {
    if (!this.playerName.trim()) {
      alert('Player name is required.')
      return
    }

    if (!this.playerPoster.trim()) {
      alert('Player poster is required.')
      return
    }

    this.playersService
      .createPlayer({ name: this.playerName, poster: this.playerPoster })
      .pipe(untilDestroyed(this))
      .subscribe(
        () => {
          alert('Player details saved successfully!')
          this.playerName = ''
          this.router.navigate(['/players'])
        },
        error => {
          alert('Error creating player.')
          console.error(error)
        }
      )
  }
}
