import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pihost/constants.dart';
import 'package:pihost/controllers/controllers.dart';
import 'package:pihost/pages/pi_details/pi_details.dart';

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
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: deviceList,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => PiDetails(), arguments: device);
                          },
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
                                "${device.ipAddress}:${device.portNumber}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
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
