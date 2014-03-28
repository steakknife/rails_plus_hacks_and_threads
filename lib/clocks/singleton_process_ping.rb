require 'clockwork'
include Clockwork
every(3.seconds, 'Ping so we dont get clobbered') do
  SingletonProcess.ping 'clockwork'
end
