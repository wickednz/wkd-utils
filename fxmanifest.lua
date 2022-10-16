fx_version "cerulean"
game "gta5"

author "WKD"
url ""
description "WKD-Utils"
version "1.0.0"

shared_scripts {
	"config.lua",
	"shared/functions.lua"
}

client_scripts {
	"client/main.lua",
    "client/functions.lua"
}

server_scripts {
	"server/main.lua",
	"server/functions.lua",
}

lua54 "yes"
