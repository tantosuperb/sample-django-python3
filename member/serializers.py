from rest_framework import serializers
from .models import Member

# serializer.py
class MemberSerializer(serializers.ModelSerializer):
  class Meta:
    model=Member
    fields= ['id', 'email']
    # fields='__all__'
    # ("id","email")