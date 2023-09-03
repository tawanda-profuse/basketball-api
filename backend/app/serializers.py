from rest_framework import serializers
from app.models import Player, Shots

class PlayerSerializer(serializers.ModelSerializer):

    id = serializers.IntegerField()
    date = serializers.DateField(format='%Y.%m.%d', required=True)
    isStarter = serializers.BooleanField()
    game_id = serializers.IntegerField()
    player_id = serializers.IntegerField()
    player_name = serializers.CharField()
    minutes = serializers.IntegerField()
    points = serializers.IntegerField()
    assists = serializers.IntegerField()
    offensiveRebounds = serializers.IntegerField()
    defensiveRebounds = serializers.IntegerField()
    steals = serializers.IntegerField()
    blocks = serializers.IntegerField()
    turnovers = serializers.IntegerField()
    defensiveFouls = serializers.IntegerField()
    offensiveFouls = serializers.IntegerField()
    freeThrowsMade = serializers.IntegerField()
    freeThrowsAttempted = serializers.IntegerField()
    twoPointersMade = serializers.IntegerField()
    twoPointersAttempted = serializers.IntegerField()
    threePointersMade = serializers.IntegerField()
    threePointersAttempted = serializers.IntegerField()

    class Meta:
        model=Player
        fields=('id','date','isStarter','game_id','player_id','player_name','minutes','points','assists','offensiveRebounds','defensiveRebounds','steals','blocks','turnovers','defensiveFouls','offensiveFouls','freeThrowsMade','freeThrowsAttempted','twoPointersMade','twoPointersAttempted','threePointersMade','threePointersAttempted')

class ShotsSerializer(serializers.ModelSerializer):

    id = serializers.IntegerField()
    player_id = serializers.IntegerField()
    game_id = serializers.IntegerField()
    isMake = serializers.BooleanField()
    locationX = serializers.DecimalField(max_digits=10, decimal_places=1)
    locationY = serializers.DecimalField(max_digits=10, decimal_places=1)
    date = serializers.DateField(format='%Y.%m.%d', required=True)

    class Meta:
        model=Shots
        fields=('id','player_id','game_id','isMake','locationX','locationY','date')