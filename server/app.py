from flask import Flask, render_template, request, make_response
from flaskext.mysql import MySQL
from flask_cors import CORS, cross_origin
import simplejson as json

mysql = MySQL()
app = Flask(__name__)
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'bolo'
app.config['MYSQL_DATABASE_HOST'] = 'localhost' #'54.153.65.246'
mysql.init_app(app)
CORS(app)

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
	listing_id = request.args.get('listing_id')
	cursor = mysql.get_db().cursor()
	cursor.execute("SELECT * FROM Room R, Room_Photo P WHERE R.rid = " + listing_id + " AND R.rid = P.rid")
	result = cursor.fetchone()
	return json.dumps({'rid':result[0], 'oid':result[1], 'name':result[2], 'location':result[3], 'price':result[4], 
		'capacity':result[5], 'description':result[6], 'email':result[7], 'phone_number':result[8],
		'amenities': {'wifi':result[9], 'white_board':result[10], 'telephone':result[11], 'reception':result[12],
		'ethernet':result[13], 'parking':result[14], 'refreshment':result[15], 'vending_machine':result[16],
		'projector':result[17], 'speaker':result[18], 'fax_machine':result[19]}, 'photo':result[21]})

@app.route('/signup')
def show_sign_up():
	return render_template('signup.html')

@app.route('/api/signup', methods=['POST'])
def signup():
	email = request.form['email']
	password = request.form['password']
	fullName = request.form['name'].split()
	firstName = fullName[0]
	lastName = fullName[1]
	# TODO: Create account and return UID and access token
        conn = mysql.connect()
	cursor = conn.cursor()
	executeStatement = ("INSERT INTO User(password, email, first_name," +
                           "last_name) VALUES('" + password + "', '" + email +
                           "', '" + firstName + "', '" + lastName + "')")
	cursor.execute(executeStatement)
	checkStatement = ("SELECT uid FROM User WHERE password='" + password +
                       "' AND email='" + email + "' ORDER BY uid DESC LIMIT 1")
	cursor.execute(checkStatement)
	data = cursor.fetchone()
	if data != None:
		conn.commit()
		return str(data[0])
	else:
		return 'Error'
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
		return json.dumps({'uid':data[0], 'first_name':data[3], 'last_name':data[4]})
	else:
		return ''

@app.route('/post')
def show_post():
	return render_template('post.html')

@app.route('/api/post', methods=['POST'])
def post():
	# TODO: Insert listing into database
	uid = request.form['uid']       #must be in owner
	name = request.form['name']
	location = request.form['location']
	price = request.form['price']
	capacity = request.form['capacity']
	description = request.form['description']
	email = request.form['email']
	phone_number = request.form['phone_number']
	wifi = request.form['wifi']
	white_board = request.form['white_board']
	telephone = request.form['telephone']
	reception = request.form['reception']
	ethernet = request.form['ethernet']
	parking = request.form['parking']
	refreshment = request.form['refreshment']
	vending_machine = request.form['vending_machine']
	projector = request.form['projector']
	speaker = request.form['speaker']
	fax_machine = request.form['fax_machine']
	latitude = request.form['latitude']
	longitude = request.form['longitude']
	photo_url = request.form['photo_url']
	start_datetime = request.form['start_datetime']
	end_datetime = request.form['end_datetime']
	conn = mysql.connect()
	cursor = conn.cursor()
	executeStatement = ("INSERT INTO Room(oid, name, location, " +
                           "price, capacity, description, email, " +
                           "phone_number, wifi, white_board, telephone, " +
                           "reception, ethernet, parking, refreshment, " +
                           "vending_machine, projector, speaker, fax_machine, " +
                           "latitude, longitude)" +
                           "VALUES('" + uid + "', '" + name + "', '" +
                           location + "', '" + price + "', '" + capacity +
                           "', '" + description + "', '" + email + "', '" +
                           phone_number + "', '" + wifi + "', '" + white_board +
                           "', '" + telephone + "', '" + reception + "', '" +
                           ethernet + "', '" + parking + "', '" + refreshment +
                           "', '" + vending_machine + "', '" + projector +
                           "', '" + speaker + "', '" + fax_machine + "', '" +
                           latitude + "', '" + longitude + "')")
        cursor.execute(executeStatement)
	cursor.execute("SELECT rid FROM Room ORDER BY rid DESC LIMIT 1")
	roomData = cursor.fetchone()
	if roomData != None:
		conn.commit()
	else:
		return 'Error: Unable to add room'
        executeStatementPhoto = ("INSERT INTO Room_Photo VALUES('" +
                                 str(roomData[0]) + "', '" + photo_url + "')")
        cursor.execute(executeStatementPhoto)
	cursor.execute("SELECT rid FROM Room_Photo WHERE rid =" + str(roomData[0]))
        photoData = cursor.fetchone()
	if photoData != None:
		conn.commit()
	else:
		return 'Error: Unable to add room photo'
	executeStatementAvailability = ("INSERT INTO Availability VALUES('" +
                                 str(roomData[0]) + "', '" + start_datetime +
                                 "', '" + end_datetime + "')")
        cursor.execute(executeStatementAvailability)
	cursor.execute("SELECT rid FROM Availability WHERE rid =" + str(roomData[0]))
        availabilityData = cursor.fetchone()
	if availabilityData != None:
		conn.commit()
		return str(roomData[0])      #room's id
	else:
		return 'Error: Unable to add room availability'

@app.route('/api/book', methods=['POST'])
def book():
	# Book the reservation
	userID = request.form['userID']
	roomID = request.form['roomID']
        conn = mysql.connect()
	cursor = conn.cursor()

	cursor.execute("SELECT price FROM Room WHERE rid=" + roomID)
	data = cursor.fetchone()
	price = data[0]

	cursor.execute("SELECT start_datetime, end_datetime FROM Availability WHERE rid=" + roomID)
	data = cursor.fetchone()
	start_time = data[0]
	end_time = data[1]
	try:
	    cursor.execute("INSERT INTO Booking(cid, rid, grand_total_price, subtotal_price, start_datetime, end_datetime) " + "VALUES('" + userID + "', '" + roomID + "', " + str(price) + ", 10.00, '" + str(start_time) + "', '" + str(end_time) + "')") 
	    last_row = cursor.lastrowid
	    if last_row != None:
	        conn.commit()
	        return 'Success'
	except:
		return 'Failure'
	

@app.route('/api/rate', methods=['POST'])
def rate():
        bid = request.form['bid']
	rating = request.form['rating']
	comments = request.form['comments']

	conn = mysql.connect()
	cursor = conn.cursor()

	cursor.execute("SELECT rid FROM Booking WHERE bid=" + bid)
        data = cursor.fetchone()
        rid = data[0]
        try:
                cursor.execute("INSERT INTO Room_Rating(rid, rating, comments) VALUES('" + str(rid) + "', '" + str(rating) + "', '" + comments + "')")
                last_row = cursor.lastrowid
                if last_row != None:
                        conn.commit()
                        return 'Success'
	except:
		return 'Failure'

        cursor.execute("UPDATE Room SET rating = (SELECT AVG(rating) from Room_Rating WHERE rid = " + str(rid) + ") WHERE rid = " + str(rid))
        conn.commit()
	# Update the rating of the listing in the database

@app.route('/dashboard')
def show_profile():
	return render_template('dashboard.html')

@app.route('/api/getUser')
def get_user():
	uid = request.form['uid']
	cursor = mysql.get_db().cursor()
	cursor.execute("SELECT * FROM User where uid='" + uid + "'")
	data = cursor.fetchone()
	# Return user info as JSON
	return json.dumps({"email": data[2], "first_name": data[3],
                           "last_name": data[4], "rating": data[5]})

@app.route('/api/getReservations')
def get_reservations():
	conn = mysql.connect()
	userID = request.args.get('uid')
	cursor = conn.cursor()

	cursor.execute("SELECT * FROM Booking B, Room R, Room_Photo P WHERE cid=" + userID + " AND R.rid = B.rid AND R.rid = P.rid")
	result = cursor.fetchall()
	bookingList = []
	if result:
		for row in result:
			bookingDict = {'bid':row[0], 'rid':row[2], 'grand_total_price':row[3], 'subtotal_price':row[4], 'start_datetime':str(row[5]), 'end_datetime':str(row[6]), 'name':row[9], 'location':row[10], 'photo':row[28]}
			bookingList.append(bookingDict)
			return json.dumps(bookingList)
	else:
		return ''

if __name__ == '__main__':
	app.run()
