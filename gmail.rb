require 'gmail'
require 'colorize' 
require 'yaml'


CREDENCIAL = YAML.load_file("credencial.yml") unless defined? CREDENCIAL

#Conecta con Gmail
def conecta_gmail (email, pass)
	g = Gmail.connect(email, pass)
	if g.logged_in? ==  true
		puts "Conectado!".green
	else
		puts "No conectado!".red
	end
end


def info_credencial()
	puts "Usuario: #{CREDENCIAL['correo']}"
	puts "Clave:  #{CREDENCIAL['clave']}"
	conecta_gmail(CREDENCIAL['correo'], CREDENCIAL['clave'])
end

info_credencial()
puts "Saliendo...".yellow



