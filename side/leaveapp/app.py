from flask import *
from flask_restful import Resource, Api
import pymysql
import pymysql.cursors

#Instantiate the app
app = Flask(__name__)

api = Api(app)
user = 'tituscok_flutter_dev'
password = 'F!utt3r D3v'
database = 'tituscok_flutter_modcom'
host = 'localhost'

class Users(Resource):
    def post(self):
        data = request.json
    
        jobgroup = data['jobgroup']
        fname = data['fname']
        lname = data['lname']
        contact= data['contact']

        

        connection = pymysql.connect(user=user,password=password,host=host, database=database)
        

        cursor = connection.cursor()

        sql = 'INSERT INTO user(jobgroup, fname , lname , contact) VALUES (%s,%s,%s,%s)'

        cursor.execute(sql,(jobgroup, fname , lname , contact))
        connection.commit()

        return jsonify({"message": "Successful"})
    
    
    def get(self):
        connection = pymysql.connect(user=user,password=password,host=host, database=database)
        
        cursor = connection.cursor(pymysql.cursors.DictCursor)

        sql = 'SELECT * FROM user'

        cursor.execute(sql)
        connection.commit()
        result = cursor.fetchall()
        return jsonify(result)
    
class Leaves(Resource):
    def post(self):
        data = request.json
 
        userId = data['userId']
        type = data['type']
        remarks = data['remarks']
        
        connection = pymysql.connect(user=user,password=password,host=host, database=database)

        cursor = connection.cursor()

        sql = 'INSERT INTO leaves(userId, type, remarks) VALUES (%s,%s,%s)'

        cursor.execute(sql,(userId, type, remarks))
        connection.commit()

        return jsonify({"message":"Successful"})

    def get(self):
        connection = pymysql.connect(user=user,password=password,host=host, database=database)
        cursor = connection.cursor(pymysql.cursors.DictCursor)

        sql = 'SELECT * FROM leaves'

        cursor.execute(sql)
        connection.commit()
        result = cursor.fetchall()
        return jsonify(result)
 


    
api.add_resource(Users,'/users')
api.add_resource(Leaves, '/leaves')

#app.run(debug=True)

        










