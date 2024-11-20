import logging

from django.http.response import JsonResponse

from app.models import Team
from app.serializers import TeamSerializer

LOGGER = logging.getLogger('django')

from django.http import HttpResponse

def allTeams(request):
    try:
        teams = Team.objects.all()
    except Team.DoesNotExist:
        return HttpResponse(status=404)
    
    if request.method == 'GET':
        serializer = TeamSerializer(teams, many=True)
        return JsonResponse(serializer.data, safe=False)