require "http/server"
require "rucksack"
require "webview"

RUCKSACK_MODE = {{ env("RUCKSACK_MODE").to_i }}
DEBUG         = {{ env("DEBUG") }}
IP            = "127.0.0.1"
PORT          = 8080
WIDTH         =  800
HEIGHT        =  600
TITLE         = "My app"
WEBROOT       = "svelte/dist"

debug = false
if DEBUG == "true"
  debug = true
end

# ----------------------
# Server
# ---------------------

# Archiving mode
p "RUCKSACK_MODE=#{RUCKSACK_MODE}"
p "DEBUG=#{DEBUG}"

spawn do
  # local server set and run:
  server = HTTP::Server.new do |context|
    path = context.request.path
    path = "/index.html" if path == "/"
    path = "./#{WEBROOT}#{path}"

    begin
      rucksack(path).read(context.response.output)
      puts "path = #{path}"
    rescue Rucksack::FileNotFound
      context.response.status = HTTP::Status.new(404)
      context.response.print "404 not found :("
    end
  end
  address = server.bind_tcp PORT.to_i
  puts "Listening on http://#{address}"
  server.listen

  # Set the local dir:
  {% for name in `find ./#{WEBROOT} -type f`.split('\n') %}
    rucksack({{name}})
  {% end %}
end

# -----------------------
# Browser
# ----------------------

# Svelte PROD mode:
# url = "http://#{IP}:#{PORT}"

# Svelte DEV mode:
url = "http://localhost:5173/"

pp "URL = #{url}"

wv = Webview.window(WIDTH,
  HEIGHT,
  Webview::SizeHints::NONE,
  TITLE,
  url,
  debug)

wv.run
wv.destroy
