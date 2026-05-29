import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:party_app/database/app_database.dart';
import 'package:party_app/providers/party_provider.dart';
import 'package:party_app/screens/home_screen.dart';
import 'package:party_app/screens/add_party_screen.dart';
import 'package:party_app/screens/party_detail_screen.dart';
import 'package:party_app/screens/invite_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorAppDatabase.databaseBuilder('party_app.db').build();
  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;
  const MyApp({required this.database});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PartyProvider(database)),
      ],
      child: MaterialApp(
        title: 'PartyHub',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [Locale('tr'), Locale('en')],
        locale: Locale('tr'),
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/addParty': (context) => AddPartyScreen(),
          '/partyDetail': (context) => PartyDetailScreen(),
          '/invite': (context) => InviteScreen(),
        },
      ),
    );
  }
}
