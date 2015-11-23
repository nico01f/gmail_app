require 'gmail'
require 'colorize' 
require 'yaml'


ACCOUNT = YAML.load_file("account.yml") unless defined? ACCOUNT

#Conecta con Gmail
def conecta(email, pass)
	g = Gmail.connect(email, pass)
	if g.logged_in? ==  true
		puts "Connected!".green
	else
		puts "Doh! Not connected".red
	end
end


def info_credencial()
	puts "Usuario: #{ACCOUNT['email']}"
        password_hided = "*" * ACCOUNT['password'].length
	puts "Password: #{password_hided}"
	puts "============="
	conecta(ACCOUNT['email'], ACCOUNT['password'])
end

info_credencial()
puts "Exiting...".yellow



