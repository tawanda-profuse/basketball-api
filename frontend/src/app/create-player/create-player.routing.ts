import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {CreatePlayerComponent} from './create-player.component';

const routes: Routes = [
    {path: '', component: CreatePlayerComponent, data: {title: 'Create A Player'}}
];

export const routing: ModuleWithProviders<RouterModule> = RouterModule.forChild(routes);
