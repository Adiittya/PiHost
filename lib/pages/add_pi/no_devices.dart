import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pihost/controllers/controllers.dart';

class NoDevices extends StatelessWidget {
  const NoDevices({super.key});

  @override
  Widget build(BuildContext context) {
    final SwitchController addDeviceController = Get.find();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icon.svg',
          width: 100,
          height: 100,
          colorFilter:
              const ColorFilter.mode(Color(0x0fffffff), BlendMode.srcIn),
        ),
        const SizedBox(height: 20),
        const Text("No Devices Connected",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        SizedBox(
          height: 35,
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              addDeviceController.toggleDeviceView();
            },
            style: ButtonStyle(
              alignment: Alignment.center,
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFFE4E4E4)),
              overlayColor: MaterialStateProperty.all(const Color(0xFFE4E4E4)),
              foregroundColor:
                  MaterialStateProperty.all(const Color(0xFF646464)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add),
                SizedBox(width: 5),
                Text('Add Device'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
