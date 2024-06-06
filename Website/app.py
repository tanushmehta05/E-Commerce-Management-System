from flask import Flask, render_template, request, redirect, url_for
import pymysql.cursors

app = Flask(__name__)

# Connect to the database
conn = pymysql.connect(
    host='localhost',
    user='root',
    password='123456789',
    database='db2',
    cursorclass=pymysql.cursors.DictCursor
)

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        # Check if the email and password match in the login_dummy table
        with conn.cursor() as cursor:
            sql = "SELECT * FROM login_dummy WHERE email = %s AND password = %s"
            cursor.execute(sql, (email, password))
            user = cursor.fetchone()

        if user:
            # Login successful, redirect to success page or homepage
            return redirect(url_for('success'))
        else:
            # Login failed, redirect back to login page with a message
            return render_template('login.html', message='Invalid email or password.')

    return render_template('login.html')

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        full_name = request.form['full_name']
        email = request.form['email']
        password = request.form['password']
        address = request.form.get('address', '')
        phone_number = request.form.get('phone_number', '')
        date_of_birth = request.form.get('date_of_birth', '')

        # Insert the new user data into signup_dummy table
        with conn.cursor() as cursor:
            sql = "INSERT INTO signup_dummy (full_name, email, password, address, phone_number, date_of_birth) VALUES (%s, %s, %s, %s, %s, %s)"
            cursor.execute(sql, (full_name, email, password, address, phone_number, date_of_birth))
            conn.commit()

            # Redirect to success page or homepage after successful signup
            return redirect(url_for('success'))

    return render_template('signup.html')


@app.route('/success')
def success():
    return render_template('success.html')

@app.route('/show_tables')
def show_tables():
    with conn.cursor() as cursor:
        # Get all table names from the database
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()

        table_info = []
        for table in tables:
            table_name = table["Tables_in_db2"]
            cursor.execute(f"DESCRIBE {table_name}")
            columns = cursor.fetchall()
            column_names = ', '.join(column["Field"] for column in columns)
            table_info.append((table_name, column_names))

        return render_template('show_tables.html', tables=table_info)

@app.route('/show_data/<table_name>', methods=['GET', 'POST'])
def show_data(table_name):
    try:
        with conn.cursor() as cursor:
            cursor.execute(f"SELECT * FROM {table_name}")
            columns = [col[0] for col in cursor.description]  # Get column names
            data = cursor.fetchall()  # Fetch all rows

        return render_template('show_data.html', table_name=table_name, columns=columns, data=data)
    except Exception as e:
        # Log the exception for debugging
        print(f"Error fetching data from {table_name}: {e}")
        return render_template('error.html', error_message="Error fetching data. Please try again later.")


@app.route('/products', methods=['GET', 'POST'])
def products():
    if request.method == 'POST':
        name = request.form['name']
        price = request.form['price']
        description = request.form['description']
        category_id = request.form['category_id']
        seller_id = request.form['seller_id']
        stock_quantity = request.form['stock_quantity']
        is_featured = request.form.get('is_featured', '0')

        # Insert into Products_dummy using SQL query
        with conn.cursor() as cursor:
            sql = "INSERT INTO Products_dummy (name, price, description, category_id, seller_id, stock_quantity, is_featured) VALUES (%s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(sql, (name, price, description, category_id, seller_id, stock_quantity, is_featured))
            conn.commit()
        # Fetch updated data from Products_dummy to display on the same page
        with conn.cursor() as cursor:
            sql = "SELECT * FROM Products_dummy"
            cursor.execute(sql)
            products = cursor.fetchall()
        return render_template('products.html', products=products)
    return render_template('products.html')


@app.route('/categories', methods=['GET', 'POST'])
def categories():
    if request.method == 'POST':
        category_name = request.form['category_name']

        # Insert the new category data into Categories_dummy table
        with conn.cursor() as cursor:
            sql = "INSERT INTO Categories_dummy (category_name) VALUES (%s)"
            cursor.execute(sql, (category_name,))
            conn.commit()

            # Redirect to categories page after successful insertion
            return redirect(url_for('categories'))

    # Fetch all categories from Categories_dummy table
    with conn.cursor() as cursor:
        sql = "SELECT * FROM Categories_dummy"
        cursor.execute(sql)
        categories = cursor.fetchall()

    return render_template('categories.html', categories=categories)


@app.route('/sellers', methods=['GET', 'POST'])
def sellers():
    if request.method == 'POST':
        name = request.form['name']
        contact = request.form['contact']
        inventory_id = request.form['inventory_id']
        is_verified = request.form.get('is_verified', '0')  # Default to '0' if not provided

        # Insert into Sellers_dummy table using SQL query
        with conn.cursor() as cursor:
            sql = "INSERT INTO Sellers_dummy (name, contact, inventory_id, is_verified) VALUES (%s, %s, %s, %s)"
            cursor.execute(sql, (name, contact, inventory_id, is_verified))
            conn.commit()

    # Fetch all sellers from Sellers_dummy table
    with conn.cursor() as cursor:
        sql = "SELECT * FROM Sellers_dummy"
        cursor.execute(sql)
        sellers = cursor.fetchall()

    return render_template('sellers.html', sellers=sellers)


@app.route('/support_customer', methods=['GET', 'POST'])
def support_customer():
    if request.method == 'POST':
        customer_id = request.form['customer_id']
        ticket_date = request.form['ticket_date']
        ticket_type = request.form['ticket_type']
        issue_description = request.form['issue_description']
        resolution = request.form.get('resolution', '')  # Default empty if not provided
        status = request.form.get('status', '')
        assigned_to = request.form.get('assigned_to', '')
        priority = request.form.get('priority', '')
        due_date = request.form.get('due_date', '')

        # Insert into SupportCustomer_dummy table using SQL query
        with conn.cursor() as cursor:
            sql = "INSERT INTO SupportCustomer_dummy (customer_id, ticket_date, ticket_type, issue_description, resolution, status, assigned_to, priority, due_date) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(sql, (customer_id, ticket_date, ticket_type, issue_description, resolution, status, assigned_to, priority, due_date))
            conn.commit()

    # Fetch all support tickets from SupportCustomer_dummy table
    with conn.cursor() as cursor:
        sql = "SELECT * FROM SupportCustomer_dummy"
        cursor.execute(sql)
        support_tickets = cursor.fetchall()

    return render_template('support_customer.html', support_tickets=support_tickets)

@app.route('/review', methods=['GET', 'POST'])
def review():
    if request.method == 'POST':
        product_id = request.form['product_id']
        customer_id = request.form['customer_id']
        rating = request.form['rating']
        review_text = request.form['review_text']
        review_date = request.form['review_date']
        helpful_votes = request.form.get('helpful_votes', '0')  # Default to '0' if not provided
        is_approved = request.form.get('is_approved', '0')  # Default to '0' if not provided

        # Insert into Review_1_dummy table using SQL query
        with conn.cursor() as cursor:
            sql = "INSERT INTO Review_1_dummy (product_id, customer_id, rating, review_text, review_date, helpful_votes, is_approved) VALUES (%s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(sql, (product_id, customer_id, rating, review_text, review_date, helpful_votes, is_approved))
            conn.commit()

    # Fetch data from Review_1_dummy table
    with conn.cursor() as cursor:
        sql_select = "SELECT * FROM Review_1_dummy"
        cursor.execute(sql_select)
        reviews = cursor.fetchall()

    return render_template('review.html', reviews=reviews)

@app.route('/search_products', methods=['GET'])
def search_products():
    search_query = request.args.get('search_query', '').lower()

    # Fetch data from Products_dummy table based on search query
    with conn.cursor() as cursor:
        sql_select = "SELECT * FROM Products_dummy WHERE LOWER(name) LIKE %s"
        cursor.execute(sql_select, (f"%{search_query}%",))
        filtered_products = cursor.fetchall()

    return render_template('index.html', search_query=search_query, products=filtered_products)



if __name__ == '__main__':
    app.run(debug=True)
