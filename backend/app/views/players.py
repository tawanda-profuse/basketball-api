# # -*- coding: utf-8 -*-
import logging

from django.http.response import JsonResponse

from app.models import Player, Shots
from app.serializers import PlayerSerializer, ShotsSerializer


LOGGER = logging.getLogger('django')

from django.http import HttpResponse

def index():
    # Testing HTTP Response
    return HttpResponse('<h1>Django Include URLs</h1><p>Quick Jordan jumped over the lazy Monstar.</p>')

def PlayerSummary(request, playerID):
    try:
        player = Player.objects.filter(player_id=playerID)
    except Player.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = PlayerSerializer(player, many=True)
        return JsonResponse(serializer.data, safe=False)

def PlayerSummaryShots(request, playerID):
    try:
        shots = Shots.objects.filter(player_id=playerID)
    except Shots.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = ShotsSerializer(shots, many=True)
        return JsonResponse(serializer.data, safe=False)

def ShotsPerGame(request, playerID, gameID):
    try:
        shots = Shots.objects.filter(player_id=playerID, game_id=gameID)
    except Shots.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = ShotsSerializer(shots, many=True)
        return JsonResponse(serializer.data, safe=False)


 