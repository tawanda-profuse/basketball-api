import {
  ChangeDetectorRef,
  Component,
  OnDestroy,
  OnInit,
  ViewEncapsulation
} from '@angular/core'
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
    threeThrowsAttempted: Number,
    game_id: Number,
    isMake: Boolean,
    locationX: Float64Array,
    locationY: Float64Array
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

  getUniqueDates(data: any[]): any[] {
    const uniqueDates = new Set();
    return data.filter(item => {
      if (!uniqueDates.has(item.date)) {
        uniqueDates.add(item.date);
        return true;
      }
      return false;
    });
  }  

  fetchApiResponse(): void {
    this.playersService
      .getPlayerSummary(this.playerID)
      .pipe(untilDestroyed(this))
      .subscribe(data => {
        this.endpoint = data.endpoint;
        this.apiResponse = JSON.stringify(data.apiResponse, null, 2);
        this.playersInfo = this.getUniqueDates(data.apiResponse); // Filter duplicates
        
        // Ensure `dateFilter` is within bounds
        if (this.dateFilter >= this.playersInfo.length) {
          this.dateFilter = 0;
        }
        
        // Use dateFilter to set playerData values
        const selectedData = data.apiResponse[this.dateFilter];
        this.playerData.poster = selectedData.poster;
        this.playerData.name = selectedData.player_name;
        this.playerData.date = selectedData.date; // Ensure this matches `playersInfo`
        this.playerData.minutes = selectedData.minutes;
        this.playerData.assists = selectedData.assists;
        this.playerData.rebounds =
          selectedData.offensiveRebounds + selectedData.defensiveRebounds;
        this.playerData.points = selectedData.points;
        this.playerData.steals = selectedData.steals;
        this.playerData.blocks = selectedData.blocks;
        this.playerData.turnovers = selectedData.turnovers;
        this.playerData.fouls =
          selectedData.offensiveFouls + selectedData.defensiveFouls;
        this.playerData.freeThrowsMade = selectedData.freeThrowsMade;
        this.playerData.freeThrowsAttempted = selectedData.freeThrowsAttempted;
        this.playerData.twoPointersMade = selectedData.twoPointersMade;
        this.playerData.twoPointersAttempted = selectedData.twoPointersAttempted;
        this.playerData.threePointersMade = selectedData.threePointersMade;
        this.playerData.threePointersAttempted = selectedData.threePointersAttempted;
  
        // Trigger change detection manually if needed
        this.cdr.detectChanges();
      });
  }
   

  shotsApiResponse (): void {
    this.playersService
      .getPlayerShots(this.playerID, this.gameID)
      .pipe(untilDestroyed(this))
      .subscribe(data => {
        this.endpoint2 = data.endpoint
        this.apiResponse2 = JSON.stringify(data.apiResponse, null, 2)
        this.playerShotsInfo = data.apiResponse
        this.playerData.game_id = this.gameID
        this.playerData.isMake = data.apiResponse[this.dateFilter].isMake
        this.playerData.locationX = data.apiResponse[this.dateFilter].locationX
        this.playerData.locationY = data.apiResponse[this.dateFilter].locationY
      })
  }

  ngOnDestroy () {
    this.fetchApiResponse()
    this.shotsApiResponse()
  }

  adjustDate(selectedDate: string): void {
    const selectedIndex = this.playersInfo.findIndex(info => info.date === selectedDate);
  
    if (selectedIndex !== -1) {
      this.dateFilter = selectedIndex; // Update the filter index
      this.playerData.date = this.playersInfo[selectedIndex].date; // Directly update `playerData.date`
      this.gameID = selectedIndex + 1; // Sync game ID with the date index if needed
  
      this.fetchApiResponse(); // Refresh data
      this.shotsApiResponse(); // Refresh related shots data
    }
  }  

  items = {
    focusItem: 0
  }

  changeData (data: number): void {
    this.items.focusItem = data
    this.playerID = data
    this.fetchApiResponse()
    this.shotsApiResponse()
    this.dateFilter = 0
    this.gameID = 1
  }
}
