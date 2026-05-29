import 'package:flutter/material.dart';
import 'package:party_app/models/party.dart';
import 'package:intl/intl.dart';

class PartyCard extends StatelessWidget {
  final Party party;
  final VoidCallback onTap;

  const PartyCard({required this.party, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFFFFB6C1), Color(0xFFFFDAB9)]),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 3))],
        ),
        child: ListTile(
          leading: const Icon(Icons.celebration, size: 40, color: Colors.deepPurple),
          title: Text(party.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Text('${DateFormat.yMMMd().add_jm().format(DateTime.fromMillisecondsSinceEpoch(party.dateTime))}\n${party.address}'),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
