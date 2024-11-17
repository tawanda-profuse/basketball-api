from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from app.views import players

urlpatterns=[
    path('api/v1/playerSummary', players.index, name='home'),
    path('api/v1/playerSummary/<int:playerID>/', players.PlayerSummary, name='player_summary'),
    path('api/v1/playerSummary/shots/<int:playerID>/', players.PlayerSummaryShots, name='player_summary_shots'),
    path('api/v1/playerSummary/shots/<int:playerID>/game/<int:gameID>', players.ShotsPerGame, name='shots_per_game'),
]
urlpatterns = format_suffix_patterns(urlpatterns)
