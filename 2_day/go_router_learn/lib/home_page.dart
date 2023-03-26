import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_learn/trader_info.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final bool displayDetailed;
  const HomePage({Key? key, required this.displayDetailed}) : super(key: key);

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
                  context.go(
                    "/home/preview",
                    extra: info,
                  );
                },
              ),
            ),
            Positioned(
              top: 260,
              bottom: 16,
              right: 16,
              left: 266,
              child: _DisplayCard(
                displayDetailed: displayDetailed,
              ),
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

class _DisplayCard extends StatelessWidget {
  final bool displayDetailed;
  const _DisplayCard({super.key, required this.displayDetailed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Consumer<TraderInfo>(
                builder: (context, value, child) => Text(
                  displayDetailed ? value.toRichString() : value.toString(),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (displayDetailed) {
                    context.go("/home?detailed=false");
                  } else {
                    context.go("/home?detailed=true");
                  }
                },
                child: const Text("Change navigation"))
          ],
        ),
      ),
    );
  }
}
