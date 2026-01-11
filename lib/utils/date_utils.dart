import '../models/event.dart';
import 'package:flutter/material.dart';
import '../models/event.dart';

// 解析日期范围
String getCountdownText(String dateRange) {
  final parts = dateRange.split(' - ');
  final startStr = parts[0].split('(')[0].trim();
  final endStr = parts.length > 1 ? parts[1].split('(')[0].trim() : startStr;
  
  final startDate = DateTime.parse(startStr);
  final endDate = DateTime.parse(endStr);
  final now = DateTime.now();
  
  final today = DateTime(now.year, now.month, now.day);
  final start = DateTime(startDate.year, startDate.month, startDate.day);
  final end = DateTime(endDate.year, endDate.month, endDate.day);
  
  if (today.isAfter(end)) return '已结束';
  if (today.isAtSameMomentAs(start) || (today.isAfter(start) && today.isBefore(end))) return '进行中';
  
  final diff = start.difference(today).inDays;
  if (diff == 0) return '今天';
  if (diff == 1) return '明天';
  return '$diff天后';
}

// 计算状态标签
Map<String, dynamic> calculateEventStatus(String dateRange) {
  final text = getCountdownText(dateRange);
  if (text == '已结束') return {'text': text, 'color': Colors.grey};
  if (text == '进行中') return {'text': text, 'color': Colors.green};
  if (text == '今天' || text == '明天') return {'text': text, 'color': Colors.red};
  return {'text': text, 'color': Colors.blue};
}
