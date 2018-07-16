from django.conf.urls import url
from . import views

urlpatterns=[
    url(r'^$', views.index),
    url(r'^getTasks/$', views.getTasks),
    # url(r'^addTask/(?P<task_name>.*)/$', views.addTask),
    url(r'^addTask/$', views.addTask),
    url(r'^editTask/$', views.editTask)
]