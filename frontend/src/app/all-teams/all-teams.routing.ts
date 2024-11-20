import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {AllTeamsComponent} from './all-teams.component';

const routes: Routes = [
    {path: '', component: AllTeamsComponent, data: {title: 'All Teams'}}
];

export const routing: ModuleWithProviders<RouterModule> = RouterModule.forChild(routes);
