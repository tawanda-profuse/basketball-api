import { ModuleWithProviders } from '@angular/core'
import { RouterModule, Routes } from '@angular/router'

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'player-summary' },
  {
    path: 'player-summary',
    loadChildren: () =>
      import('./player-summary/player-summary.module').then(
        m => m.PlayerSummaryModule
      ),
    data: { preload: true },
    title: 'Basketball API: Player Summary'
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
  { path: '**', redirectTo: 'player-summary' }
]

export const routing: ModuleWithProviders<RouterModule> = RouterModule.forRoot(
  routes,
  {}
)
