require 'gmail'
require 'colorize'
require 'yaml'

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

def info_credencial
  puts "Usuario: #{ACCOUNT['email']}"
  password_hided = '*' * ACCOUNT['password'].length
  puts "Password: #{password_hided}"
  puts '==============='
  connected
  unread
end

info_credencial
puts 'Exiting...'.yellow
