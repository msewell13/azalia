from flask import Flask, render_template
from flask_bootstrap import Bootstrap
from forms import EmailForm, MaintenanceForm
import requests
import os



if 'SERVERTYPE' in os.environ and os.environ['SERVERTYPE'] == 'AWS Lambda':
	DEBUG = False
else:
	DEBUG = True 


app = Flask(__name__)
app.config['SECRET_KEY'] = os.urandom(32) 


@app.route('/', methods=['GET', 'POST'])
def index():
	form = EmailForm()
	if form.validate_on_submit():
		r = requests.post('https://api.airtable.com/v0/appkgAiCIYTQKx0Vx/Tenants', data = {'email': form.email.data})
		print(r.text)
	return render_template('index.html', form=form)

@app.route('/maintenance', methods=['GET', 'POST'])
def maintenance():
	form = MaintenanceForm()
	data = {
		'name': form.name.data,
		'address': form.address.data,
		'notes': form.notes.data,
		'attachments': form.attachments.data
	}
	if form.validate_on_submit():
		r = requests.post('', data=data)
	return render_template('maintenance.html', form=form)


if __name__ == '__main__':
    app.run(debug=DEBUG)