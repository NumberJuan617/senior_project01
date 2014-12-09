require 'test_helper'

class UserTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end

	def setup
		@user = User.new(fname: "Juan", lname:"Andujar", age:23, email: "user@example.com",
			 			 password: "foobar", password_confirmation: "foobar")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "fname should be present" do
		@user.fname = "     "
		assert_not @user.valid?
	end

	test "lname should be present" do
		@user.lname = "     "
		assert_not @user.valid?
	end

	test "age should be present" do
		@user.age = "     "
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = "     "
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "a" * 256
		assert_not @user.valid?
  	end

	test "email validation should reject invalid addresses" do
	    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
	                           foo@bar_baz.com foo@bar+baz.com]
	    invalid_addresses.each do |invalid_address|
	      @user.email = invalid_address
	      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    	end
  	end

	test "email addresses should be unique" do
		duplicate_user = @user.dup
	    duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end

end
