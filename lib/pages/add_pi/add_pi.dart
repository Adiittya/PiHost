import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pihost/constants.dart';
import 'package:pihost/controllers/controllers.dart';
import 'package:pihost/pages/add_pi/add_device.dart';
import 'package:pihost/pages/add_pi/list_devices.dart';
import 'package:pihost/pages/add_pi/no_devices.dart';

class AddPi extends StatelessWidget {
  AddPi({super.key});

  final SwitchController adddeviceController =
      Get.put(SwitchController());
  final DeviceController deviceController = Get.put(DeviceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: const Text(
          'PiHost',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Obx(() {
            return deviceController.devices.isEmpty
                ? Container()
                : IconButton(
                    onPressed: () {
                      adddeviceController.toggleDeviceView();
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                  );
          })
        ],
      ),
      backgroundColor: bgColor,
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        width: double.infinity,
        child: Obx(() {
          return adddeviceController.toggleAddDevice.value
              ? const AddDevice()
              : deviceController.devices.isEmpty
                  ? const NoDevices()
                  : ListDevices();
        }),
      ),
    );
  }
}
