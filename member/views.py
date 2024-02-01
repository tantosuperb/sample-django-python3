from django.shortcuts import render

from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from .serializers import MemberSerializer
from .models import Member

# Create your views here.
@api_view(['GET', 'PUT', 'DELETE'])
def member_details(request, id):
  try:
    member = Member.objects.get(id=id)
  except Member.DoesNotExist:
    return Response({'error' : {
      'code' : 404,
      'message' : "Article not found!"
    }}, status = status.HTTP_404_NOT_FOUND)

  if request.method == "GET":
    serializer = MemberSerializer(member)
    return Response(serializer.data)
  elif request.method == 'PUT':
    serializer = MemberSerializer(member, data=request.data)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
  elif request.method == 'DELETE':
    member.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['GET', 'POST'])
def member_create_read_all(request):
  if request.method == 'GET':
    query = Member.objects.all()
    serializer = MemberSerializer(query, many=True)
    return Response(serializer.data)
  if request.method == 'POST':
    serializer = MemberSerializer(data=request.data)
    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)