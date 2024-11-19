import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {HomeComponent} from './home.component';
import {routing} from 'app/home/home.routing';

@NgModule({
  declarations: [HomeComponent],
  imports: [
    CommonModule,
    routing,
  ],
  bootstrap: [HomeComponentModule],
})
export class HomeComponentModule { }