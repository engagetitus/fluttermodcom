// Importing libraries
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    //bool liked = true;
    int fav = 0;
    //String name = 'Flutter Dev';
    return Scaffold(
        appBar: AppBar(
          elevation: 23.1,
          backgroundColor: Colors.blue,
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          title: const Text('My Profile',
              style: TextStyle(
                fontSize: 25.2,
              )),
          actions: const [
            Text(
              'Log out',
              style: TextStyle(
                fontSize: 25.2,
              ),
            ),
            Icon(Icons.settings, color: Colors.white)
          ],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //         //Name
              //         const Text('Name: David Kamau',style:
              // TextStyle(fontSize: 25.2,)),
              //         //Phone Number
              //         const Text('Phone Number : 010290202',style:
              // TextStyle(fontSize: 25.2,)),
              //         //Address
              //          const Text("Address: 2nd Floor, Block A, Haven Court, Waiyaki Way, Westlands",style:
              // TextStyle(fontSize: 25.2,)),

              const Row(
                children: [
                  Expanded(flex: 1, child: Icon(Icons.perm_identity)),
                  Expanded(
                    flex: 5,
                    child: Text('David Kamau',
                        style: TextStyle(
                          fontSize: 25.2,
                        )),
                  ),
                ],
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
                  const Expanded(
                      flex: 1, child: Icon(Icons.favorite_border_outlined)),
                   Expanded(flex: 3, child: Text('I like Flutter $fav times')),
                  GestureDetector(
                    onTap: () {
                      print('Tapped ${fav} times');
                      fav++;
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
