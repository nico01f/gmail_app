require 'gmail'
require 'colorize'
require 'yaml'

class Check_email
	ACCOUNT = YAML.load_file('account.yml') unless defined? ACCOUNT
	G = Gmail.connect(ACCOUNT['email'], ACCOUNT['password'])

	def unread
		n = G.inbox.count(:unread)
	end

	def logout
		G.logout
	end
end

connection = Check_email.new
puts "There\'s #{connection.unread} unread email"
connection.logout
