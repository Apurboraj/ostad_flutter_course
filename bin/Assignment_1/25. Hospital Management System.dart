// Define the Patient class
class Patient {
  final int id;
  final String name;
  final int age;
  final String disease;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.disease,
  });

  @override
  String toString() => 'Patient(ID: $id, Name: $name, Age: $age, Disease: $disease)';
}

// Define the Doctor class
class Doctor {
  final int id;
  final String name;
  final String specialty;
  final List<Patient> patients = [];

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
  });

  void addPatient(Patient patient) {
    patients.add(patient);
    print('Patient ${patient.name} assigned to Dr. ${name}.');
  }

  @override
  String toString() => 'Doctor(ID: $id, Name: $name, Specialty: $specialty, Patients: ${patients.length})';
}

// Define the Hospital class
class Hospital {
  final Map<int, Doctor> _doctors = {};

  void addDoctor(Doctor doctor) {
    _doctors[doctor.id] = doctor;
    print('Doctor ${doctor.name} added to the hospital.');
  }

  void assignPatientToDoctor(Patient patient, String specialty) {
    try {
      final doctor = _doctors.values.firstWhere(
            (doc) => doc.specialty.toLowerCase() == specialty.toLowerCase(),
        orElse: () => throw Exception('No doctor available with specialty $specialty.'),
      );
      doctor.addPatient(patient);
    } catch (e) {
      print('Error: $e');
    }
  }

  void listPatientsOfDoctor(int doctorId) {
    try {
      final doctor = _doctors[doctorId];
      if (doctor == null) {
        throw Exception('Doctor with ID $doctorId not found.');
      }

      if (doctor.patients.isEmpty) {
        print('Dr. ${doctor.name} has no patients.');
      } else {
        print('Patients of Dr. ${doctor.name}:');
        for (var patient in doctor.patients) {
          print('- $patient');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void displayAllDoctors() {
    if (_doctors.isEmpty) {
      print('No doctors available in the hospital.');
    } else {
      print('Available Doctors:');
      for (var doctor in _doctors.values) {
        print(doctor);
      }
    }
  }
}

void main() {
  final hospital = Hospital();

  // Add doctors
  hospital.addDoctor(Doctor(id: 1, name: 'Apurbo', specialty: 'Cardiology'));
  hospital.addDoctor(Doctor(id: 2, name: 'Manik', specialty: 'Neurology'));
  hospital.addDoctor(Doctor(id: 3, name: 'Rohit', specialty: 'Orthopedics'));

  // Add patients and assign to doctors
  hospital.assignPatientToDoctor(Patient(id: 1, name: 'John', age: 45, disease: 'Heart Disease'), 'Cardiology');
  hospital.assignPatientToDoctor(Patient(id: 2, name: 'Jane', age: 60, disease: 'Brain Tumor'), 'Neurology');
  hospital.assignPatientToDoctor(Patient(id: 3, name: 'Mike', age: 30, disease: 'Broken Leg'), 'Orthopedics');

  // List patients of a specific doctor
  hospital.listPatientsOfDoctor(1);

  // Display all available doctors
  hospital.displayAllDoctors();
}
