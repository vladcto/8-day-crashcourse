import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:l10n_learn/l10n/l10n.dart';
import 'package:l10n_learn/l10n/locale_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      builder: (bContext, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.supported,
        locale: Provider.of<LocaleProvider>(bContext).locale,
        home: const HelloPage(),
      ),
    );
  }
}

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;
    var localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(localization.appBar)),
        actions: [
          DropdownButton(
            icon: Text(L10n.getFlag(localeProvider.locale)),
            items: L10n.supported
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        L10n.getFlag(e),
                      ),
                    ))
                .toList(),
            onChanged: (item) => localeProvider.set(item!),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: const Center(
        child: ClicksCounterBtn(),
      ),
    );
  }
}

class ClicksCounterBtn extends StatefulWidget {
  const ClicksCounterBtn({super.key});

  @override
  State<ClicksCounterBtn> createState() => _ClicksCounterBtnState();
}

class _ClicksCounterBtnState extends State<ClicksCounterBtn> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => setState(() => num++),
      child: Text(AppLocalizations.of(context)!.counter(num)),
    );
  }
}
