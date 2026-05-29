import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:party_app/models/party.dart';
import 'package:party_app/models/invitation.dart';
import 'package:party_app/database/app_database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class InviteScreen extends StatefulWidget {
  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  final _controller = TextEditingController();
  late AppDatabase _db;
  late Party _party;

  @override
  void initState() {
    super.initState();
    _party = ModalRoute.of(context)!.settings.arguments as Party;
    _initDb();
  }

  _initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/party_app.db';
    _db = await $FloorAppDatabase.databaseBuilder(path).build();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Davet Et')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: const InputDecoration(labelText: 'Arkadaşının Adı')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final invite = Invitation(
                  id: const Uuid().v4(),
                  partyId: _party.id,
                  invitedUserName: _controller.text,
                  inviterName: 'Ben',
                  status: 0,
                );
                await _db.invitationDao.insertInvitation(invite);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Davet gönderildi')));
                Navigator.pop(context);
              },
              child: const Text('Davet Gönder'),
            ),
          ],
        ),
      ),
    );
  }
}
