// imports (library)

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool liked = true;
  int fav = 0;
  String name = "Flutter Dev";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          "My profile",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 10.0,
        backgroundColor: Colors.teal,
        actions: const [
          // Takes a List of Widgets

          Icon(
            Icons.settings,
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/ruto.jfif"),
          ),

          // Name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          // phone
          const Row(
            children: [
              Expanded(flex: 1, child: Icon(Icons.phone)),
              Expanded(
                flex: 5,
                child: Text(
                  " 0102119404",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
          // address
          const Row(
            children: [
              Expanded(flex: 1, child: Icon(Icons.location_city_sharp)),
              Expanded(
                flex: 5,
                child: Text(
                  " 2ndFloor, Block A, Haven Court, Waiyaki Way, Westlands",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    height: 20,
                    width: 30,
                    // height: 30,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )),
              ),
              const Expanded(
                flex: 5,
                child: Text(
                  " Kenya",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          //TASK : Flag  then Name of Country then the flag
          // The Container WIdget
          // WIDGET of the Day : Gesture Detector
          const Spacer(),
          Row(
            children: [
              Expanded(
                  child: IconButton(
                      onPressed: () {
                        liked = !liked; // wn pressed liked = false

                        setState(() {
                          // rebuilds the UI when called
                        });
                      },
                      icon: Icon(
                          liked ? Icons.favorite : Icons.favorite_border))),
              const Expanded(
                  flex: 5,
                  child: Text(
                    "I Like Flutter ", // if not liked - "Do You Like Flutter?"
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onDoubleTap: () {
                    fav++;
                    setState(() {});
                  },
                  onLongPress: () {
                    fav--;
                    setState(() {});
                  },
                  child: const Text("Rate This Application")),
              Row(
                children: [
                  Icon(fav > 1 ? Icons.star : Icons.star_border),
                  Icon(fav > 2 ? Icons.star : Icons.star_border),
                  GestureDetector(
                      onTap: () {
                        fav = 4;
                        setState(() {});
                      },
                      child: Icon(
                        fav > 3 ? Icons.star : Icons.star_border,
                        size: 20,
                      )),
                  Icon(fav > 4 ? Icons.star : Icons.star_border),
                  Icon(fav > 5 ? Icons.star : Icons.star_border),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
