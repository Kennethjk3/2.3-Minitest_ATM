require 'csv'
class User

	attr_accessor :name, :pin, :balance, :authenticated

	def authenticate(name, pin)
		@name = name.capitalize
		@pin = pin.to_i
    CSV.foreach("users.csv", headers: true) do |row|
    	if  
    		@balance = row["Balance"].to_i
    		@authenticated = true
    		return true
    	end
    end
  end

    def update_balance
    	 CSV.open("test.csv", "w") do |csv|
			csv << ["Name", "Pin", "Balance"]
		end
	    CSV.foreach("users.csv", headers: true) do |row|
	    	CSV.open("test.csv", "a") do |csv|
	    	if row["Name"] == @name && row["Pin"].to_i == @pin
	    		row["Balance"] = @balance
	    	end
				csv << [row["Name"], row["Pin"], row["Balance"]]
			end
	    end
	    File.rename("test.csv", "users.csv")
    end
end
