fx_version 'cerulean'
games { 'gta5' }

ui_page 'html/index.html'
files {'html/*.*'}

server_scripts {
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua'
}

client_scripts {'client/*.lua'}
shared_script {'@es_extended/imports.lua'}