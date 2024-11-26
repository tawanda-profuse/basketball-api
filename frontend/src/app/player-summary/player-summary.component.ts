import {
  ChangeDetectorRef,
  Component,
  OnDestroy,
  OnInit,
  ViewEncapsulation
} from '@angular/core'
import { ActivatedRoute, Router } from '@angular/router'
import { untilDestroyed, UntilDestroy } from '@ngneat/until-destroy'
import { PlayersService } from '../_services/players.service'

@UntilDestroy()
@Component({
  selector: 'player-summary-component',
  templateUrl: './player-summary.component.html',
  styleUrls: ['./player-summary.component.scss'],
  encapsulation: ViewEncapsulation.None
})
export class PlayerSummaryComponent implements OnInit, OnDestroy {
  endpoint: any
  endpoint2: any
  apiResponse: any
  apiResponse2: any
  playerData: any = {
    name: '', // Initialize as an empty string
    poster: '',
    date: null, // Initialize as null or a default date
    minutes: 0,
    points: 0,
    assists: 0,
    rebounds: 0,
    steals: 0,
    blocks: 0,
    turnovers: 0,
    fouls: 0,
    freeThrowsMade: 0,
    freeThrowsAttempted: 0,
    twoThrowsMade: 0,
    twoThrowsAttempted: 0,
    threeThrowsMade: 0,
    threeThrowsAttempted: 0,
    game_id: 0,
    isMake: false,
    locationX: 0,
    locationY: 0
  }

  madeShots = []
  missedShots = []

  playerID: number = 1 // changing this value will update the UI
  gameID: number = 1 // changing this value will update the UI
  dateFilter = 0 // changing this value will filter the API results based on the date
  public playersInfo
  public playerShotsInfo
  loading: boolean = true

  constructor (
    private route: ActivatedRoute,
    protected cdr: ChangeDetectorRef,
    protected playersService: PlayersService,
    private router: Router
  ) {}

  ngOnInit (): void {
    this.route.params.subscribe(params => {
      const playerId = +params['id']
      this.fetchApiResponse(playerId)
      this.shotsApiResponse(playerId)
    })
  }

  changeParams (): void {
    this.fetchApiResponse(this.playerID)
    this.shotsApiResponse(this.playerID)
  }

  getUniqueDates (data: any[]): any[] {
    const uniqueDates = new Set()
    return data.filter(item => {
      if (!uniqueDates.has(item.date)) {
        uniqueDates.add(item.date)
        return true
      }
      return false
    })
  }

  fetchApiResponse (playerID: any): void {
    this.playersService
      .getPlayerSummary(playerID)
      .pipe(untilDestroyed(this))
      .subscribe(data => {
        if (!data || !data.apiResponse || data.apiResponse.length === 0) {
          // Redirect if no data is found
          alert('Player details not found')
          this.router.navigate(['/players']) // Replace with your "not found" route
          return
        }

        this.endpoint = data.endpoint
        this.apiResponse = JSON.stringify(data.apiResponse, null, 2)
        this.playersInfo = this.getUniqueDates(data.apiResponse) // Filter duplicates

        // Ensure `dateFilter` is within bounds
        if (this.dateFilter >= this.playersInfo.length) {
          this.dateFilter = 0
        }

        // Use dateFilter to set playerData values
        const selectedData = data.apiResponse[this.dateFilter]
        this.playerData.poster = selectedData.poster
        this.playerData.name = selectedData.player_name
        this.playerData.date = selectedData.date // Ensure this matches `playersInfo`
        this.playerData.minutes = selectedData.minutes
        this.playerData.assists = selectedData.assists
        this.playerData.rebounds =
          selectedData.offensiveRebounds + selectedData.defensiveRebounds
        this.playerData.points = selectedData.points
        this.playerData.steals = selectedData.steals
        this.playerData.blocks = selectedData.blocks
        this.playerData.turnovers = selectedData.turnovers
        this.playerData.fouls =
          selectedData.offensiveFouls + selectedData.defensiveFouls
        this.playerData.freeThrowsMade = selectedData.freeThrowsMade
        this.playerData.freeThrowsAttempted = selectedData.freeThrowsAttempted
        this.playerData.twoPointersMade = selectedData.twoPointersMade
        this.playerData.twoPointersAttempted = selectedData.twoPointersAttempted
        this.playerData.threePointersMade = selectedData.threePointersMade
        this.playerData.threePointersAttempted =
          selectedData.threePointersAttempted

        // Trigger change detection manually if needed
        this.cdr.detectChanges()
        this.loading = false
      })
  }

  shotsApiResponse (playerID: any): void {
    this.playersService
      .getPlayerShots(playerID, this.gameID)
      .pipe(untilDestroyed(this))
      .subscribe(data => {
        this.endpoint2 = data.endpoint
        this.apiResponse2 = JSON.stringify(data.apiResponse, null, 2)
        this.madeShots = data.apiResponse
          .filter(shot => shot.isMake)
          .map(shot => ({
            locationX: shot.locationX * -20, // Ensures positive values
            locationY: shot.locationY * -20, // Ensures positive values
            isMake: shot.isMake
          }))
        this.missedShots = data.apiResponse
          .filter(shot => !shot.isMake)
          .map(shot => ({
            locationX: shot.locationX * -20, // Ensures positive values
            locationY: shot.locationY * -20, // Ensures positive values
            isMake: shot.isMake
          }))
        this.playerShotsInfo = data.apiResponse
        this.playerData.game_id = this.gameID
        this.playerData.isMake = data.apiResponse[this.dateFilter].isMake
        this.playerData.locationX = data.apiResponse[this.dateFilter].locationX
        this.playerData.locationY = data.apiResponse[this.dateFilter].locationY
        this.loading = false
      })
  }

  ngOnDestroy () {
    this.fetchApiResponse(this.playerID)
    this.shotsApiResponse(this.playerID)
  }

  adjustDate (selectedDate: string): void {
    this.loading = true;
    const selectedIndex = this.playersInfo.findIndex(
      info => info.date === selectedDate
    )

    if (selectedIndex !== -1) {
      this.dateFilter = selectedIndex // Update the filter index
      this.playerData.date = this.playersInfo[selectedIndex].date // Directly update `playerData.date`
      this.gameID = selectedIndex + 1 // Sync game ID with the date index if needed

      this.route.params.subscribe(params => {
        const playerId = +params['id']
        this.fetchApiResponse(playerId)
        this.shotsApiResponse(playerId)
      })
    }
  }

  items = {
    focusItem: this.playerID
  }

  changeData (data: number): void {
    this.items.focusItem = data
    this.playerID = data
    this.fetchApiResponse(this.playerID)
    this.shotsApiResponse(this.playerID)
    this.dateFilter = 0
    this.gameID = 1
  }
}
