import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/employee_provider.dart';

class EmployeesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text("Empleados"),
      ),
      body: Consumer<EmployeeProvider>(
        builder: (context, provider, child){
          return ListView.builder(
            itemCount: provider.employees.length,
            itemBuilder: (context, index){
              final employee = provider.employees[index];
              return ListTile(
                title: Text("${employee.firstName} ${employee.lastName}"),
                subtitle: Text("Cargo: ${employee.position}"),
                trailing: IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/create-employee'),
                  icon: Icon(Icons.edit),
                ),
              );
            },
          );
        }
      ),
    );
  }
}