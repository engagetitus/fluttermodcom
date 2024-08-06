# import
from flask import *

# import to connect with database
import pymysql

# initialize
app = Flask(__name__)


# app secret key, for loggin out / must be unique
app.secret_key = 'Artijhen@W_EVmnsds%$_ythj*&ewr!'
#api for signup and Login
@app.route('/api/signin', methods = ['POST'])
def mobilesign():
    data = request.get_json()
    username = data['username']
    password = data['password']
    connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db') 
    cursor = connection.cursor()
    # prepare data
    signindata = (username,password)
        #  sql query
    signin_sql = 'select * from Users where username =%s and password =%s'
     # execute
    try:
      cursor.execute(signin_sql,(signindata))
          # check the credentials
      if cursor.rowcount == 0:
        return jsonify('Invalid credentials')
      else:
        session['key'] = username
        return jsonify('Successfully')
    except Exception as e:
        return jsonify({'error' : e})
@app.route('/api/signup', methods = ['POST'])
def signup():
    data = request.get_json()
    username = data['username']
    email = data['email']
    phone = data['phone']
    password1 = data['password1']
    password2 = data['password2']

        # check password
    if len(password1)< 8:
          return jsonify({'error' : 'Password must more than 8 characters'})
    elif password1 != password2 :
        return jsonify({ 'error' : 'Password do not match'})
    else:
            #   connect with database
      connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db')
              # create cursor which executes sql code
      
      cursor = connection.cursor()

            # prepare data
      userdata = (username,password2,email,phone)

            # sql query
      user_sql = 'insert into Users (username,password,email,phone) VALUES (%s,%s,%s,%s)'

      try:
        cursor.execute(user_sql,(userdata))
        # commit to save to database
        connection.commit()
        return jsonify({'success' : 'Registration successful'})
      except Exception as e:
        return jsonify({'error' : e})
@app.route('/api/create', methods=['POST'])
def mobileupload():
  data = request.get_json()
  product_name = data['product_name']
  product_desc = data['product_desc']
  product_cost = data['product_cost']
  product_category = data['product_category']
  product_image_name = data['product_image_name']
  product_image_name.save('static/images/' + product_image_name.filename)
  connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db')
  cursor = connection.cursor()
    # prepare data
  datafiles = (product_name,product_desc,product_cost,product_category,product_image_name.filename)
       # sql quer
  sql = 'insert into Products(product_name,product_desc,product_cost,product_category,product_image_name) VALUES(%s,%s,%s,%s,%s)'
  try:
      cursor.execute(sql,datafiles)
      connection.commit()
      return jsonify({'success':'product added successfully'})
  except Exception as e :
        return jsonify({'error' : e})

@app.route('/api/single_item', methods = ['POST'])
def single(product_id):
  data = request.get_json()
  product_id = data['id']
  connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db')
  cursor = connection.cursor()      
  product_sql = 'select * from Products where product_id = %s'  
  try:      
    cursor.execute(product_sql,(product_id))
    product = cursor.fetchone()
    return jsonify(product)
  except Exception as e:
    return jsonify({'error':e})

@app.route('/api/products', methods = ['GET'])
def getProducts():
    connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db')  
    cursor = connection.cursor()
    smartphone_sql = "select * from Products"
    try:
      cursor.execute(smartphone_sql)
      smartphones = cursor.fetchall()
      return jsonify(smartphones)
    except Exception as e :
        return jsonify({'error':e})

@app.route('/api/mpesa', methods=['POST'])
def mpesaflutter():
     data = request.get_json()
     phone=data['phone']
     amount=data['amount']
    #  import mpesa.py module
     import mpesa
     mpesa.stk_push(phone,amount)
    #  return message to user
     return jsonify({'success' : 'Complete payment on the phone'})


    # home route
@app.route('/')
def home():
    # return render_template('home.html')
    # connect with database
    connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db')

    # smartphones category
     # create cursor which executes sql code
    cursor = connection.cursor()
    # sql query
    smartphone_sql = "select * from Products where product_category = 'Smartphones'"
    # execute the query
    cursor.execute(smartphone_sql)
    # fetch from this query
    smartphones = cursor.fetchall()


    # electronics category
    # sql query
    electronic_sql = "select * from Products where product_category = 'Electronics'"
    # execute the query
    cursor.execute(electronic_sql)
    # fetch from this query
    electronics = cursor.fetchall()


    # appliances category
     # sql query
    appliance_sql = "select * from Products where product_category = 'Appliances'"
    # execute the query
    cursor.execute(appliance_sql)
    # fetch from this query
    appliances = cursor.fetchall()

    # beddings category
     # sql query
    bedding_sql = "select * from Products where product_category = 'Beddings'"
    # execute the query
    cursor.execute(bedding_sql)
    # fetch from this query
    beddings = cursor.fetchall()

    # clothes category
     # sql query
    cloth_sql = "select * from Products where product_category = 'Clothes'"
    # execute the query
    cursor.execute(cloth_sql)
    # fetch from this query
    clothes = cursor.fetchall()

    # others category
     # sql query
    other_sql = "select * from Products where product_category = 'Others'"
    # execute the query
    cursor.execute(other_sql)
    # fetch from this query
    others = cursor.fetchall()

    # render to front-end
    return render_template('home.html', smartphones = smartphones, electronics = electronics, 
                           appliances = appliances, beddings = beddings, clothes = clothes, others = others)

# upload route
@app.route('/upload', methods=['POST', 'GET'])
def upload():
    if request.method == 'POST':
        product_name = request.form['product_name']
        product_desc = request.form['product_desc']
        product_cost = request.form['product_cost']
        product_category = request.form['product_category']
        product_image_name = request.files['product_image_name']
        product_image_name.save('static/images/' + product_image_name.filename)

        # connect with database
        connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db')

        # create cursor which executes sql code
        cursor = connection.cursor()

        # prepare data
        data = (product_name,product_desc,product_cost,product_category,product_image_name.filename)

        # sql query
        sql = 'insert into Products(product_name,product_desc,product_cost,product_category,product_image_name) VALUES(%s,%s,%s,%s,%s)'

        cursor.execute(sql,data)

        connection.commit()
        return render_template('upload.html',message='product added successfully')
    
    # else now
    else:
        return render_template('upload.html')
    
# single item route
@app.route('/single_item/<product_id>')
def single(product_id):
        # connect with database
        connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db')

        # create cursor which executes sql code
        cursor = connection.cursor()
        
        # sql query
        product_sql = 'select * from Products where product_id = %s'
        
        # execute
        cursor.execute(product_sql,(product_id))

        # fetch
        product = cursor.fetchone()

        return render_template('single.html', product = product)

# sign up route
@app.route('/signup', methods = ['POST', 'GET'])
def signup():
    if request.method == 'POST':
         username = request.form['username']
         email = request.form['email']
         phone = request.form['phone']
         password1 = request.form['password1']
         password2 = request.form['password2']

        # check password
         if len(password1)< 8:
              return render_template('signup.html', error = 'Password must more than 8 characters')
         elif password1 != password2 :
              return render_template('signup.html', error = 'Password do not match')
         else:
            #   connect with database
            connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db')
              # create cursor which executes sql code
            cursor = connection.cursor()

            # prepare data
            userdata = (username,password2,email,phone)

            # sql query
            user_sql = 'insert into Users (username,password,email,phone) VALUES (%s,%s,%s,%s)'

            # execute query
            cursor.execute(user_sql,(userdata))

            # commit to save to database
            connection.commit()

            # send sms to user
            import sms 
            sms.send_sms(phone, 'Thank you for Registering')

            # return feedback to the user
            return render_template('signup.html', success = 'Registration successful')
    else:
         return render_template('signup.html')
    
# sign in / login
@app.route('/signin', methods = ['POST', 'GET'])
def signin():
    if request.method == 'POST':
          username = request.form['username']
          password = request.form['password']

        # connect to database
          connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db') 
        # create cursor which executes sql code
          cursor = connection.cursor()

        # prepare data
          signindata = (username,password)
        #  sql query
          signin_sql = 'select * from Users where username =%s and password =%s'
     # execute
          cursor.execute(signin_sql,(signindata))

        # check the credentials
          if cursor.rowcount == 0:
           return render_template('signin.html', error = 'Invalid credentials')
     
          else:
       #   successful login
        # link the session key with the username
            session['key'] = username
            return redirect('/')
    else:
        return render_template('/signin.html')

# sign out
@app.route('/logout')  
def logout():
    session.clear()
    return redirect('/signin')

# payment
@app.route('/mpesa', methods=['POST'])
def mpesa():
     phone=request.form['phone']
     amount=request.form['amount']
    #  import mpesa.py module
     import mpesa
     mpesa.stk_push(phone,amount)
    #  return message to user
     return'<h3>Complete payment on the phone</h3>'/'<a href="/">Back to Products</a>'


# vendors
# sign up route
@app.route('/vendors', methods = ['POST', 'GET'])
def v_signup():
    if request.method == 'POST':
         firstname = request.form['firstname']
         lastname = request.form['lastname']
         email = request.form['email']
         county = request.form['county']
         password1 = request.form['password1']
         password2 = request.form['password2']

        # check password
         if len(password1)< 8:
              return render_template('vendors.html', error = 'Password must more than 8 characters')
         elif password1 != password2 :
              return render_template('vendors.html', error = 'Password do not match')
         else:
            #   connect with database
            connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db')
              # create cursor which executes sql code
            cursor = connection.cursor()

            # prepare data
            userdata = (firstname,lastname,county,password2,email)

            # sql query
            user_sql = 'insert into Vendors (firstname,lastname,county,password,email) VALUES (%s,%s,%s,%s,%s)'

            # execute query
            cursor.execute(user_sql,(userdata))

            # commit to save to database
            connection.commit()

            # # send sms to user
            # import sms 
            # sms.send_sms(email, 'Thank you for Registering')

            # return feedback to the user
            return render_template('vendors.html', success = 'Registration successful')
    else:
         return render_template('vendors.html')
    
# # vendors Sign In
# # sign in / login
@app.route('/v_signin', methods = ['POST', 'GET'])
def vsignin():
    if request.method == 'POST':
          firstname = request.form['firstname']
          lastname = request.form['lastname']
          password = request.form['password']

        # connect to database
          connection = pymysql.connect(host='localhost',user='tituscok_tituscok',password='Dp3^_gwZDWaU',database='tituscok_soko_db') 
        # create cursor which executes sql code
          cursor = connection.cursor()

        # prepare data
          vendorsdata = (firstname,lastname,password)
        #  sql query
          vendors_sql = 'select * from Vendors where firstname =%s, lastname =%s and password =%s'
     # execute
          cursor.execute(vendors_sql,(vendorsdata))

        # check the credentials
          if cursor.rowcount == 0:
           return render_template('v_signin.html', error = 'Invalid credentials')
     
          else:
       #   successful login
        # link the session key with the firstname
            session['key'] = firstname
            return redirect('/')
    else:
        return render_template('/v_signin.html')


if __name__ == '__main__':
    app.run(debug=True)