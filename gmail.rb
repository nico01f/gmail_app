require 'gmail'

email, pass = ARGV #Argumentos recibidos de main.rb

#Conecta con Gmail
g = Gmail.connect(email, pass)
	if g.logged_in? == 'True'
		puts "Estas conectado."
	else
		puts "No estas conectado"
	end


end

