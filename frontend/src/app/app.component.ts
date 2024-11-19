import { Component, ViewEncapsulation } from '@angular/core'
import { UntilDestroy } from '@ngneat/until-destroy'

@UntilDestroy()
@Component({
  selector: 'app-component',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
  encapsulation: ViewEncapsulation.None
})
export class AppComponent {}
