from flask import Flask
from flask import render_template
from flask import request
from flask import make_response
app = Flask(__name__)

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
	return

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
	# TODO: Check if email/password is a valid combination
	return

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