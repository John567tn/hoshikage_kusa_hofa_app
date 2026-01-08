import 'package:flutter/material.dart';
import '../widgets/event_card.dart';
import '../data/mock_events.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('兽聚资讯'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: mockEvents.length,
        itemBuilder: (context, index) {
          return EventCard(event: mockEvents[index]);
        },
      ),
    );
  }
}
