import { NgModule } from '@angular/core'
import { CommonModule } from '@angular/common'
import { CreatePlayerComponent } from './create-player.component'
import { routing } from './create-player.routing'
import { PlayersService } from 'app/_services/players.service'
import { FormsModule } from '@angular/forms'

@NgModule({
  declarations: [CreatePlayerComponent],
  imports: [CommonModule, routing, FormsModule],
  providers: [PlayersService],
  bootstrap: [CreatePlayerComponent]
})
export class CreatePlayerModule {}
