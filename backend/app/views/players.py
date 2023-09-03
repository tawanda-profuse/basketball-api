# # -*- coding: utf-8 -*-
import logging
from functools import partial
import json
import os

from rest_framework.response import Response
from rest_framework.views import APIView, exception_handler
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse

from app.models import Player, Shots
from app.serializers import PlayerSerializer, ShotsSerializer
from django.http import Http404
from rest_framework import status
from rest_framework import generics


LOGGER = logging.getLogger('django')

from django.http import HttpResponse

def index(request):
    # Testing HTTP Response
    return HttpResponse('<h1>Django Include URLs</h1><p>The quick big brown fox jumped over the lazy dog.</p>')

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


 