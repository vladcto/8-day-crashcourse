import 'package:beamer_learn/trader_info.dart';
import 'package:beamer_learn/trader_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:provider/provider.dart';

class HomeLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [HomePage.beamPage];

  @override
  List<Pattern> get pathPatterns => [
        "/",
        "/detailed",
        "/simple",
      ];
}

class HomePage extends StatelessWidget {
  static const BeamPage beamPage =
      BeamPage(key: ValueKey("home"), child: HomePage());

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => TraderInfo(),
        builder: (buildContext, child) => Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              bottom: 260,
              width: 250,
              child: _TraderInputCard(
                showTrader: () {
                  var info = Provider.of<TraderInfo>(buildContext, listen: false);
                  context.beamToNamed("/preview", data: info);
                },
              ),
            ),
            const Positioned(
              top: 260,
              bottom: 16,
              right: 16,
              left: 266,
              child: _DisplayCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TraderInputCard extends StatelessWidget {
  final Function() showTrader;

  const _TraderInputCard({super.key, required this.showTrader});

  @override
  Widget build(BuildContext context) {
    TraderInfo traderInfo = Provider.of<TraderInfo>(context, listen: false);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              onChanged: (text) => traderInfo.updateWith(name: text),
            ),
            TextField(
              onChanged: (text) => traderInfo.updateWith(tradingCompany: text),
            ),
            ElevatedButton(
              onPressed: showTrader,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Show trader"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DisplayCard extends StatefulWidget {
  const _DisplayCard({super.key});

  @override
  State<_DisplayCard> createState() => _DisplayCardState();
}

class _DisplayCardState extends State<_DisplayCard> {
  GlobalKey<BeamerState> beamerState = GlobalKey<BeamerState>();

  bool detailed = false;
  final BeamerDelegate _beamerDelegate = BeamerDelegate(
    initialPath: "/simple",
    locationBuilder: RoutesLocationBuilder(
      routes: {
        "/simple": (_, __, ___) => Consumer<TraderInfo>(
              builder: (context, info, _) => Text(info.toRichString()),
            ),
        "/detailed": (_, __, ___) => Consumer<TraderInfo>(
              builder: (context, info, _) => Text(info.toString()),
            ),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Beamer(
                key: beamerState,
                routerDelegate: _beamerDelegate,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  detailed = !detailed;
                  if (detailed) {
                    beamerState.currentContext!.beamToNamed("/detailed");
                  } else {
                    beamerState.currentContext!.beamToNamed("/simple");
                  }
                },
                child: const Text("Change navigation"))
          ],
        ),
      ),
    );
  }
}
