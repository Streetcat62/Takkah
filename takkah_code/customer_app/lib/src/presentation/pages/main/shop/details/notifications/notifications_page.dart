import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/notification_item.dart';
import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import 'riverpod/provider/notifications_provider.dart';
import '../../../../../../core/constants/constants.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(notificationsProvider.notifier).updateNotifications();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.notifications),
        onLeadingPressed: context.popRoute,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(notificationsProvider);
          return state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3.r,
                    color: AppColors.green,
                  ),
                )
              : ListView.builder(
                  itemCount: state.notifications.length,
                  padding: REdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  itemBuilder: (context, index) {
                    return NotificationItem(
                      notification: state.notifications[index],
                    );
                  },
                );
        },
      ),
    );
  }
}
