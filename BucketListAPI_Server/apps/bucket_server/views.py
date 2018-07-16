from django.shortcuts import render, redirect, HttpResponse
from django.http import JsonResponse
from apps.bucket_server.models import *
from django.views.decorators.csrf import csrf_exempt

def index(request):
    return HttpResponse('I am set up correctly')

def getTasks(request):
    tasks = Task.objects.all().order_by('-created_at').values()
    data={
        'tasks': list(tasks)
    }
    # return render(request, 'bucket_server/tasks.html', context)
    return JsonResponse(data)

# def addTask(request, task_name):
@csrf_exempt
def addTask(request):
    print("Recieved Connection")
    if request.method!='POST':
        return HttpResponse('You are not posting!')
    # Task.objects.create(name=task_name)
    print("Post recieved")
    Task.objects.create(name=request.POST['objective'])
    return HttpResponse("Task successfully added")

@csrf_exempt
def editTask(request):
    print("Recieved connection for edit")
    if request.method!="POST":
        return HttpResponse('You are not posting!')
    print(request.POST)
    task = Task.objects.filter(id=request.POST['id'])[0]
    task.name = request.POST['name']
    task.save()
    return HttpResponse('Task edited!')
# Create your views here.

@csrf_exempt
def deleteTask(request):
    print("Received connectionf or edit")
    if request.method!="POST":
        return HttpResponse('You are not posting!')
    print(request.POST)
    task = Task.objects.filter(id=request.POST['id'])[0]
    task.delete()
    print('Deleting object with id ', request.POST['id'])
    return HttpResponse('Task deleted!')
