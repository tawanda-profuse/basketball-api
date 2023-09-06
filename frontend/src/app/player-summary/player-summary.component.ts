import {
  ChangeDetectorRef,
  Component,
  OnDestroy,
  OnInit,
  ViewEncapsulation
} from '@angular/core'
import * as moment from 'moment'
import { ActivatedRoute } from '@angular/router'
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
    name: String,
    poster: String,
    date: Date,
    minutes: Number,
    points: Number,
    assists: Number,
    rebounds: Number,
    steals: Number,
    blocks: Number,
    turnovers: Number,
    offensiveFouls: Number,
    defensiveFouls: Number,
    fouls: Number,
    freeThrowsMade: Number,
    freeThrowsAttempted: Number,
    twoThrowsMade: Number,
    twoThrowsAttempted: Number,
    threeThrowsMade: Number,
    threeThrowsAttempted: Number
  }
  playerID: number = 1 // changing this value will update the UI
  gameID: number = 1 // changing this value will update the UI
  dateFilter = 0 // changing this value will filter the API results based on the date
  public playersInfo
  public playerShotsInfo

  constructor (
    protected activatedRoute: ActivatedRoute,
    protected cdr: ChangeDetectorRef,
    protected playersService: PlayersService
  ) {}

  ngOnInit (): void {
    this.fetchApiResponse()
    this.shotsApiResponse()
  }
  
  changeParams (): void {
    this.fetchApiResponse()
    this.shotsApiResponse()
  }

  fetchApiResponse (): void {
    this.playersService
      .getPlayerSummary(this.playerID)
      .pipe(untilDestroyed(this))
      .subscribe(data => {
        this.endpoint = data.endpoint
        this.apiResponse = JSON.stringify(data.apiResponse, null, 2)
        this.playersInfo = data.apiResponse
        this.playerData.poster = data.apiResponse[this.dateFilter].poster
        this.playerData.name = data.apiResponse[this.dateFilter].player_name
        this.playerData.date = data.apiResponse[this.dateFilter].date
        this.playerData.minutes = data.apiResponse[this.dateFilter].minutes
        this.playerData.points = data.apiResponse[this.dateFilter].points
        this.playerData.steals = data.apiResponse[this.dateFilter].steals
        this.playerData.blocks = data.apiResponse[this.dateFilter].blocks
        this.playerData.turnovers = data.apiResponse[this.dateFilter].turnovers
        this.playerData.fouls =
          data.apiResponse[this.dateFilter].offensiveFouls +
          data.apiResponse[this.dateFilter].defensiveFouls
        this.playerData.freeThrowsMade =
          data.apiResponse[this.dateFilter].freeThrowsMade
        this.playerData.freeThrowsAttempted =
          data.apiResponse[this.dateFilter].freeThrowsAttempted
        this.playerData.twoPointersMade =
          data.apiResponse[this.dateFilter].twoPointersMade
        this.playerData.twoPointersAttempted =
          data.apiResponse[this.dateFilter].twoPointersAttempted
        this.playerData.threePointersMade =
          data.apiResponse[this.dateFilter].threePointersMade
        this.playerData.threePointersAttempted =
          data.apiResponse[this.dateFilter].threePointersAttempted
      })
  }

  shotsApiResponse (): void {
    this.playersService
      .getPlayerShots(this.playerID, this.gameID)
      .pipe(untilDestroyed(this))
      .subscribe(data => {
        this.endpoint2 = data.endpoint
        this.apiResponse2 = JSON.stringify(data.apiResponse, null, 2)
        this.playerShotsInfo = data.apiResponse
        console.log(this.playerShotsInfo)
      })
  }
  
  ngOnDestroy () {
    this.fetchApiResponse()
    this.shotsApiResponse()
  }

  adjustDate (data: number): void {
    this.dateFilter = 0;
    this.gameID = 1;
    this.dateFilter = data - 1;
    this.gameID = data;
    this.fetchApiResponse();
    this.shotsApiResponse();
  }

  items = {
    focusItem: 0
  }

  changeData (data: number): void {
    this.items.focusItem = data;
    this.playerID = data;
    this.fetchApiResponse();
    this.shotsApiResponse();
    this.dateFilter = 0;
    this.gameID = 1;
  }
}
