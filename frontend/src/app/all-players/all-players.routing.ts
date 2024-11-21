import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {AllPlayersComponent} from './all-players.component';

const routes: Routes = [
    {path: '', component: AllPlayersComponent, data: {title: 'All Players'}}
];

export const routing: ModuleWithProviders<RouterModule> = RouterModule.forChild(routes);
