import { ModuleWithProviders } from '@angular/core'
import { RouterModule, Routes } from '@angular/router'

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: '' },
  {
    path: '',
    loadChildren: () =>
      import('./home/home.module').then(
        m => m.HomeComponentModule
      ),
    data: { preload: true },
    title: 'Basketball API: Home'
  },
  {
    path: 'player-summary/:id',
    loadChildren: () =>
      import('./player-summary/player-summary.module').then(
        m => m.PlayerSummaryModule
      ),
    data: { preload: true },
    title: 'Basketball API: Player Summary'
  },
  {
    path: 'teams',
    loadChildren: () =>
      import('./all-teams/all-teams.module').then(
        m => m.AllTeamsModule
      ),
    data: { preload: true },
    title: 'Basketball API: All Teams'
  },
  {
    path: 'players',
    loadChildren: () =>
      import('./all-players/all-players.module').then(
        m => m.AllPlayersModule
      ),
    data: { preload: true },
    title: 'Basketball API: All Players'
  },
  {
    path: 'player-summary-api',
    loadChildren: () =>
      import('./player-summary-response/player-summary-response.module').then(
        m => m.PlayerSummaryResponseModule
      ),
    data: { preload: true },
    title: 'Basketball API: Player Summary API'
  },
  { path: '**', redirectTo: '' }
]

export const routing: ModuleWithProviders<RouterModule> = RouterModule.forRoot(
  routes,
  {}
)
