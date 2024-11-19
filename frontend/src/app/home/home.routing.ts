import {ModuleWithProviders} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';
import {HomeComponent} from './home.component';


const routes: Routes = [
  { path: '', component: HomeComponent, data: { title: 'Basketball API Home'} },
];

export const routing: ModuleWithProviders<RouterModule> = RouterModule.forChild(routes);