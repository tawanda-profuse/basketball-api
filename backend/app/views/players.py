# # -*- coding: utf-8 -*-
import logging
from app.models import Player, AllPlayers, Shots
from app.serializers import PlayerSerializer, ShotsSerializer, AllPlayersSerializer
from django.views.decorators.csrf import csrf_exempt
import json
LOGGER = logging.getLogger('django')
from django.http import JsonResponse, HttpResponse

def index():
    # Testing HTTP Response
    return HttpResponse('<h1>Django Include URLs</h1><h1>Quick Jordan jumped over the lazy Monstar.</h1>')

def allPlayers(request):
    try:
        players = AllPlayers.objects.all()
    except AllPlayers.DoesNotExist:
        return HttpResponse(status=404)
    
    if request.method == 'GET':
        serializer = AllPlayersSerializer(players, many=True)
        return JsonResponse(serializer.data, safe=False)

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

@csrf_exempt  
def createPlayer(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)

            serializer = AllPlayersSerializer(data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse(serializer.data, status=201)
            return JsonResponse(serializer.errors, status=400)
        except json.JSONDecodeError:
            return JsonResponse({"error": "Invalid JSON data"}, status=400)
        
    return HttpResponse(status=405)


 