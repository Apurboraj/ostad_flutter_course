import 'dart:async';

class Device {
  final int id;
  final String name;
  bool isOn;

  Device({
    required this.id,
    required this.name,
    this.isOn = false,
  });

  void toggle() {
    isOn = !isOn;
  }
}

class SmartHome {
  final List<Device> _devices = [];

  void addDevice(Device device) {
    _devices.add(device);
  }

  Future<void> updateDeviceStatus(int deviceId, bool isOn) async {
    // Simulate fetching and updating device status
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    _devices.firstWhere((device) => device.id == deviceId).isOn = isOn;
  }

  void listDevices() {
    print('Devices:');
    for (var device in _devices) {
      print('${device.id}: ${device.name} - ${device.isOn ? 'On' : 'Off'}');
    }
  }

  List<Device> filterDevicesByStatus(bool status) {
    return _devices.where((device) => device.isOn == status).toList();
  }
}

// Example usage
void main() async {
  // Create sample devices
  Device light = Device(id: 1, name: 'Light');
  Device fan = Device(id: 2, name: 'Fan');
  Device tv = Device(id: 3, name: 'TV');

  // Create a SmartHome instance
  SmartHome home = SmartHome();

  // Add devices to the SmartHome
  home.addDevice(light);
  home.addDevice(fan);
  home.addDevice(tv);

  // Turn on the light
  await home.updateDeviceStatus(1, true);

  // List all devices
  home.listDevices();

  // List on devices
  List<Device> onDevices = home.filterDevicesByStatus(true);
  print('On Devices:');
  for (var device in onDevices) {
    print('${device.id}: ${device.name}');
  }
}