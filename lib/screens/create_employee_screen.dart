import 'package:flutter/material.dart';

class CreateEmployeeScreen extends StatefulWidget {
  const CreateEmployeeScreen();

  @override
  _CreateEmployeeScreenState createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  final TextEditingController _identificationType = TextEditingController();
  final TextEditingController _identificationNumber = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _secondName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _secondLastName = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _department = TextEditingController();

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear empleado')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _identificationType,
                decoration: InputDecoration(
                  label: Text('Tipo de identificación'),
                ),
              ),
              TextField(
                controller: _identificationNumber,
                decoration: InputDecoration(
                  label: Text('Número de identificación'),
                ),
              ),
              TextField(
                controller: _firstName,
                decoration: InputDecoration(label: Text('Primer nombre')),
              ),
              TextField(
                controller: _secondName,
                decoration: InputDecoration(label: Text('Segundo nombre')),
              ),
              TextField(
                controller: _lastName,
                decoration: InputDecoration(label: Text('Primer apellido')),
              ),
              TextField(
                controller: _secondLastName,
                decoration: InputDecoration(label: Text('Segundo apellido')),
              ),
              TextField(
                controller: _address,
                decoration: InputDecoration(label: Text('Dirección')),
              ),
              TextField(
                controller: _city,
                decoration: InputDecoration(label: Text('Ciudad')),
              ),
              TextField(
                controller: _department,
                decoration: InputDecoration(label: Text('Departamento')),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => print("siguiente"),
                child: Text("Siguiente"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
