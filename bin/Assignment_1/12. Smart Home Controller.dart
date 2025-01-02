import 'dart:async';

class Device {
  int id;
  String name;
  bool status; // true for On, false for Off

  Device(this.id, this.name, this.status);
}

class SmartHome {
  List<Device> devices = [];

  void addDevice(Device device) {
    devices.add(device);
  }

  void turnDeviceOn(int id) {
    Device device = devices.firstWhere((device) => device.id == id, orElse: () => throw Exception('Device not found'));
    device.status = true;
    print('${device.name} is now On.');
  }

  void turnDeviceOff(int id) {
    Device device = devices.firstWhere((device) => device.id == id, orElse: () => throw Exception('Device not found'));
    device.status = false;
    print('${device.name} is now Off.');
  }

  void listAllDevices() {
    devices.forEach((device) {
      print('ID: ${device.id}, Name: ${device.name}, Status: ${device.status ? 'On' : 'Off'}');
    });
  }

  void filterDevicesByStatus(bool status) {
    devices.where((device) => device.status == status).forEach((device) {
      print('ID: ${device.id}, Name: ${device.name}, Status: ${device.status ? 'On' : 'Off'}');
    });
  }
}

Future<void> fetchDeviceData() async {
  print('Fetching device data...');
  await Future.delayed(Duration(seconds: 2)); // Simulate fetching data
  print('Device data fetched.');
}

void main() async {
  try {
    SmartHome smartHome = SmartHome();

    Device device1 = Device(1, 'Light', false);
    Device device2 = Device(2, 'Fan', true);
    Device device3 = Device(3, 'Heater', false);

    smartHome.addDevice(device1);
    smartHome.addDevice(device2);
    smartHome.addDevice(device3);

    await fetchDeviceData();

    smartHome.listAllDevices();

    smartHome.turnDeviceOn(1);
    smartHome.turnDeviceOff(2);

    print('Devices that are On:');
    smartHome.filterDevicesByStatus(true);

    print('Devices that are Off:');
    smartHome.filterDevicesByStatus(false);
  } catch (e) {
    print('Error: $e');
  }
}
