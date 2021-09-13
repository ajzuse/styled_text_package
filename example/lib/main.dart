import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StyledText Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  void _alert(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tapped'),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openLink(BuildContext context, Map<String, String> attrs) {
    final String link = attrs['href'];

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Open Link'),
          content: Text(link),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StyledText Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Simple formatted text
            StyledText(
              text: 'Test: <b>bold</b> text.',
              tags: {
                'b': StyledTextTag(
                    style: TextStyle(fontWeight: FontWeight.bold)),
              },
            ),

            // Text with quotes
            const SizedBox(height: 20),
            StyledText(
              text: 'Quoted Test: <b>&quot;bold&quot;</b> text.',
              tags: {
                'b': StyledTextTag(
                    style: TextStyle(fontWeight: FontWeight.bold)),
              },
            ),

            // Multiline text without breaks
            const SizedBox(height: 20),
            StyledText(
              text: """Multiline text 
(wo breaks)""",
              tags: {
                'b': StyledTextTag(
                    style: TextStyle(fontWeight: FontWeight.bold)),
              },
            ),

            // Multiline text with breaks
            const SizedBox(height: 20),
            StyledText(
              text: """Multiline text
(with breaks)""",
              newLineAsBreaks: true,
              tags: {
                'b': StyledTextTag(
                    style: TextStyle(fontWeight: FontWeight.bold)),
              },
            ),

            // Custom tags tags
            const SizedBox(height: 20),
            StyledText(
              text: 'Test: <bold>bold</bold> and <red>red color</red> text.',
              tags: {
                'bold': StyledTextTag(
                    style: TextStyle(fontWeight: FontWeight.bold)),
                'red': StyledTextTag(
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
              },
            ),

            // Icon
            const SizedBox(height: 20),
            StyledText(
              text: 'Text with alarm <alarm/> icon.',
              tags: {
                'alarm': StyledTextIconTag(Icons.alarm),
              },
            ),

            // Action
            const SizedBox(height: 20),
            StyledText(
              text: 'Text with <action>action</action> inside.',
              tags: {
                'action': StyledTextActionTag(
                  (_, __) => _alert(context),
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                )
              },
            ),

            // Link
            const SizedBox(height: 20),
            StyledText(
              text:
                  'Text with <link href="https://flutter.dev">link</link> inside.',
              tags: {
                'link': StyledTextActionTag(
                  (_, attrs) => _openLink(context, attrs),
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
