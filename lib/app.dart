import 'package:flox/colors.dart';
import 'package:flox/components/NameNControls.dart';
import 'package:flox/songs.dart';
import 'package:flutter/material.dart';
import 'package:flox/components/RadialSeekBar.dart';
import 'package:fluttery_audio/fluttery_audio.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Audio(
      audioUrl: demoPlaylist.songs[0].audioUrl,
      playbackState: PlaybackState.paused,
      child: new Scaffold(
        backgroundColor: primaryBlack,
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios),
            color: primaryPink,
            onPressed: () {},
          ),
          title: new Text(""),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.menu),
              color: primaryPink,
              onPressed: () {},
            ),
          ],
        ),
        body: new Column(
          children: <Widget>[
            Container(
              height: 75,
            ),
            //Seek Bar
            Container(
              height: 230,
              width: 230,
              child: AudioComponent(
                updateMe: [
                  WatchableAudioProperties.audioPlayhead,
                  WatchableAudioProperties.audioSeeking,
                ],
                playerBuilder:
                    (BuildContext context, AudioPlayer player, Widget child) {
                  double playbackProgress = 0;
                  if (player.audioLength != null && player.position != null) {
                    playbackProgress = player.position.inMilliseconds /
                        player.audioLength.inMilliseconds;
                  }
                  return new RaidalDragBar(
                    seekPercent: playbackProgress,
                  );
                },
              ),
            ),
            Container(
              height: 70,
            ),

            // Song info
            new NameNControls(),

            //Visualiser
            new Container(
              width: double.infinity,
              height: 175,
            ),
          ],
        ),
      ),
    );
  }
}
