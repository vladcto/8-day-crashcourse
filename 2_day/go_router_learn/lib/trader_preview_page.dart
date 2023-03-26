import 'package:flutter/material.dart';
import 'package:go_router_learn/trader_info.dart';

class TraderPreviewPage extends StatelessWidget {
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
