# This is the factory girl file that needs to be added after the factoryGirl gem 
# file is added to the gem list

FactoryGirl.define do
	factory :user do
		name 			"Houman Ka"
		email 		"houman@test.com"
		password 	"123456"
		password_confirmation "123456"
	end
end