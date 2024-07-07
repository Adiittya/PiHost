import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pihost/constants.dart';
import 'package:pihost/controllers/controllers.dart';
import 'package:pihost/model/models.dart';

class PiDetails extends StatelessWidget {
  final Device device = Get.arguments;

  PiDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceController deviceController = Get.put(DeviceController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
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
      body: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                scrollBehavior: const MaterialScrollBehavior(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.6,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: deviceList,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.memory,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Memory",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                "4GB",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
