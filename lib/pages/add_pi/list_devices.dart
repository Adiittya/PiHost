import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pihost/constants.dart';
import 'package:pihost/controllers/controllers.dart';

class ListDevices extends StatelessWidget {
  ListDevices({super.key});

  final DeviceController deviceController = Get.put(DeviceController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Your Devices",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Obx(
            () => ListView.builder(
              itemCount: deviceController.devices.length,
              itemBuilder: (context, index) {
                final device = deviceController.devices[index];
                return Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(10),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.77,
                      decoration: BoxDecoration(
                        color: deviceList,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            device.deviceName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            "${device.username}@${device.ipAddress}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        deviceController.removeDevice(device);
                      },
                      icon: const Icon(Icons.delete_outline_outlined,
                          color: delete, size: 25),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
