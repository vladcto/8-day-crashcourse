import 'package:flutter/material.dart';

void main() {
  runApp(const NavigatorApp());
}

class NavigatorApp extends StatefulWidget {
  const NavigatorApp({super.key});

  @override
  State<NavigatorApp> createState() => _NavigatorAppState();
}

class _NavigatorAppState extends State<NavigatorApp> {
  String first = "", second = "";
  bool preview = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
            child: ControlPage(
              changedFirst: (text) => first = text,
              changedSecond: (text) => second = text,
              showPreview: () => setState(() => preview = true),
            ),
          ),
          if (preview)
            MaterialPage(
              child: PreviewPage(
                first: first,
                second: second,
              ),
            ),
        ],
        onPopPage: (route, res) => route.didPop(res),
      ),
    );
  }
}

class ControlPage extends StatelessWidget {
  final void Function(String) changedFirst, changedSecond;
  final Function showPreview;
  const ControlPage({
    super.key,
    required this.changedFirst,
    required this.changedSecond,
    required this.showPreview,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Navigator 2.0"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputCard(
              changedFirst: changedFirst,
              changedSecond: changedSecond,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => showPreview(),
              child: const Text("Go to next screen"),
            ),
          ],
        ),
      ),
    );
  }
}

class InputCard extends StatefulWidget {
  final Function(String) changedFirst, changedSecond;
  const InputCard({
    super.key,
    required this.changedFirst,
    required this.changedSecond,
  });

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  bool inputFirst = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 128,
          width: 256,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Navigator(
                pages: [
                  if (inputFirst)
                    MaterialPage(
                      key: UniqueKey(),
                      child: Center(
                        child: TextField(
                          onChanged: (t) => widget.changedFirst(t),
                        ),
                      ),
                    ),
                  if (!inputFirst)
                    MaterialPage(
                      key: UniqueKey(),
                      child: Center(
                        child: TextField(
                          onChanged: (t) => widget.changedSecond(t),
                        ),
                      ),
                    )
                ],
                onPopPage: (route, res) => route.didPop(res),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => setState(() => inputFirst = !inputFirst),
          child: const Text("Change input"),
        ),
      ],
    );
  }
}

class PreviewPage extends StatelessWidget {
  final String first, second;
  const PreviewPage({required this.first, required this.second, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview page"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (first.isNotEmpty)
              Card(
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(first),
                ),
              ),
            if (second.isNotEmpty)
              Card(
                color: Colors.indigo,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(second),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
