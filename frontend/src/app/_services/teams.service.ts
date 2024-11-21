import { HttpClient } from '@angular/common/http'
import { Injectable } from '@angular/core'
import { Observable } from 'rxjs'
import { map } from 'rxjs'
import { BaseService } from './base.service'

@Injectable({
  providedIn: 'root'
})
export class TeamsService extends BaseService {
  constructor (protected http: HttpClient) {
    super(http)
  }

  getAllTeams (): Observable<any> {
    const endpoint = `${this.baseUrl}/allTeams`

    return this.get(endpoint).pipe(
      map(
        (data: Object) => {
          return {
            endpoint: endpoint,
            apiResponse: data
          }
        },
        error => {
          return error
        }
      )
    )
  }
}
