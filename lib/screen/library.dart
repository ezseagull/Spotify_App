import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class  LibraryView extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<LibraryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .46,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0),
                    ])
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blueAccent,
                          child: Center(
                            child: Text("C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Text("Your Library",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 105,),
                        Icon(Icons.search,color: Colors.white70,size: 35,),
                        SizedBox(width: 20,),
                        Icon(Icons.add,color: Colors.white70,size: 35,)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: 1,color: Colors.white)
                        ),
                        child: Text("Playlist",style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: 1,color: Colors.white)
                        ),
                        child: Text("Artist",style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Transform.rotate(
                        angle: 90 * pi /180,
                        child: Icon(Icons.compare_arrows_sharp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text("Recently Played",style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                      ),),
                      SizedBox(width: 195,),
                      Icon(FontAwesomeIcons.listAlt,color: Colors.white,)
                    ],
                  ),
                  SizedBox(height: 15,),
                  tile("Liked Songs","assets/images/like.jfif","Playlist 52 Songs"),
                  tile("On Repeat","assets/images/onrepeat.jfif","Playlist for u"),
                  tile("Weekly Discover","assets/images/weekly.jfif","Weekly discover"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ListTile tile(String title,String imgurl,String subtit) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(imgurl),
      ),
      title: Text(title,style: TextStyle(color: Colors.white,fontSize: 18,),),
      subtitle: Text(subtit,style: TextStyle(color: Colors.white54,fontSize: 13,),),
    );
  }
}