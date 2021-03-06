require "pifi"

map("/") { run PiFi::StaticController }
map("/api/player") { run PiFi::PlayerController }
map("/api/streams") { run PiFi::StreamsController }
map("/api/config") { run PiFi::ConfigController }
