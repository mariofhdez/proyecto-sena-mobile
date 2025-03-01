import 'package:flutter/foundation.dart';
import 'package:sena_mobile/models/employee.dart';

class EmployeeProvider extends ChangeNotifier {
  final List<Employee> _employees = [
    Employee(
      id: "1",
      identificationType: "Cédula de ciudadanía",
      identificationNumber: "1234567890",
      firstName: "Julio",
      secondName: "",
      lastName: "Jaramillo",
      secondLastName: "",
      address: "Avenida 78 # 25 - 14",
      city: "San Jerónimo",
      department: "Antioquia",
      position: "Gerente",
    ),
  ];

  List<Employee> get employees => _employees;
}
