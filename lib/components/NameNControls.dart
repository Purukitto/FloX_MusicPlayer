import 'package:flox/colors.dart';
import 'package:flutter/material.dart';

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
              text: 'Song Title\n',
              style: new TextStyle(
                color: primaryPink,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                height: 1.5,
              ),
            ),
            new TextSpan(
                text: 'Artist Name',
                style: new TextStyle(
                  color: primaryPink.withOpacity(.75),
                  fontSize: 12,
                  letterSpacing: 3,
                  height: 1.5,
                ))
          ]),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 50),
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
    return new RawMaterialButton(
      shape: new CircleBorder(),
      fillColor: primaryPink,
      highlightColor: primaryPurple.withOpacity(.75),
      splashColor: primaryPurple,
      elevation: 8,
      highlightElevation: 4,
      onPressed: () {},
      child: new Padding(
        padding: const EdgeInsets.all(8),
        child: new Icon(
          Icons.play_arrow,
          color: primaryBlack,
          size: 30,
        ),
      ),
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
