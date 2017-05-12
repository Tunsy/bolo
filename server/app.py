from flask import Flask
from flask import render_template
from flask import request
from flask import make_response
from flaskext.mysql import MySQL
import simplejson as json

mysql = MySQL()
app = Flask(__name__)
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'password'
app.config['MYSQL_DATABASE_DB'] = 'bolo'
app.config['MYSQL_DATABASE_HOST'] = 'localhost' #'54.153.65.246'
mysql.init_app(app)

@app.route('/')
def show_index():
	return render_template('index.html')

@app.route('/api/search')
def search():
	location = request.form['location']
	search_filters = request.form['filters']

	# TODO: Perform MySQL query and return the results

	return

@app.route('/api/getListing')
def get_listing():
	# TODO: Pull listing details from db and return the data
	listing_id = request.args.get('listing_id')
	cursor = mysql.get_db().cursor()
	cursor.execute("SELECT * FROM Room where rid = " + listing_id)
	result = cursor.fetchone()
	return json.dumps({'rid':result[0], 'oid':result[1], 'name':result[2], 'location':result[3], 'price':result[4], 
		'capacity':result[5], 'description':result[6], 'email':result[7], 'phone_number':result[8],
		'amenities': {'wifi':result[9], 'white_board':result[10], 'telephone':result[11], 'reception':result[12],
		'ethernet':result[13], 'parking':result[14], 'refreshment':result[15], 'vending_machine':result[16],
		'projector':result[17], 'speaker':result[18], 'fax_machine':result[19]}})

@app.route('/signup')
def show_sign_up():
	return render_template('signup.html')

@app.route('/api/signup', methods=['POST'])
def signup():
	email = request.form['email']
	password = request.form['password']
	# TODO: Create account and return UID and access token
	return

@app.route('/login')
def show_login():
	return render_template('login.html')

@app.route('/api/login', methods=['POST'])
def login():
	email = request.form['email']
	password = request.form['password']
	cursor = mysql.get_db().cursor()
	cursor.execute("SELECT * FROM User where email='" + email + "' and password = '" + password + "'")
	data = cursor.fetchone()
	if data != None:
		return 'Success'
	else:
		return 'Error'

@app.route('/post')
def show_post():
	return render_template('post.html')

@app.route('/api/post', methods=['POST'])
def post():
	# TODO: Insert listing into database
	return

@app.route('/api/book')
def book():
	# Book the reservation
	return

@app.route('/api/rate')
def rate():
	# Update the rating of the listing in the database
	return

@app.route('/dashboard')
def show_profile():
	return render_template('dashboard.html')

@app.route('/api/getUser')
def get_user():
	uid = request.form['uid']
	# Return user info as JSON
	return



if __name__ == '__main__':
	app.run()