import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pihost/constants.dart';
import 'package:pihost/controllers/controllers.dart';
import 'package:pihost/model/models.dart';
import 'package:pihost/pages/pi_details/pi_shell.dart';
import 'package:pihost/pages/pi_details/pi_stats.dart';

class PiDetails extends StatefulWidget {
  const PiDetails({super.key});

  @override
  State<PiDetails> createState() => _PiDetailsState();
}

class _PiDetailsState extends State<PiDetails> {
  final Device device = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final DeviceController deviceController = Get.put(DeviceController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: const Text(
          'PiHost',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              deviceController.removeDevice(device);
              Navigator.pop(context);
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: const Text(
              'Delete',
              style: TextStyle(
                color: delete,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                PiStats(),
                SizedBox(height: 20),
                PiShell()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
