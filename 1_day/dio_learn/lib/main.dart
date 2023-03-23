import 'package:dio_learn/dio_client.dart';
import 'package:dio_learn/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DioApp());
}

class DioApp extends StatelessWidget {
  const DioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ChangeNotifierProvider(
            create: (_) => MessageProvider(),
            builder: (providerContext, _) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<MessageProvider>(
                  builder: (context, messageProvider, _) => _MessagePreviewer(
                    message: messageProvider.message,
                  ),
                ),
                const SizedBox(height: 16),
                _DioMessageButton(
                    dioAction: (dio) => dio.getUser(), text: "REST GET"),
                const SizedBox(height: 16),
                _DioMessageButton(
                    dioAction: (dio) => dio.postUser(), text: "REST POST"),
                const SizedBox(height: 16),
                _DioMessageButton(
                    dioAction: (dio) => dio.putUser(), text: "REST PUT"),
                const SizedBox(height: 16),
                _DioMessageButton(
                    dioAction: (dio) => dio.deleteUser(), text: "REST DELETE"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DioMessageButton extends StatelessWidget {
  final Future<String> Function(DioClient dio) dioAction;
  final String text;

  const _DioMessageButton({
    required this.dioAction,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => updateMessage(
          messageProvider: Provider.of<MessageProvider>(
            context,
            listen: false,
          ),
          dioAction: dioAction),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void updateMessage(
      {required MessageProvider messageProvider,
      required Future<String> Function(DioClient) dioAction}) async {
    DioClient dioClient = DioClient();
    String message = await dioAction(dioClient);
    messageProvider.change(message);
  }
}

class _MessagePreviewer extends StatelessWidget {
  final String message;

  const _MessagePreviewer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(message),
      ),
    );
  }
}
