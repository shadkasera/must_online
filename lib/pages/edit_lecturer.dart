// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:must_online/models/lecturer.dart';
// import 'package:must_online/models/school.dart';

// class EditLecturer extends StatefulWidget {
//   final Lecturer school;
//   const EditLecturer({super.key, required this.school, required Lecturer lecturer});

//   @override
//   State<EditLecturer> createState() => _EditLecturerState();
// }

// class _EditLecturerState extends State<EditLecturer> {
//   String name = '';

//   String module = '';
//   String klass = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.lecturer.name),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     name = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   hintText: widget.lecturer.name,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     module = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   hintText: widget.lecturer.module,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.blue[400],
//                 ),
//                 onPressed: () {
//                   updateLecturer(context: context, lecturer: widget.lecturer);
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future updateLecturer(
//       {required BuildContext context, required Lecturer lecturer}) async {
//     final docLecturer =
//         FirebaseFirestore.instance.collection('lecturers').doc(lecturer.id);

//     try {
//       final lecturer = Lecturer(id: docLecturer.id, name: name, module: module);
//       final json = lecturer.toJson();

//       await docLecturer.update(json);

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//             'School Updated Successfully',
//           ),
//           backgroundColor: Colors.green,
//           duration: Duration(seconds: 5),
//         ),
//       );
//       Navigator.pop(context);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error $e'),
//           backgroundColor: Colors.red,
//           duration: const Duration(seconds: 5),
//         ),
//       );
//     }
//   }
// }
