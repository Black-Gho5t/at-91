// lib/widgets/itemNotification.dart

import 'package:flutter/material.dart';
import '../models/notifyModel.dart';
import '../utils/colors.dart';

class Itemnotification extends StatelessWidget {
  final NotifyModel notify;
  final void Function(NotifyModel)? onMarkRead;

  const Itemnotification({required this.notify, this.onMarkRead, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // No mutar aquí: llamar al callback que el padre provee
        if (onMarkRead != null) onMarkRead!(notify);
      },
      // borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 0,
        color: notify.isRead ? Colors.transparent : AppColors.cardColor,
        shape: const Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notify.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                notify.body,
                style: TextStyle(color: AppColors.textColor.withOpacity(0.8)),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "${notify.date.day}/${notify.date.month}/${notify.date.year}",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textColor.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
