import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ScoutingApp());
}

class ScoutingApp extends StatelessWidget {
  const ScoutingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScoutingAppState(),
      child: MaterialApp(
        title: 'Scouting App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        home: HomePage(),
      ),
    );
  }
}

class ScoutingAppState extends ChangeNotifier {
  var teams = <Team>[];
  var ids = <int?>{};

  void testTeam() {
    Team test = Team(name: 'Test Team', description: 'Placeholder', id: 3000);
    teams.add(test);
    ids.add(test.id);
  }
}

class Team {
  String name;
  int? id, rank, gears;
  bool hasTeleOp, hasAutonomous, graciouslyProfessional;
  String description;
  List<Image>? images;

  Team({
    this.name = '', 
    this.id, this.rank, this.gears, 
    this.hasTeleOp = true, this.hasAutonomous = false, this.graciouslyProfessional = true, 
    this.description = '', 
    this.images
  });
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ScoutingAppState>();

    appState.testTeam();

    return Scaffold(
      appBar: AppBar(
        title: Text('Scouting App')
      ),
      body: ListView(
        children: [
          for (Team team in appState.teams)
            Text(team.name + team.description)
        ],
      ),
    );
  }
}
