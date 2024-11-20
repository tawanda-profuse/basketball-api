import { HttpClient } from '@angular/common/http';
import {Injectable} from '@angular/core';
import {Observable} from 'rxjs';
import {map} from 'rxjs/operators';

import {BaseService} from './base.service';

@Injectable({
  providedIn: 'root'
})
export class PlayersService extends BaseService {
  constructor(protected http: HttpClient) {
    super(http);
  }

  getPlayerSummary(playerID: number): Observable<any> {
    const endpoint = `${this.baseUrl}/playerSummary/${playerID}`;

    return this.get(endpoint).pipe(map(
      (data: Object) => {
          return {
            endpoint: endpoint,
            apiResponse: data
          };
      },
      error => {
          return error;
      }
    ));
  }
  
  getPlayerShots(playerID: number, gameID): Observable<any> {
    const endpoint = `${this.baseUrl}/playerSummary/shots/${playerID}/game/${gameID}`;

    return this.get(endpoint).pipe(map(
      (data: Object) => {
          return {
            endpoint: endpoint,
            apiResponse: data
          };
      },
      error => {
          return error;
      }
    ));
  }
}