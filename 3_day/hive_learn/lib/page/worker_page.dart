import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_learn/model/worker.dart';
import 'package:hive_learn/widget/worker_dialog.dart';

import '../repository/boxes.dart';

class WorkerPage extends StatefulWidget {
  const WorkerPage({super.key});

  @override
  State<WorkerPage> createState() => _WorkerPageState();
}

class _WorkerPageState extends State<WorkerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Hive Learn")),
      ),
      body: ValueListenableBuilder(
        valueListenable: Boxes.workersBox.listenable(),
        builder: (_, box, ___) {
          var tiles = box.values
              .map(
                (e) => _buildTile(e),
              )
              .toList();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: tiles,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => WorkerDialog(
            onConfirm: (name, departament) => Boxes.workersBox.add(
              Worker(name: name, departament: departament),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTile(Worker worker) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: ExpansionTile(
          trailing: const SizedBox.shrink(),
          title: Text(worker.name),
          subtitle: Text("Departament is ${worker.departament}"),
          children: [buildTileButton(worker)],
        ),
      ),
    );
  }

  Widget buildTileButton(Worker worker) {
    return Builder(
      builder: (context) => Row(
        children: [
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(
                  DialogRoute(
                    context: context,
                    builder: (_) => WorkerDialog(
                        onConfirm: (name, departament) => worker
                          ..name = name
                          ..departament = departament
                          ..save()),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => worker.delete(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
