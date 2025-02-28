import 'package:flutter/material.dart';

const List<String> employeesOptions = <String>[
  'Ver empleados',
  'Crear empleado',
];
const List<String> newsOptions = <String>['Ver novedades', 'Crear novedad'];
const List<String> payrollsOptions = <String>[
  'Consultar nóminas',
  'Crear nómina',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sistema de gestión de nómina')),
      drawer: Drawer(
        // backgroundColor: ,
        child: ListView(
          children: [
            // DrawerHeader(child: Text('Menú')),
            DropdownButtonEmployees(),
            ListTile(title: Text('Empleados')),
            ListTile(title: Text('Novedades')),
            ListTile(title: Text('Nóminas')),
          ],
        ),
      ),
    );
  }
}

class DropdownButtonEmployees extends StatefulWidget {
  const DropdownButtonEmployees({super.key});

  @override
  State<DropdownButtonEmployees> createState() =>
      _DropdownButtonEmployeesState();
}

class _DropdownButtonEmployeesState extends State<DropdownButtonEmployees> {
  String dropdownValue = employeesOptions.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(height: 2, color: Colors.deepPurpleAccent),
      items:
          employeesOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
    );
  }
}
