// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileScreen extends StatefulWidget {
//   final String userId;

//   const ProfileScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   File? _profileImage;
//   String? _existingProfileImageUrl;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserProfile();
//   }

//   Future<void> _fetchUserProfile() async {
//     try {
//       final userDoc =
//           FirebaseFirestore.instance.collection('users').doc(widget.userId);
//       final userSnapshot = await userDoc.get();

//       if (userSnapshot.exists) {
//         setState(() {
//           _nameController.text = userSnapshot.data()?['name'] ?? '';
//           _existingProfileImageUrl = userSnapshot.data()?['profileImageUrl'];
//         });
//       }
//     } catch (e) {
//       print('Error fetching user profile: $e');
//     }
//   }

//   Future<void> _pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _saveProfile() async {
//     String? profileImageUrl;
//     if (_profileImage != null) {
//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('profile_images')
//           .child(widget.userId);
//       await storageRef.putFile(_profileImage!);
//       profileImageUrl = await storageRef.getDownloadURL();
//     } else {
//       profileImageUrl = _existingProfileImageUrl;
//     }

//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .set({
//       'name': _nameController.text,
//       'profileImageUrl': profileImageUrl,
//     });

//     Navigator.of(context).pop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: _pickImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: _profileImage != null
//                     ? FileImage(_profileImage!)
//                     : _existingProfileImageUrl != null
//                         ? NetworkImage(_existingProfileImageUrl!)
//                             as ImageProvider
//                         : null,
//                 child: _profileImage == null && _existingProfileImageUrl == null
//                     ? const Icon(Icons.add_a_photo, size: 50)
//                     : null,
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(
//                 labelText: 'Name',
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveProfile,
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  const ProfileScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  File? _profileImage;
  String? _existingProfileImageUrl;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(widget.userId);
      final userSnapshot = await userDoc.get();

      if (userSnapshot.exists) {
        setState(() {
          _nameController.text = userSnapshot.data()?['name'] ?? '';
          _existingProfileImageUrl = userSnapshot.data()?['profileImageUrl'];
        });
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    String? profileImageUrl;
    if (_profileImage != null) {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(widget.userId);
      await storageRef.putFile(_profileImage!);
      profileImageUrl = await storageRef.getDownloadURL();
    } else {
      profileImageUrl = _existingProfileImageUrl;
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .set({
      'name': _nameController.text,
      'profileImageUrl': profileImageUrl,
    });

    Navigator.of(context).pop({
      'name': _nameController.text,
      'profileImageUrl': profileImageUrl,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : _existingProfileImageUrl != null
                        ? NetworkImage(_existingProfileImageUrl!)
                            as ImageProvider
                        : null,
                child: _profileImage == null && _existingProfileImageUrl == null
                    ? const Icon(Icons.add_a_photo, size: 50)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
