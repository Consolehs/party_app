import 'package:floor/floor.dart';

@entity
class Invitation {
  @primaryKey
  final String id;
  final String partyId;
  final String invitedUserName;
  final String inviterName;
  final int status; // 0: pending, 1: accepted, 2: declined

  Invitation({
    required this.id,
    required this.partyId,
    required this.invitedUserName,
    required this.inviterName,
    required this.status,
  });
}
