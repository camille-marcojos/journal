import 'package:flutter/material.dart';
import '../widgets/journal_scaffold.dart';
import 'journal_entry.dart';
import 'package:sqflite/sqflite.dart';

class EntriesListScreen extends StatelessWidget {

  static const routeName = 'journal_entries';

  final items = List<Map>.generate(10000, (i) {
    return {
      'title': 'Journal entry $i',
      'subtitle': 'Subtitle text for $i',
    };
  });

  @override
   Widget build(BuildContext context) {
    return JournalScaffold(
        title: 'Journal Entries',
        child: ListView.builder(itemBuilder: (context, index) {
          print('Creating item $index');
          return ListTile( 
            trailing: Icon(Icons.more_horiz),
            title: Text('Journal Entry ${items[index]['title']}'),
            subtitle: Text('Example ${items[index]['subtitle']}'),
            //onTap: Navigator.of(context).pushNamed(routeName),
          );
        })
    );
  }
} 