import 'package:flutter/material.dart';
import 'package:pihost/controllers/controllers.dart';
import 'package:pihost/model/models.dart';
import 'package:validators/validators.dart';
import 'package:get/get.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({super.key});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  String? _errorMessage;
  final TextEditingController _deviceNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ipAddressController = TextEditingController();
  final TextEditingController _portNumberController = TextEditingController();


  void _validateDeviceName(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorMessage = 'Device name cannot be empty';
      } else {
        _errorMessage = null;
      }
    });
  }


  void _validateUsername(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorMessage = 'Username cannot be empty';
      } else {
        _errorMessage = null;
      }
    });
  }

 
  void _validateIpv4(String value) {
    setState(() {
      if (isIP(value, 4)) {
        _errorMessage = null;
      } else {
        _errorMessage = 'Invalid IP address';
      }
    });
  }

  void _validatePortNumber(String value) {
    setState(() {
      if (isNumeric(value) && int.tryParse(value) != null) {
        int port = int.parse(value);
        if (port >= 0 && port <= 65535) {
          _errorMessage = null;
        } else {
          _errorMessage = 'Invalid port number';
        }
      } else {
        _errorMessage = 'Invalid port number';
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final SwitchController switchController = Get.find();
    final DeviceController deviceController = Get.find();
    

    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.6,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Connect Your RaspberryPi Device ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _deviceNameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Device Name',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) => _validateDeviceName(_deviceNameController.text),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _usernameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) => _validateUsername(_usernameController.text),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _ipAddressController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'IP Address',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: ((value) => _validateIpv4(_ipAddressController.text)),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _portNumberController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Port Number',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) => _validatePortNumber(_portNumberController.text),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    switchController.toggleDeviceView();
                    _deviceNameController.clear();
                    _usernameController.clear();
                    _ipAddressController.clear();
                    _portNumberController.clear();
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
                    overlayColor:
                        MaterialStateProperty.all(const Color(0xFFE4E4E4)),
                    foregroundColor:
                        MaterialStateProperty.all(const Color(0xFF646464)),
                  ),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_errorMessage == null) {
                      Device device = Device(
                        deviceName: _deviceNameController.text,
                        username: _usernameController.text,
                        ipAddress: _ipAddressController.text,
                        portNumber: int.parse(_portNumberController.text),
                      );
                      deviceController.addDevice(device);
                      switchController.toggleDeviceView();
                    } else {
                      Get.snackbar("Error", _errorMessage!);
                    }
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
                    overlayColor:
                        MaterialStateProperty.all(const Color(0xFFE4E4E4)),
                    foregroundColor:
                        MaterialStateProperty.all(const Color(0xFF646464)),
                  ),
                  child: const Text('Connect'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _deviceNameController.dispose();
    _usernameController.dispose();
    _ipAddressController.dispose();
    _portNumberController.dispose();
    super.dispose();
  }
}
