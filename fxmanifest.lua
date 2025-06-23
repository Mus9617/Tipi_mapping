fx_version 'cerulean'
game 'rdr3'

author 'Zowix'
description 'Tipi drawable example'
version '1.0'

files {
    'stream/drawable.ydr',
    'stream/tipi.ytd'
}

data_file 'DRAWABLE_FILE' 'stream/drawable.ydr'
data_file 'TEXTURE_DICTIONARY' 'stream/tipi.ytd'

client_scripts {
    'spawn_drawable.lua'
}
