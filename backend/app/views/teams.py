import logging
from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from app.models import Team
from app.serializers import TeamSerializer
import json

LOGGER = logging.getLogger('django')


def allTeams(request):
    try:
        teams = Team.objects.all()
    except Team.DoesNotExist:
        return HttpResponse(status=404)
    
    if request.method == 'GET':
        serializer = TeamSerializer(teams, many=True)
        return JsonResponse(serializer.data, safe=False)
    
@csrf_exempt
def createTeam(request):
    if request.method == 'POST':
        try:
            # Parse JSON body
            data = json.loads(request.body)

            # Serialize and validate data
            serializer = TeamSerializer(data=data)
            if serializer.is_valid():
                # Save the new item to the database
                serializer.save()
                return JsonResponse(serializer.data, status=201) # Return created object with HTTP 201
            return JsonResponse(serializer.errors, status=400) # Return validation errors
        except json.JSONDecodeError:
            return JsonResponse({"error": "Invalid JSON data"}, status=400)
        
    return HttpResponse(status=405)
