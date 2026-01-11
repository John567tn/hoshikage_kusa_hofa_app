import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/event.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题
            Text(event.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            // 日期
            Row(children: [const Icon(LucideIcons.calendar, size: 20), const SizedBox(width: 8), Text(event.date)]),
            const SizedBox(height: 8),
            // 地点
            Row(children: [const Icon(LucideIcons.mapPin, size: 20), const SizedBox(width: 8), Text(event.location)]),
            const SizedBox(height: 16),
            // 内容
            Text(event.content, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            // 按钮
            if (event.url != null)
              ElevatedButton.icon(
                onPressed: () async {
                  final uri = Uri.parse(event.url!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                icon: const Icon(LucideIcons.externalLink),
                label: const Text('了解活动详情'),
              ),
          ],
        ),
      ),
    );
  }
}
