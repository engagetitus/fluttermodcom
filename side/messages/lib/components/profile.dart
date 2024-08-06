import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../controllers/profile.dart';
import '../models/profile.dart';

class ProfileIcon extends StatefulWidget {
  const ProfileIcon({
    super.key,
  });

  @override
  State<ProfileIcon> createState() => _ProfileIconState();
}

class _ProfileIconState extends State<ProfileIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FutureBuilder(
          future: getUserDocument(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Icon(Icons.error);
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              // user document not found
              WidgetsBinding.instance.addPostFrameCallback((_) {
                promptUserProfileCreation(context);
              });

              //prompt user to create An account
              // promptUserProfileCreation(context);
              return IconButton.filled(
                icon: const Icon(Icons.account_circle),
                onPressed: () => promptUserProfileCreation(context),
              );
            } else {
              if (snapshot.data != null) {
                var data = snapshot.data!.data() as Map<String, dynamic>;
                Profile template = Profile.fromMap(data);
                return CircleAvatar(
                  backgroundImage: NetworkImage(template.imageUrl),
                );
              }
              // we will have an actual user in db with Image
              return const CircleAvatar(
                backgroundImage: AssetImage("assets/ruto.jfif"),
              );
            }
          }),
    );
  }

  Future<void> promptUserProfileCreation(BuildContext context) async {
    String firstname = '';
    String lastName = '';

    String phone = '';
    String? imageUrl;
    PlatformFile? file;

    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Create Profile'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  // TextFields
                  TextField(
                    decoration: const InputDecoration(labelText: 'First Name'),
                    onChanged: (value) => firstname = value,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    onChanged: (value) => lastName = value,
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                    onChanged: (value) => phone = value,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        // upload files
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(type: FileType.image);
                        // handling Image
                        if (result != null) {
                          print(result.files.first.path.toString());
                          // get file to upload
                          PlatformFile file = result.files.first;
                          // file name
                          String filename = file.name;
                          String? filePath = file.path;
                          // UPLOAD TO FIRESTORE
                          UploadTask uploadTask = FirebaseStorage.instance
                              .ref('messageusers/profileimage/$filename')
                              .putFile(File(filePath!));
                          // await upload process
                          TaskSnapshot snapshot = await uploadTask;
                          // get cloud file link back
                          imageUrl = await snapshot.ref.getDownloadURL();
                        }
                      },
                      child: const Text('Upload Image'))
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .signInAnonymously()
                          .then((value) async {
                        Profile profile = Profile(
                            id: 'id',
                            fName: firstname,
                            lName: lastName,
                            phone: phone,
                            imageUrl: imageUrl ?? '',
                            verified: false,
                            createdAt: DateTime.now());
                        print('Saving Document');
                        await newProfile(profile).then((v) {
                          Navigator.pop(context);
                          initState();
                        });
                      });
                    } catch (e) {}
                  },
                  child: Text('Save')),
            ],
          );
        });
  }
}

// Authenticate

