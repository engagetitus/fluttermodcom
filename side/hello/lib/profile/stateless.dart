// imports (library)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    bool liked = true;
    int fav = 0;
    String name = "Flutter Dev";
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Icon(Icons.person)),
              Expanded(
                flex: 5,
                child: Text(
                  name,
                  style: TextStyle(fontSize: 30),
                ),
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
          Row(
            children: [
              const Expanded(
                  flex: 1, child: Icon(Icons.favorite_border_outlined)),
              Expanded(flex: 5, child: Text("I Like Flutter $fav Times")),
              GestureDetector(
                onTap: () {
                  // function - what to do
                  print("Tapped $fav times");
                  fav++;
                },
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              IconButton(
                  onPressed: () {
                    print("UnTapped X times");
                    fav--;
                  },
                  icon: Icon(Icons.favorite))
            ],
          )
        ],
      ),
    );
  }
}
