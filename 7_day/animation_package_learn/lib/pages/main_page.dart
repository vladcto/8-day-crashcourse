import 'package:animation_package_learn/pages/preview_page.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _mainTab = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animations package")),
      body: PageTransitionSwitcher(
        reverse: _mainTab,
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
          transitionType: SharedAxisTransitionType.vertical,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: _mainTab ? const _MainTab() : const _ScaleTransitionTab(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _mainTab = !_mainTab),
      ),
    );
  }
}

class _MainTab extends StatelessWidget {
  const _MainTab({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: height * .7,
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: OpenContainer(
                  transitionType: ContainerTransitionType.fadeThrough,
                  closedBuilder: (_, __) => Container(
                    alignment: Alignment.center,
                    color: Colors.orange,
                    child: const Text("Open container"),
                  ),
                  openBuilder: (_, __) => const PreviewPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScaleTransitionTab extends StatelessWidget {
  const _ScaleTransitionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.orange,
      child: Center(
        child: Text("It's me"),
      ),
    );
  }
}
