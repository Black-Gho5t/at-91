import 'package:at_91_f/utils/colors.dart';
import 'package:at_91_f/widgets/itemNotification.dart';
import 'package:flutter/material.dart';
import 'package:at_91_f/widgets/bottom_nav.dart';
import 'package:at_91_f/models/notifyModel.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificatiosState();
}

class _NotificatiosState extends State<NotificationsScreen> {
  final List<NotifyModel> _notifications = [
    NotifyModel(
      id: 1,
      idUsr: 0,
      title: 'Yader',
      body: 'Tienes un nuevo mensaje de Yader.',
      date: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
      link: '/messages/1',
    ),
    NotifyModel(
      id: 2,
      idUsr: 0,
      title: 'Yader',
      body: 'Tienes un nuevo mensaje de Yader.',
      date: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
      link: '/messages/1',
    ),
    NotifyModel(
      id: 3,
      idUsr: 0,
      title: 'Yader',
      body: 'Tienes un nuevo mensaje de Yader.',
      date: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
      link: '/messages/1',
    ),
    NotifyModel(
      id: 4,
      idUsr: 0,
      title: 'Yader',
      body: 'Tienes un nuevo mensaje de Yader.',
      date: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
      link: '/messages/1',
    ),
    NotifyModel(
      id: 5,
      idUsr: 0,
      title: 'Yader',
      body: 'Tienes un nuevo mensaje de Yader.',
      date: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
      link: '/messages/1',
    ),
    NotifyModel(
      id: 6,
      idUsr: 0,
      title: 'Yader',
      body: 'Tienes un nuevo mensaje de Yader.',
      date: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
      link: '/messages/1',
    ),
  ];

  void _markAsRead(NotifyModel n) {
    final idx = _notifications.indexWhere((x) => x.id == n.id);
    if (idx == -1) return;
    setState(() {
      _notifications[idx] = _notifications[idx].copyWith(isRead: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // al precionar el boton....
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(height: 1, color: AppColors.cardColor),
          Expanded(
            child: ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                return Itemnotification(
                  notify: _notifications[index],
                  onMarkRead: _markAsRead,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
            // setState(() {
            //   for (var notification in _notifications) {
            //     notification.isRead = true;
            //   }
            // });