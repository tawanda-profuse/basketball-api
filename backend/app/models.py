from django.db import models

class Player(models.Model):
    # Database columns
    id = models.AutoField(primary_key=True)
    date = models.DateField()
    isStarter = models.BooleanField()
    game_id = models.IntegerField()
    player_id = models.IntegerField()
    player_name = models.CharField(max_length=255)
    minutes = models.IntegerField()
    points = models.IntegerField()
    assists = models.IntegerField()
    offensiveRebounds = models.IntegerField()
    defensiveRebounds = models.IntegerField()
    steals = models.IntegerField()
    blocks = models.IntegerField()
    turnovers = models.IntegerField()
    defensiveFouls = models.IntegerField()
    offensiveFouls = models.IntegerField()
    freeThrowsMade = models.IntegerField()
    freeThrowsAttempted = models.IntegerField()
    twoPointersMade = models.IntegerField()
    twoPointersAttempted = models.IntegerField()
    threePointersMade = models.IntegerField()
    threePointersAttempted = models.IntegerField()
    poster = models.CharField(max_length=500)

class Shots(models.Model):
    # Database columns
    id = models.AutoField(primary_key=True)
    player_id = models.IntegerField()
    game_id = models.IntegerField()
    isMake = models.BooleanField()
    locationX = models.DecimalField(max_digits=10, decimal_places=1)
    locationY = models.DecimalField(max_digits=10, decimal_places=1)
    date = models.DateField()

class AllPlayers(models.Model):
    # Database columns
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    poster = models.CharField(max_length=255)

    class Meta:
        db_table = "all_players"

class Team(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)

    class Meta:
        db_table = "teams"