require 'em-websocket'

EventMachine::WebSocket.start(:host => 'localhost', :port => 2000) do |ws|
  ws.onopen do
    puts ws
    ws.send 'Welcome'
  end

  ws.onmessage do |msg|
    ws.send "Pong: #{msg}"
  end

  ws.onclose do
    puts "WebSocket closed"
  end
end
