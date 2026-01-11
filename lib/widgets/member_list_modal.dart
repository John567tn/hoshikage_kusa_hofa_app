import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/about_data.dart';

class MemberListModal extends StatelessWidget {
  final String title;
  final List<Person> members;

  const MemberListModal({super.key, required this.title, required this.members});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet( // ✅ iOS 风格底部弹窗
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 20)],
          ),
          child: Column(
            children: [
              // 顶部拖拽条
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    final person = members[index];
                    return _buildMemberTile(context, person);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMemberTile(BuildContext context, Person person) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: person.avatar != null
            ? ClipOval(
                child: Image.asset(
                  person.avatar!,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const CircleAvatar(child: Icon(LucideIcons.user));
                  },
                ),
              )
            : const CircleAvatar(child: Icon(LucideIcons.user)),
        title: Text(person.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (person.bilibili != null)
              IconButton(
                icon: const Icon(LucideIcons.tv, color: Colors.blue),
                onPressed: () => launchUrl(Uri.parse(person.bilibili!)),
              ),
            if (person.douyin != null)
              IconButton(
                icon: const Icon(LucideIcons.music2, color: Colors.black),
                onPressed: () => launchUrl(Uri.parse(person.douyin!)),
              ),
          ],
        ),
      ),
    );
  }
}
