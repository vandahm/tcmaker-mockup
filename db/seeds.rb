# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'en-US'

def create_fake_member
  fake_email_base = ENV.fetch('FAKER_EMAIL_BASE') { 'email+XXX@example.com' }
  m = Member.new
  m.civicrm_identifier = rand(10000)
  m.given_name = Faker::Name.first_name
  m.email = fake_email_base.sub('XXX', m.civicrm_identifier)
  m.surname = Faker::Name.last_name
  m.full_name = [m.given_name, m.surname].join(' ')
  m.sms_number = ['+1', Faker::PhoneNumber.area_code, Faker::PhoneNumber.exchange_code, Faker::PhoneNumber.subscriber_number].join('')
  m.password = SecureRandom.hex(12)
  m.save!

  m
end

50.times { create_fake_member } if Member.count == 0

stephen_email = ENV.fetch('FAKER_EMAIL_BASE') { 'email+XXX@example.com' }
stephen_email = stephen_email.sub('+XXX', '')

unless Member.find_by(email: stephen_email)
  Member.create!({
    civicrm_identifier: 10001,
    given_name: 'Stephen',
    surname: 'Van Dahm',
    email: stephen_email,
    full_name: 'Stephen Van Dahm',
    sms_number: '+16125551234',
    password: SecureRandom.hex(12)
  })
end
