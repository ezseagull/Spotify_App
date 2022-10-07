import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screen/songView.dart';
import '../card/album_card.dart';

class AlbumView extends StatefulWidget {
  final ImageProvider image;
  const AlbumView({Key? key, required this.image}) : super(key: key);
  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerinitalHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;

  @override
  void initState() {
    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        imageSize = initialSize - scrollController.offset;
        if (imageSize < 0) {
          imageSize = 0;
        }
        containerHeight = containerinitalHeight - scrollController.offset;
        if (containerHeight < 0) {
          containerHeight = 0;
        }
        imageOpacity = imageSize / initialSize;
        if (scrollController.offset > 224) {
          showTopBar = true;
        } else {
          showTopBar = false;
        }
        print(scrollController.offset);
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: imageOpacity.clamp(0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.5),
                          offset: Offset(0, 20),
                          blurRadius: 32,
                          spreadRadius: 16,
                        )
                      ],
                    ),
                    child: Image(
                      image: widget.image,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          SizedBox(height: initialSize + 32),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Đông tới Tây, đây là ca khúc thịnh hành",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage('assets/images/logo.png'),
                                      width: 32,
                                      height: 32,
                                    ),
                                    SizedBox(width: 8),
                                    Text("Spotify")
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "1,888,132 likes 5h 3m",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                SizedBox(height: 16),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.favorite, color: Colors.green,),
                                        SizedBox(width: 16),
                                        Icon(Icons.more_horiz),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                songAlbum(context),
                                songAlbum(context),
                                Padding(
                                    padding: const EdgeInsets.symmetric( vertical: 5.0),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage("assets/images/album8.jpg"),
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(width: 10,),
                                        Container(
                                            padding: EdgeInsets.all(5),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Waiting For You", ),
                                                Text(
                                                    textAlign: TextAlign.left,
                                                    textDirection: TextDirection.ltr,
                                                    "MONO, Onionn",
                                                    style: TextStyle(
                                                      // fontWeight: FontWeight.w200,
                                                      color: Colors.white54,
                                                    )
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(width: 160,height: 20,),
                                        Icon(Icons.more_horiz),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You might also like",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardSize,
                                label: "More DJ",
                                image: Image(
                                  image: AssetImage("assets/images/album13.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              AlbumCard(
                                size: cardSize,
                                label: "Pop",
                                image: Image(
                                  image: AssetImage("assets/images/album12.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardSize,
                                label: "Star Boy",
                                image: Image(
                                  image: AssetImage("assets/images/album10.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              AlbumCard(
                                size: cardSize,
                                label: "R&B",
                                image: Image(
                                  image: AssetImage("assets/images/album9.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // App bar
          Positioned(
              child: Container(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  color: showTopBar
                      ? Color(0xFFC61855).withOpacity(1)
                      : Color(0xFFC61855).withOpacity(0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: SafeArea(
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                size: 38,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 250),
                            opacity: showTopBar ? 1 : 0,
                            child: Text(
                              "The weekend",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom:
                            80 - containerHeight.clamp(120.0, double.infinity),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff14D860),
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 38,
                                    color: Colors.black,
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
  Widget songAlbum(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: ((context) => SongView()),
        ));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric( vertical: 5.0),
          child: Row(
            children: [
              Image(
                image: AssetImage("assets/images/album17.jpg"),
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10,),
              Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Waiting For You", ),
                      Text(
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          "MONO, Onionn",
                          style: TextStyle(
                            // fontWeight: FontWeight.w200,
                            color: Colors.white54,
                          )
                      ),
                    ],
                  )
              ),
              SizedBox(width: 160,height: 20,),
              Icon(Icons.more_horiz),
            ],
          )
      ),
    );
  }
}

