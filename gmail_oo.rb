require 'gmail'
require 'colorize'
require 'yaml'

class Check_email
	ACCOUNT = YAML.load_file('account.yml') unless defined? ACCOUNT
	G = Gmail.connect(ACCOUNT['email'], ACCOUNT['password'])

	def info
		puts "Account: #{ACCOUNT['email']}"
		password_hided = '*' * ACCOUNT['password'].length
		puts "Password: #{password_hided}"
		puts '==============='
	end

	def unread
		n = G.inbox.count(:unread)
	end

	def connected?
		if G.logged_in? == true
			puts 'Connected!'.green
		else
			puts 'Doh! Not connected'.red
		end
	end

	def logout
		G.logout
	end

end

connection = Check_email.new
connection.info
connection.connected?
puts "There\'s #{connection.unread} unread email"
connection.logout
