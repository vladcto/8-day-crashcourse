import 'package:beamer/beamer.dart';
import 'package:beamer_learn/home_page.dart';
import 'package:beamer_learn/trader_info.dart';
import 'package:flutter/material.dart';

class TraderPreviewLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    var info = context.currentBeamLocation.data as TraderInfo?;
    return [
      HomePage.beamPage,
      if (info != null)
        BeamPage(
          key: ValueKey(info.name),
          child: TraderPreviewPage(traderInfo: info),
          onPopPage: (_, __, ___, ____) => true,
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [TraderPreviewPage.path];
}

class TraderPreviewPage extends StatelessWidget {
  static const String path = "/preview";

  final TraderInfo traderInfo;

  const TraderPreviewPage({required this.traderInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview trader'),
      ),
      body: Center(
        child: Text(traderInfo.toRichString()),
      ),
    );
  }
}
