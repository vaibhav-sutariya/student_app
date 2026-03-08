import 'package:flutter/material.dart';
import 'package:student_app/cubit/theme_cubit.dart';

import '../../../../../core/helpers/extensions/responsive_extensions.dart';

/// Reusable leave status badge widget
/// Shows approval status with colored background
class LeaveStatusBadge extends StatelessWidget {
  final String status;
  final String? approvedBy;

  const LeaveStatusBadge({super.key, required this.status, this.approvedBy});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.scale(12),
        vertical: context.scaleHeight(6),
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: BorderRadius.circular(context.scale(4)),
      ),
      child: Text(
        _getStatusText(),
        style: TextStyle(
          fontSize: context.scaleFont(11),
          fontWeight: FontWeight.bold,
          color: _getTextColor(context),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    switch (status.toLowerCase()) {
      case 'approved':
        return const Color(0xFFE8F5E9);
      case 'pending':
        return const Color(0xFFFFF3E0);
      case 'rejected':
        return const Color(0xFFFFEBEE);
      default:
        return context.colors.surface;
    }
  }

  Color _getTextColor(BuildContext context) {
    switch (status.toLowerCase()) {
      case 'approved':
        return context.colors.success;
      case 'pending':
        return context.colors.warning;
      case 'rejected':
        return context.colors.error;
      default:
        return const Color(0xFF616161);
    }
  }

  String _getStatusText() {
    if (status.toLowerCase() == 'approved' && approvedBy != null) {
      return 'APPROVED BY: ${approvedBy!.toUpperCase()}';
    }
    return status.toUpperCase();
  }
}
