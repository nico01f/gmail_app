require 'gmail'
require 'colorize' 
require 'yaml'


ACCOUNT = YAML.load_file("account.yml") unless defined? ACCOUNT

#Conecta con Gmail
def conecta_gmail (email, pass)
	g = Gmail.connect(email, pass)
	if g.logged_in? ==  true
		puts "Connected!".green
	else
		puts "Doh! Not connected".red
	end
end


def info_credencial()
	puts "Usuario: #{ACCOUNT['email']}"
	puts "Clave:  #{ACCOUNT['password']}"
	conecta_gmail(ACCOUNT['email'], ACCOUNT['password'])
end

info_credencial()
puts "Saliendo...".yellow



