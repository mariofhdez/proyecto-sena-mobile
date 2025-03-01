import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> _isExpanded = [false, false, false];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Sistema de Gestión de Nómina"),),
      drawer: Drawer(
        child: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (index, isExpanded) {
                setState(() {
                  _isExpanded[index] = isExpanded;
                });
              },
              children: [
                _buildExpansionPanel(
                  index: 0,
                  title: "Empleados",
                  options: ["Crear empleado", "Ver empleados"]
                ),
                _buildExpansionPanel(
                  index: 1,
                  title: "Novedades",
                  options: ["Crear novedad", "Ver novedades"]
                ),
                _buildExpansionPanel(
                  index: 2,
                  title: "Nómina",
                  options: ["Crear nómina", "Ver nóminas"]
                ),
              ],
            )
          ],
        ),
      ),
      body: Center(child: Text("Contenido principal")),
    );
  }

  ExpansionPanel _buildExpansionPanel({required int index, required String title, required List<String> options}){
    return ExpansionPanel(
      headerBuilder: (context, isExpanded){
        return ListTile(title: Text(title),);
      },
      body: Column(
        children: options.map((option) {
          return ListTile(
            title: Text(option),
            // onTap,
          );
        }).toList(),
      ),
    isExpanded: _isExpanded[index],
    );
  }
}
