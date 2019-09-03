var request = require("request");
var user_id = "pulkitssxd";
var token = "Bearer "
var req_url = "https://api.spotify.com/v1/users/{user_id}/playlists";

request({
    url: req_url,
    headers: {
        "Authorization": token
    }
}, function(err, res) {
    if (res) {
        var playlists = JSON.parse(res.body);
        var playlist_count = Math.floor((Math.random() * playlists.total) + 0);
        var playlist_id = playlists.items[playlist_count].id;
        request({
            url: "https://api.spotify.com/v1/playlists/{playlist_id}/tracks",
            headers: {
                "Authorization": token
            }
        }, function(err, res) {
            songs = JSON.parse(res.body);
            song_count = Math.floor((Math.random() * songs.total) + 0);
            //TODO: map https://youtu.be/dwxVGK7TG-0?t=492
            song_url = songs.items[song_count].external_urls;
            print(song_url)
        })
    }
})