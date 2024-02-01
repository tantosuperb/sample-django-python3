from django.db import models

# Create your models here.
class Member(models.Model):
  id = models.AutoField(db_column='id', primary_key=True, null=False)
  email = models.CharField(max_length=100)
  class Meta:
    db_table='members'