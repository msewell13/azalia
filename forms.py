from flask_wtf import FlaskForm
from wtforms import StringField, SelectField, HiddenField, PasswordField, DecimalField
from flask_wtf.file import FileField
from wtforms.validators import DataRequired, Length, EqualTo, Email
from wtforms.widgets import PasswordInput



class EmailForm(FlaskForm):
	email = StringField('Email', validators=[DataRequired()])


class MaintenanceForm(FlaskForm):
	name = StringField('Name', validators=[DataRequired()])
	address = StringField('Address', validators=[DataRequired()])
	notes = StringField('Notes', validators=[DataRequired()])
	attachments = FileField('Attachments')


class PayRent(FlaskForm):
	first_name = StringField('First Name', validators=[DataRequired()])
	last_name = StringField('Last Name', validators=[DataRequired()])

class UserForm(FlaskForm):
	email = StringField('Email', validators=[DataRequired(), Email()])
	first_name = StringField('First Name', validators=[DataRequired()])
	last_name = StringField('Last Name', validators=[DataRequired()])
	password = PasswordField('New Password', validators = [
		DataRequired(),
		Length(min=8),
		EqualTo('confirm', message='Passwords must match')
	])
	confirm = PasswordField('Repeat Password')
	stripe_token = HiddenField()
	coupon = StringField('Coupon Code')


class LoginForm(FlaskForm):
	email = StringField('Email', validators=[DataRequired()])
	password = StringField('Password', validators=[DataRequired()], widget=PasswordInput(hide_value=False))


class RecoverPasswordForm(FlaskForm):
	email = StringField('Email', validators=[DataRequired(), Email()])


class ResetPasswordForm(FlaskForm):
	password = PasswordField('New Password', validators = [
		DataRequired(),
		Length(min=8),
		EqualTo('confirm', message='Passwords must match')
	])
	confirm = PasswordField('Repeat Password')


class WalletForm(FlaskForm):
	amount = DecimalField('Amount', validators=[DataRequired()])
	stripe_token = HiddenField()



    