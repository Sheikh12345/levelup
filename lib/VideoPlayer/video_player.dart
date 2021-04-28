
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:levelup/Services/database-server/server.dart';

class VideoPlayer extends StatefulWidget {
  final String address;

  const VideoPlayer({Key key, this.address}) : super(key: key);
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:Colors.black,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.network(
              "${widget.address}",
              betterPlayerConfiguration: BetterPlayerConfiguration(
                    aspectRatio: 16 / 9,
                  autoDispose: true
              ),
            ),
          )
        ),
      ),
    );
  }
}


// AspectRatio(
// aspectRatio: 16 / 9,
// child: BetterPlayer.network(
// "${snapshot.data.data[1]}",
// betterPlayerConfiguration: BetterPlayerConfiguration(
// autoDispose: true,
// aspectRatio: 16 / 9,
// ),
// ),
// );


//
// child: FutureBuilder(
// future: Service().getDataFromServer(),
// builder: (context,snapshot){
// if(snapshot.connectionState== ConnectionState.waiting){
// return CircularProgressIndicator();
// }
// if(!snapshot.hasData){
// return CircularProgressIndicator();
// }else if(snapshot.hasData){
// return Image.network("https://pickleball-levelup.herokuapp.com/read/skill1/${snapshot.data.data[0]}");
// }
// return CircularProgressIndicator();
// },
// ),