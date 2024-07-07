import 'package:get/get.dart';
import 'package:pihost/model/models.dart';

class ErrorController extends GetxController {
  var error = ''.obs;

  void setError(String message) {
    error.value = message;
  }
}

class AddDeviceController extends GetxController {
  final toggleAddDevice = false.obs;

  void toggleDeviceView() {
    toggleAddDevice.value = !toggleAddDevice.value;
  }
}

class DeviceController extends GetxController {
  var devices = <Device>[
    Device(
        deviceName: "Raspberry Pi 4",
        username: "pi",
        ipAddress: "192.168.29.16",
        portNumber: 22),
  ].obs;

  void addDevice(Device device) {
    devices.add(device);
  }

  void removeDevice(Device device) {
    devices.remove(device);
  }

  void connectDevice(Device device) {
    // Connect to the device
  }
}
