from django.db import models

class Task(models.Model):
    name=models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    
# Create your models here.
