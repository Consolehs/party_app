import 'package:flutter/material.dart';
import 'package:party_app/database/app_database.dart';
import 'package:party_app/models/party.dart';

class PartyProvider extends ChangeNotifier {
  final AppDatabase db;
  List<Party> _parties = [];
  List<Party> get parties => _parties;

  PartyProvider(this.db);

  Future<void> loadParties() async {
    _parties = await db.partyDao.getAllParties();
    notifyListeners();
  }

  Future<void> addParty(Party party) async {
    await db.partyDao.insertParty(party);
    await loadParties();
  }

  Future<void> deleteParty(Party party) async {
    await db.partyDao.deleteParty(party);
    await loadParties();
  }
}
