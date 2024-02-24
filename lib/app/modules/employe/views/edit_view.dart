// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:learn_getx/app/data/models/employe_model.dart';
// import 'package:learn_getx/app/modules/employe/controllers/employe_controller.dart';

// class EditView extends StatelessWidget {
//   final EmployeController employeController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     final Employee selectedEmployee = employeController.selectedEmployee.value;

//     TextEditingController nameController = TextEditingController(text: selectedEmployee.employeName);
//     TextEditingController roleController = TextEditingController(text: selectedEmployee.employeRole);
//     TextEditingController phoneNumberController = TextEditingController(text: selectedEmployee.employePhoneNumber);
//     TextEditingController addressController = TextEditingController(text: selectedEmployee.employeAddress);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Employe'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: roleController,
//               decoration: InputDecoration(labelText: 'Role'),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: phoneNumberController,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: addressController,
//               decoration: InputDecoration(labelText: 'Address'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 String name = nameController.text;
//                 String role = roleController.text;
//                 String phoneNumber = phoneNumberController.text;
//                 String address = addressController.text;

//                 employeController.updateEmployee(
//                   employeId: selectedEmployee.id,
//                   employeName: name,
//                   employeRole: role,
//                   employePhoneNumber: phoneNumber,
//                   employeAddress: address,
//                 );

//                 nameController.clear();
//                 roleController.clear();
//                 phoneNumberController.clear();
//                 addressController.clear();

//                 Get.back();
//               },
//               child: Text('Update Employe'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
