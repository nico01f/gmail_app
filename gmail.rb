require 'gmail'
require 'colorize'
require 'yaml'
require 'date'

ACCOUNT = YAML.load_file('account.yml') unless defined? ACCOUNT

G = Gmail.connect(ACCOUNT['email'], ACCOUNT['password'])

def unread
  n = G.inbox.count(:unread)
  puts "There #{n} mails unread."
end

def connected
  if G.logged_in? == true
    puts 'Connected!'.green
  else
    puts 'Doh! Not connected'.red
  end
end


=begin
def last_email
  year = DateTime.now.strftime("%Y").to_i
  month = DateTime.now.strftime("%m").to_i
  day = DateTime.now.strftime("%d").to_i

  time_ago = now.strftime("%Y-%m-%d")
  return G.inbox.count(:before => Date.parse("#{time_ago}"))
end
=end

def info_credencial
  puts "Usuario: #{ACCOUNT['email']}"
  password_hided = '*' * ACCOUNT['password'].length
  puts "Password: #{password_hided}"
  puts '==============='

end


info_credencial()
connected()
unread()
G.logout
puts 'Exiting...'.yellow
