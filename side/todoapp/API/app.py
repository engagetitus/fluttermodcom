from flask import jsonify,request,Flask
import pymysql
import pymysql.cursors
from flask_restful import Resource, Api

#Instantiate the flask application
app = Flask(__name__)

#Instantiate the flask application
api = Api(app)

#Create get_connection()
def get_connection():
    connection = pymysql.connect(host='localhost',database='ToDoApp', password='', user='root')
    return connection



 
