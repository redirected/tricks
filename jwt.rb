require 'jwt'

payload = {"data":"payload"}

rsa_public = OpenSSL::PKey.read(File.read(File.join('/root', 'public.pem')))

token = JWT.encode payload, rsa_public.to_s, 'HS256'

puts token

decoded_token = JWT.decode token, rsa_public.to_s, true, { algorithm: 'HS256' }

# Array
# [
#   {"data"=>"payload"}, # payload
#   {"alg"=>"HS256"} # header
# ]
puts decoded_token
