import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../models/about_data.dart';
import '../widgets/member_list_modal.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _showMembers(BuildContext context, String title, List<Person> members) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // 
      builder: (context) => MemberListModal(title: title, members: members),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于我们'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 顶部介绍
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20)],
              ),
              child: Column(
                children: [
                  const Icon(LucideIcons.users, size: 48, color: Color(0xFF9C70FF)),
                  const SizedBox(height: 16),
                  Text(
                    '关于我们',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    aboutData.description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionButton(
              context,
              '社区创建者',
              LucideIcons.crown,
              () => _showMembers(context, '社区创建者', aboutData.founders),
            ),
            _buildSectionButton(
              context,
              '社区原始成员',
              LucideIcons.heart,
              () => _showMembers(context, '社区原始成员', aboutData.originalMembers),
            ),
            _buildSectionButton(
              context,
              '网站制作与运营',
              LucideIcons.code,
              () => _showMembers(context, '网站制作与运营', aboutData.operators),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionButton(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
