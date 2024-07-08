class Device {
  late final String deviceName;
  late final String username;
  late final String ipAddress;
  late final int portNumber;
  late final List<Map<String, dynamic>> commands;

  Device({
    required this.deviceName,
    required this.username,
    required this.ipAddress,
    required this.portNumber,
    this.commands = const [],
  });
}
