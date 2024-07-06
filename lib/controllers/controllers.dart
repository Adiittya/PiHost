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
  var devices = <Device>[].obs;

  void addDevice(Device device) {
    devices.add(device);
  }

  void removeDevice(Device device) {
    devices.remove(device);
  }
}
