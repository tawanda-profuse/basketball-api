import {
  ChangeDetectorRef,
  Component,
  OnDestroy,
  OnInit,
  ViewEncapsulation
} from '@angular/core';
import * as moment from 'moment';
import {ActivatedRoute} from '@angular/router';
import {untilDestroyed, UntilDestroy} from '@ngneat/until-destroy';
import {PlayersService} from '../_services/players.service';

@UntilDestroy()
@Component({
  selector: 'player-summary-component',
  templateUrl: './player-summary.component.html',
  styleUrls: ['./player-summary.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class PlayerSummaryComponent implements OnInit, OnDestroy {

  endpoint: any;
  apiResponse: any;
  playerData: any = {
    name: String,
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
  };
  playerID: number = 1; // changing this value will update the UI

  constructor(
    protected activatedRoute: ActivatedRoute,
    protected cdr: ChangeDetectorRef,
    protected playersService: PlayersService,
  ) {

  }

  ngOnInit(): void {
      this.fetchApiResponse();
  }

  changeParams(): void {
    this.fetchApiResponse();
  }

  fetchApiResponse(): void {
      this.playersService.getPlayerSummary(this.playerID).pipe(untilDestroyed(this)).subscribe(data => {
      this.endpoint = data.endpoint;
      this.apiResponse = JSON.stringify(data.apiResponse, null, 2);
      this.playerData.name = data.apiResponse[0].player_name;
      this.playerData.date = data.apiResponse[0].date;
      this.playerData.minutes = data.apiResponse[0].minutes;
      this.playerData.points = data.apiResponse[0].points;
      this.playerData.steals = data.apiResponse[0].steals;
      this.playerData.blocks = data.apiResponse[0].blocks;
      this.playerData.turnovers = data.apiResponse[0].turnovers;
      this.playerData.fouls = data.apiResponse[0].offensiveFouls + data.apiResponse[0].defensiveFouls;
      this.playerData.freeThrowsMade = data.apiResponse[0].freeThrowsMade; 
      this.playerData.freeThrowsAttempted = data.apiResponse[0].freeThrowsAttempted;
      this.playerData.twoPointersMade = data.apiResponse[0].twoPointersMade; 
      this.playerData.twoPointersAttempted = data.apiResponse[0].twoPointersAttempted;
      this.playerData.threePointersMade = data.apiResponse[0].threePointersMade; 
      this.playerData.threePointersAttempted = data.apiResponse[0].threePointersAttempted;
    })
  }

  ngOnDestroy() {
  }

  changeData(data){
    this.playerID = data
    alert(this.playerID)
  }
}