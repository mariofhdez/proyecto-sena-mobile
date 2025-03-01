import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> _isExpanded = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sistema de Gestión de Nómina")),
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
                  options: {"Crear empleado": "create-employee", "Ver empleados": "retrieve-employees"},
                ),
                _buildExpansionPanel(
                  index: 1,
                  title: "Novedades",
                  options: {"Crear novedad": "create-new", "Ver novedades": "retrieve-news"},
                ),
                _buildExpansionPanel(
                  index: 2,
                  title: "Nómina",
                  options: {"Crear nómina": "create-payroll", "Ver nóminas": "retrieve-payrolls"},
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard(
              "Empleados",
              "create-employee",
              "retrieve-employees",
              context,
            ),
            _buildCard("Novedades", "create-new", "retrieve-news", context),
            _buildCard(
              "Nóminas",
              "create-payroll",
              "retrieve-payrolls",
              context,
            ),
          ],
        ),
      ),
    );
  }

  ExpansionPanel _buildExpansionPanel({
    required int index,
    required String title,
    required Map<String,String> options,
  }) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return ListTile(title: Text(title));
      },
      body: Column(
        children:
            options.entries.map((option) {
              return ListTile(
                title: Text(option.key),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/${option.value}');
                },
              );
            }).toList(),
      ),
      isExpanded: _isExpanded[index],
    );
  }

  Widget _buildCard(
    String title,
    String createPath,
    String retrievePath,
    BuildContext context,
  ) {
    return SizedBox(
      height: 208,
      width: 300,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/$createPath'),
                  child: Text('Crear $title'),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed:
                      () => Navigator.pushNamed(context, '/$retrievePath'),
                  child: Text('Consultar $title'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
