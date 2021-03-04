
import 'package:flutter/material.dart';
import 'new_entry.dart';
import '../widgets/journal_drawer.dart';

class WelcomeScreen extends StatefulWidget {

  static const routeName = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final String title = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: JournalDrawer(),
        appBar: AppBar(
          title: Text(title),
          actions: [
            Builder(
              builder: (context) => IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              journalIcon(context),
              textPlaceholder(context),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => pushAddJournalEntry(context),
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
}

Widget journalIcon(BuildContext context) {
  return Container(
    child: Icon(
      Icons.book,
      size: 100.0,)
    );
}

Widget textPlaceholder(BuildContext context) {
  return Container(
    child: Text('Journal', style: Theme.of(context).textTheme.headline6));
}

void pushAddJournalEntry(BuildContext context) {
  Navigator.of(context).pushNamed(NewEntryScreen.routeName);
}