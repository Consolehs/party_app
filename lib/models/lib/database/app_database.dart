import 'package:floor/floor.dart';
import 'package:party_app/models/party.dart';
import 'package:party_app/models/invitation.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Party, Invitation])
abstract class AppDatabase extends FloorDatabase {
  PartyDao get partyDao;
  InvitationDao get invitationDao;
}

@dao
abstract class PartyDao {
  @Query('SELECT * FROM Party ORDER BY dateTime ASC')
  Future<List<Party>> getAllParties();

  @Query('SELECT * FROM Party WHERE id = :id')
  Future<Party?> getPartyById(String id);

  @insert
  Future<void> insertParty(Party party);

  @update
  Future<void> updateParty(Party party);

  @delete
  Future<void> deleteParty(Party party);
}

@dao
abstract class InvitationDao {
  @Query('SELECT * FROM Invitation WHERE partyId = :partyId')
  Future<List<Invitation>> getInvitationsForParty(String partyId);

  @Query('SELECT * FROM Invitation WHERE invitedUserName = :userName')
  Future<List<Invitation>> getInvitationsForUser(String userName);

  @insert
  Future<void> insertInvitation(Invitation invitation);

  @update
  Future<void> updateInvitation(Invitation invitation);
}
