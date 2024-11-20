from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from app.views import players
from app.views import teams

urlpatterns=[
    path('api/v1', players.index, name='home'),
    path('api/v1/playerSummary/<int:playerID>/', players.PlayerSummary, name='player_summary'),
    path('api/v1/playerSummary/shots/<int:playerID>/', players.PlayerSummaryShots, name='player_summary_shots'),
    path('api/v1/playerSummary/shots/<int:playerID>/game/<int:gameID>', players.ShotsPerGame, name='shots_per_game'),
    path('api/v1/allPlayers', players.allPlayers, name='players'),
    path('api/v1/allTeams', teams.allTeams, name='teams'),
    path('api/v1/createTeam', teams.createTeam, name='create_team')
]
urlpatterns = format_suffix_patterns(urlpatterns)
