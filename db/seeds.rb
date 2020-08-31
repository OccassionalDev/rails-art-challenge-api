require 'faker'

user = User.create(username: "Critical", email: "cr@cr.com", password: "asdf", password_confirmation: "asdf")
user2 = User.create(username: "Lumens", email: "lm@lm.com", password: "asdf1", password_confirmation: "asdf1")