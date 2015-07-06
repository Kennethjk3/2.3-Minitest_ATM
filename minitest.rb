require 'minitest/autorun'
require '.'
require './User.rb'

class TestAtm < MiniTest::Unit::TestCase
  def setup
    @user= User.new
    @atm= ATM.new
  end

  def self.input
    gets.chomp
  end

  def test_auth
    assert_equal true, @user.authenticate('Ken', 4567)
  end

  def test_not_auth
    assert_equal true, @user.authenticate('Ken', 7487)
  end


  def test_atm_prompt
    user = "stan"
    @atm.stub(:prompt, user) do
     assert_equal user, @atm.prompt("What's your name", "Error")
  end




# def test_sel1
#   test when 1 is selected = outputs "when....#{user_funds}"
# end

#   # def test_menu
#   #   assert_equal @atm.options(1, "Your Balance Is #{@user_available_fund}")
#   # end


# def test_display_err_msg
#    out, _ = capture_io do
#      @prog.display_error
#    end
#    assert_match "Something has gone horribly wrong. This machine", out
# end

# # stub an instance varible

# @atm = Atm.new

# # # Test method.
# # def test(selected_option)
# #     # Return a case.
# #     return case @selected_option
# #   when 1 then " "
# #   when 2 then " "
# #   when 3 then " "
# #   else "Invalid"
# #     end
# # end
end
end
