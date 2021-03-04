import 'package:flutter/material.dart';
import '../widgets/journal_drawer.dart';

class JournalScaffold extends StatelessWidget {

  final String title;
  final Widget child;

  JournalScaffold({Key key, this.title, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: JournalDrawer(),
      appBar: AppBar(title: Text(title), actions: [
          Builder( 
            builder: (context) => IconButton( 
              icon: Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            )
          )
        ],),
      body: child,
    );
  }
}