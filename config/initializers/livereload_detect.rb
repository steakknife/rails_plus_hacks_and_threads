begin
  require 'socket'
  TCPSocket.new('localhost', 35729).close
  ENV['LIVERELOAD'] = 'y'
rescue Errno::ECONNREFUSED
end if Rails.env.development?
