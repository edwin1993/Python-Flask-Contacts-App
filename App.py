from flask import Flask, render_template, request, redirect, url_for, flash#importando los modulos 
from flask_mysqldb import MySQL                                            #y funciones de flask

# initializations
#inicializamos el modulo flask que guardamos en la variable app
app = Flask(__name__)

# Mysql Connection
app.config['MYSQL_HOST'] = 'localhost' 
app.config['MYSQL_USER'] = 'edwin'
app.config['MYSQL_PASSWORD'] = '12345'
app.config['MYSQL_DB'] = 'flaskcrud'
mysql = MySQL(app)
    
# settings
# configuramos la sesion en nuestro servidor
# secret_key = indicamos como va a estar protegida nuestra sesion
app.secret_key = "mysecretkey" #sirve para poder mostrar los mensajes

# routes
@app.route('/')
def Index():#funcion que ejecuta la ruta index
    cur = mysql.connection.cursor()#conexion BD
    cur.execute('SELECT * FROM contacts')#Consultamos  los datos para mostrarlos en el formulario index
    data = cur.fetchall()#obtenemos todos los datos y lo almacenamos en una variable data
    cur.close()
    return render_template('index.html', contacts = data)#contacts = data = pasamos los datos al formulario index.html para mostrarlos en el formulario

#al enviar datos del formulario index.html los enviamos a esta ruta
@app.route('/add_contact', methods=['POST'])
def add_contact():
    if request.method == 'POST':
        fullname = request.form['fullname']
        phone = request.form['phone']
        email = request.form['email']
        cur = mysql.connection.cursor()#me permite ejecutar las consultas en mysql 
        cur.execute("INSERT INTO contacts (fullname, phone, email) VALUES (%s,%s,%s)", (fullname, phone, email))
        mysql.connection.commit()#Ejecutamos la consulta 
        flash('Contact Added successfully')#Alerta 
        return redirect(url_for('Index'))#redireccionamos a la ruta principal (index)

@app.route('/edit/<id>', methods = ['POST', 'GET'])
def get_contact(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM contacts WHERE id = %s', (id))
    data = cur.fetchall()
    cur.close()
    print(data[0])
    return render_template('edit-contact.html', contact = data[0])

@app.route('/update/<id>', methods=['POST'])
def update_contact(id):
    if request.method == 'POST':
        fullname = request.form['fullname']
        phone = request.form['phone']
        email = request.form['email']
        cur = mysql.connection.cursor()
        cur.execute("""
            UPDATE contacts
            SET fullname = %s,
                email = %s,
                phone = %s
            WHERE id = %s
        """, (fullname, email, phone, id))
        flash('Contact Updated Successfully')
        mysql.connection.commit()
        return redirect(url_for('Index'))

@app.route('/delete/<string:id>', methods = ['POST','GET'])
def delete_contact(id):
    cur = mysql.connection.cursor()
    cur.execute('DELETE FROM contacts WHERE id = {0}'.format(id))
    mysql.connection.commit()
    flash('Contact Removed Successfully')
    return redirect(url_for('Index'))

# starting the app
if __name__ == "__main__": #validamos que sea el archivo .py para inicializar la app
    # DEBUG=TRUE = reiniciar automaticamente el servidor
    app.run(port=3000, debug=True)
