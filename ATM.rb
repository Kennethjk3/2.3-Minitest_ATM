

class ATM

	def initialize()
		@user = User.new
		@user_available_funds = nil
		@user_available_funds.to_i
		@atm_available_funds = 1000000
		@name = ''
	end


		# Loop used to prompt the user to input data.
		# @output - The message to output to the user
		# @err - The error message to display
		# prompt("output", "err")
	def prompt(output, err, options = nil)
		@return = ""
		if options.nil?
			while @return.empty?
				puts output
				print ">> "
				@return = gets.chomp
				if @return.empty?
					puts err
				end
			end
		else
			@selected_option = nil
			until (1..options.length).include?(@selected_option)
				puts output
				puts options
				print ">> "
				@selected_option = gets.chomp.to_i
			end
			return true
		end
		return @return
	end

		# my menu
	def menu()
		if prompt("Please select an option\n\n", "Errored on stuff", ['1: Check Balance', '2: Withdraw funds', '3: Deposit funds', '4: Cancel']) == true
			self.options
		end
	end

	# Askes the user to login and verifies their un and pin against the user class

	def login()
			# set's the user object's name and pin to be tested against
		until @user.authenticate(@name, @pin)
					# gets the user's name
				@name = self.prompt(
					"Please Enter Your Name\n", 
					"Error, #{@name} is nothing. At least guess a name. Geez.\n\n"
				)
					# gets the user's pin and converts to an int
				@pin = self.prompt(
					"Please Enter Your Pin\n", 
					"Error, no pin entered\n\n"
				).to_i

					# opens my little surprise gif if the user and pin are not authenticated
			if !@user.authenticate(@name, @pin)
				puts `open http://replygif.net/i/981.gif 2> /dev/null`
				puts `google-chrome http://replygif.net/i/981.gif 2> /dev/null`
			end
		end
		@user_available_funds = @user.balance
		self.menu
	end
 
	def options()
		case @selected_option
		  when 1 
		    puts "Your Balance Is #{@user_available_funds}\n\n"
		  when 2
		    puts "How Much Do You Want?"
		    print ">> "
		    @requested_amount = gets.chomp.to_i
		    if @requested_amount >= @atm_available_funds
		      puts "Sorry this ATM does not have that much money"
		    elsif @requested_amount >= @user_available_funds
		      puts "Sorry you are not THAT rich"
		    else
		      if @requested_amount > 0
		      	@user_available_funds -= @requested_amount
		      	puts "Please Take Your Money\n\n"
		      	puts "New Balance: #{@user_available_funds}\n\n"
		      	@user.balance = @user_available_funds
		      	@user.update_balance
		      else
		      	puts "ERROR, the amount must be greater than 0.\n\n"
		      end
		 	end
		  when 3
		    puts "How much are you adding?"
		    print ">> "
		    @requested_amount = gets.chomp.to_i
		    if @requested_amount > 0
		    	@user_available_funds += @requested_amount
		      	puts "New Balance: #{@user_available_funds}\n\n"
		      	@user.balance = @user_available_funds
		      	@user.update_balance
		    else
		    	puts "ERROR, the amount must be greater than 0.\n\n"
		    end
		  when 4
		    puts "Thank You, Come Again!"
		    exit
		end
		self.menu
	end
end
