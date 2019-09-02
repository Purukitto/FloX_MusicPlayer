import 'package:flox/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttery_audio/fluttery_audio.dart';
import 'package:flox/songs.dart';

class NameNControls extends StatelessWidget {
  const NameNControls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(text: "", children: [
            new TextSpan(
              text: demoPlaylist.songs[0].songTitle + "\n",
              style: new TextStyle(
                color: primaryPink,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                height: 1.5,
              ),
            ),
            new TextSpan(
                text: demoPlaylist.songs[0].artist,
                style: new TextStyle(
                  color: primaryPink.withOpacity(.75),
                  fontSize: 12,
                  letterSpacing: 3,
                  height: 1.5,
                ))
          ]),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 40),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Container(),
              ),
              new PrevButton(),
              new Expanded(
                child: new Container(),
              ),
              new PlayButton(),
              new Expanded(
                child: new Container(),
              ),
              new NextButton(),
              new Expanded(
                child: new Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PrevButton extends StatelessWidget {
  const PrevButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      splashColor: primaryPurple,
      highlightColor: Colors.transparent,
      icon: new Icon(
        Icons.skip_previous,
        color: primaryPink,
        size: 30,
      ),
      onPressed: () {},
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AudioComponent(
      updateMe: [
        WatchableAudioProperties.audioPlayerState,
      ],
      playerBuilder: (BuildContext context, AudioPlayer player, Widget child) {
        IconData icon = Icons.music_note;
        Color buttonColor = accentPurple;
        Function onPressed;

        if (player.state == AudioPlayerState.playing) {
          icon = Icons.pause;
          onPressed = player.pause;
          buttonColor = primaryPink;
        } else if (player.state == AudioPlayerState.paused ||
            player.state == AudioPlayerState.completed) {
          icon = Icons.play_arrow;
          onPressed = player.play;
          buttonColor = primaryPink;
        }
        return new RawMaterialButton(
          shape: new CircleBorder(),
          fillColor: buttonColor,
          highlightColor: accentPurple,
          splashColor: primaryPurple,
          elevation: 5,
          highlightElevation: 4,
          onPressed: onPressed,
          child: new Padding(
            padding: const EdgeInsets.all(8),
            child: new Icon(
              icon,
              color: primaryBlack,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      splashColor: primaryPurple,
      highlightColor: Colors.transparent,
      icon: new Icon(
        Icons.skip_next,
        color: primaryPink,
        size: 30,
      ),
      onPressed: () {},
    );
  }
}
