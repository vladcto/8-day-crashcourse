import 'package:animations_learn/widgets/animation_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MainContent(),
      ),
    );
  }
}

class MainContent extends StatefulWidget {
  const MainContent({
    super.key,
  });

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();

  final Widget dummy = Container(
    height: 200,
    width: 200,
    color: Colors.orange,
  );

  double _padding = 0;

  @override
  void initState() {
    _controller.addListener(() => setState(() {
          _padding = _controller.value * 128;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        childAspectRatio: 600 / 400,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        children: [
          AnimationCard(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => Transform.translate(
                offset: Offset(_controller.value * 50, -_controller.value * 25),
                child: child,
              ),
              child: dummy,
            ),
          ),
          AnimationCard(
            child: FadeTransition(
              opacity: _controller,
              child: dummy,
            ),
          ),
          AnimationCard(
            child: AnimatedPadding(
              duration: const Duration(seconds: 3),
              padding: EdgeInsets.all(_padding),
              child: Container(color: Colors.orange),
            ),
          ),
          _MyAnimatedWidget(listenable: _controller),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _MyAnimatedWidget extends AnimatedWidget {
  const _MyAnimatedWidget({required super.listenable});

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return AnimationCard(
      child:
          Container(color: Color.lerp(Colors.red, Colors.orange, _progress.value)),
    );
  }
}
