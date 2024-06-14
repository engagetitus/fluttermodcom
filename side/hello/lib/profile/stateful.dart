// Importing libraries
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int fav = 0;
  bool liked = true;

  @override
  Widget build(BuildContext context) {
    //bool liked = true;

    //String name = 'Flutter Dev';
    return Scaffold(
        appBar: AppBar(
          elevation: 23.1,
          
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          title: const Text('My Profile',
              style: TextStyle(
                fontSize: 25.2,
              )),
          actions: const [
            
            Icon(Icons.settings, color: Colors.white)
          ],
        ),





        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://static.independent.co.uk/s3fs-public/thumbnails/image/2014/10/03/12/Labrinth_close_up.jpg?quality=75&width=1250&crop=3%3A2%2Csmart&auto=webp'), radius: 50.0,),
            ),
             
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('David Wamiti',
                    style: TextStyle(
                      fontSize: 30.0,
                    ), textAlign: TextAlign.center,),
            ),


            const Row(
                children: [
                  Expanded(flex: 1, child: Icon(Icons.phone)),
                  Expanded(
                    flex: 5,
                    child: Text('02839234',
                        style: TextStyle(
                          fontSize: 25.2,
                        )),
                  ),
                ],
              ),

              const Row(
                children: [
                  Expanded(flex: 1, child: Icon(Icons.my_location)),
                  Expanded(
                    flex: 5,
                    child: Text(
                        '2nd Floor,Block A, Haven Court, Waiyaki Way, Westlands',
                        style: TextStyle(
                          fontSize: 25.2,
                        )),
                  )
                ],
              ),

              Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black,
                          height: 10.0,
                          width: 30.0,
                          padding: const EdgeInsets.all(10.0),
                        ),
                        Container(
                          color: Colors.white,
                          height: 2.0,
                          width: 30.0,
                          padding: const EdgeInsets.all(10.0),
                        ),
                        Container(
                          color: Colors.red,
                          height: 10.0,
                          width: 30.0,
                          padding: const EdgeInsets.all(10.0),
                        ),
                        Container(
                          color: Colors.white,
                          height: 2.0,
                          width: 30.0,
                          padding: const EdgeInsets.all(10.0),
                        ),
                        Container(
                          color: Colors.green,
                          height: 10.0,
                          width: 30.0,
                          padding: const EdgeInsets.all(10.0),
                        )
                      ],
                    ),
                  ),
                  const Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Text('Kenya',
                        style: TextStyle(
                          fontSize: 25.2,
                        )),
                  )
                ],
              ),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        liked = !liked;
                        fav++;
                        setState(() {});
                      },
                      icon: Icon(liked
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                          liked ? 'I like Flutter!' : 'Do you like Flutter?')),
                  GestureDetector(
                    onTap: () {
                      //setState being called which rebuilds our UI
                      setState(() {
                        fav++;
                        print('Tapped ${fav} times');
                      });
                    },
                    onDoubleTap: () {
                      print('Tapped');
                    },
                    child: const Icon(Icons.favorite),
                  ),
                  IconButton(
                      onPressed: () {
                        print('Untapped ${fav} times');
                        fav--;
                      },
                      icon: const Icon(Icons.favorite))
                ],
              )
            ]));
  }
}
