require "http/server"
require "rucksack"
require "webview"

RUCKSACK_MODE = {{ env("RUCKSACK_MODE").to_i }}
IP            = "127.0.0.1"
PORT          = 8080
WIDTH         =  800
HEIGHT        =  600
TITLE         = "My app"

# ----------------------
# Server
# ---------------------

# Archiving mode
p "RUCKSACK_MODE =  #{RUCKSACK_MODE}"

spawn do
  # local server set and run:
  server = HTTP::Server.new do |context|
    path = context.request.path
    path = "/index.html" if path == "/"
    path = "./webroot#{path}"

    begin
      rucksack(path).read(context.response.output)
    rescue Rucksack::FileNotFound
      context.response.status = HTTP::Status.new(404)
      context.response.print "404 not found :("
    end
  end
  address = server.bind_tcp PORT.to_i
  puts "Listening on http://#{address}"
  server.listen

  # Set the local dir:
  {% for name in `find ./webroot -type f`.split('\n') %}
    rucksack({{name}})
  {% end %}
end

# -----------------------
# Browser
# ----------------------

url = "http://#{IP}:#{PORT}"

pp "URL = #{url}"

wv = Webview.window(WIDTH,
  HEIGHT,
  Webview::SizeHints::NONE,
  TITLE,
  url)
wv.run
wv.destroy
