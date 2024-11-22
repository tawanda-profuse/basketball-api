import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {CreateTeamComponent} from './create-team.component';

const routes: Routes = [
    {path: '', component: CreateTeamComponent, data: {title: 'Create Team'}}
];

export const routing: ModuleWithProviders<RouterModule> = RouterModule.forChild(routes);
