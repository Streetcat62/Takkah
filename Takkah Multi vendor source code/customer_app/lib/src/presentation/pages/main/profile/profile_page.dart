import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/theme.dart';
import 'widgets/logout_modal.dart';
import 'widgets/delete_user_modal.dart';
import 'widgets/profile_menu_item.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../../core/constants/constants.dart';
import 'chat/riverpod/provider/chat_provider.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../riverpod/provider/app_provider.dart';
import 'profile_settings/riverpod/provider/profile_image_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  final bool fromHome;
  final int? shopId;

  const ProfilePage({Key? key, this.fromHome = false, this.shopId})
      : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(chatProvider.notifier).fetchChats(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(appProvider);
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainBackground(),
        actions: <Widget>[
          IconButton(
            onPressed: context.popRoute,
            splashRadius: 20.r,
            icon: Icon(
              FlutterRemix.close_line,
              color: AppColors.iconAndTextColor(),
              size: 24.r,
            ),
          ),
          15.horizontalSpace,
        ],
      ),
      body: Column(
        children: <Widget>[
          if (LocalStorage.instance.getUser() != null)
            Container(
              padding: REdgeInsets.symmetric(horizontal: 25, vertical: 10),
              margin: REdgeInsets.only(bottom: 27),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 64.r,
                    height: 64.r,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4.r,
                        color: AppColors.secondaryBack(),
                      ),
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Consumer(
                      builder: (context, ref, child) {
                        ref.watch(profileImageProvider);
                        return CommonImage(
                          imageUrl: LocalStorage.instance.getUser()?.img,
                          width: 60,
                          height: 60,
                          radius: 30,
                        );
                      },
                    ),
                  ),
                  15.horizontalSpace,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${LocalStorage.instance.getUser()?.firstname ?? AppHelpers.getTranslation(TrKeys.noName)} ${LocalStorage.instance.getUser()?.lastname ?? ''}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          letterSpacing: -1,
                          color: AppColors.iconAndTextColor(),
                        ),
                      ),
                      3.verticalSpace,
                      Text(
                        'Id: ${LocalStorage.instance.getUser()?.id}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          letterSpacing: -1,
                          color: AppColors.secondaryIconTextColor(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          if (LocalStorage.instance.getUser() != null)
            Container(
              margin: REdgeInsets.symmetric(horizontal: 15),
              height: 60.r,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                children: <Widget>[
                  20.horizontalSpace,
                  Text(
                    '${AppHelpers.getTranslation(TrKeys.balance)}\n${NumberFormat.currency(symbol: LocalStorage.instance.getSelectedCurrency()?.symbol).format(LocalStorage.instance.getWallet()?.price ?? 0)}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      height: 1.2,
                      color: AppColors.white,
                    ),
                  ),
                  10.horizontalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const ProfileDot(isFull: true),
                      4.horizontalSpace,
                      const ProfileDot(isFull: false),
                      4.horizontalSpace,
                      const ProfileDot(isFull: false),
                      4.horizontalSpace,
                      const ProfileDot(isFull: false),
                    ],
                  ),
                  13.horizontalSpace,
                  const Spacer(),
                  Container(
                    height: 46.r,
                    width: 42.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.darkGreen,
                    ),
                    child: Icon(
                      FlutterRemix.store_fill,
                      size: 24.r,
                      color: AppColors.white,
                    ),
                  ),
                  6.horizontalSpace,
                ],
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    30.verticalSpace,
                    if (LocalStorage.instance.getUser() != null)
                      ProfileMenuItem(
                        title:
                            AppHelpers.getTranslation(TrKeys.walletHistories),
                        onClick: () =>
                            context.pushRoute(const WalletHistoriesRoute()),
                        icon: FlutterRemix.wallet_3_fill,
                      ),
                    if (LocalStorage.instance.getUser() != null)
                      ProfileMenuItem(
                        title: AppHelpers.getTranslation(TrKeys.orderHistory),
                        onClick: () =>
                            context.pushRoute(const OrderHistoryRoute()),
                        icon: FlutterRemix.file_list_2_fill,
                        // rightWidget: Container(
                        //   width: 24.r,
                        //   height: 24.r,
                        //   alignment: Alignment.center,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(12.r),
                        //     color: AppColors.warning,
                        //   ),
                        //   child: Text(
                        //     '4',
                        //     style: GoogleFonts.inter(
                        //       fontWeight: FontWeight.w600,
                        //       fontSize: 14.sp,
                        //       letterSpacing: -0.4,
                        //       color: AppColors.white,
                        //     ),
                        //   ),
                        // ),
                      ),
                    if (!widget.fromHome)
                      ProfileMenuItem(
                        title: AppHelpers.getTranslation(TrKeys.likedProducts),
                        onClick: () => context.pushRoute(
                            LikedProductsRoute(shopId: widget.shopId)),
                        icon: FlutterRemix.heart_fill,
                      ),
                    if (!widget.fromHome)
                      ProfileMenuItem(
                        title: AppHelpers.getTranslation(TrKeys.viewedProducts),
                        onClick: () => context.pushRoute(
                          ViewedProductsRoute(shopId: widget.shopId),
                        ),
                        icon: FlutterRemix.eye_fill,
                      ),
                    if (LocalStorage.instance.getUser() != null)
                      ProfileMenuItem(
                        title:
                            AppHelpers.getTranslation(TrKeys.profileSettings),
                        onClick: () async {
                          await context.pushRoute(const ProfileSettingsRoute());
                          setState(() {});
                        },
                        icon: FlutterRemix.user_6_fill,
                        rightWidget: SizedBox(
                          width: 142,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: REdgeInsets.only(bottom: 5),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        '${AppHelpers.getTranslation(TrKeys.completed)} — ',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      letterSpacing: -0.4,
                                      color: AppColors.iconAndTextColor(),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '${AppHelpers.getProfileInfoPercentage()}%',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.sp,
                                          letterSpacing: -0.4,
                                          color: AppColors.iconAndTextColor(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              5.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  ProfileDot(
                                    isFull:
                                        AppHelpers.getProfileInfoPercentage() >
                                            13,
                                    width: 16,
                                    height: 6,
                                    radius: 12,
                                    fillColor: AppColors.black,
                                    notFillColor:
                                        AppColors.gray.withOpacity(0.21),
                                  ),
                                  ProfileDot(
                                    isFull:
                                        AppHelpers.getProfileInfoPercentage() >
                                            27,
                                    width: 16,
                                    height: 6,
                                    radius: 12,
                                    fillColor: AppColors.black,
                                    notFillColor:
                                        AppColors.gray.withOpacity(0.21),
                                  ),
                                  ProfileDot(
                                    isFull:
                                        AppHelpers.getProfileInfoPercentage() >
                                            41,
                                    width: 16,
                                    height: 6,
                                    radius: 12,
                                    fillColor: AppColors.black,
                                    notFillColor:
                                        AppColors.gray.withOpacity(0.21),
                                  ),
                                  ProfileDot(
                                    isFull:
                                        AppHelpers.getProfileInfoPercentage() >
                                            55,
                                    width: 16,
                                    height: 6,
                                    radius: 12,
                                    fillColor: AppColors.black,
                                    notFillColor:
                                        AppColors.gray.withOpacity(0.21),
                                  ),
                                  ProfileDot(
                                    isFull:
                                        AppHelpers.getProfileInfoPercentage() >
                                            69,
                                    width: 16,
                                    height: 6,
                                    radius: 12,
                                    fillColor: AppColors.black,
                                    notFillColor:
                                        AppColors.gray.withOpacity(0.21),
                                  ),
                                  ProfileDot(
                                    isFull:
                                        AppHelpers.getProfileInfoPercentage() >
                                            83,
                                    width: 16,
                                    height: 6,
                                    radius: 12,
                                    fillColor: AppColors.black,
                                    notFillColor:
                                        AppColors.gray.withOpacity(0.21),
                                  ),
                                  ProfileDot(
                                    isFull:
                                        AppHelpers.getProfileInfoPercentage() >
                                            98,
                                    width: 16,
                                    height: 6,
                                    radius: 12,
                                    fillColor: AppColors.black,
                                    notFillColor:
                                        AppColors.gray.withOpacity(0.21),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (LocalStorage.instance.getUser() != null &&
                        LocalStorage.instance.getUser()?.role == 'user')
                      ProfileMenuItem(
                        title: AppHelpers.getTranslation(TrKeys.becomeSeller),
                        onClick: () =>
                            context.pushRoute(const BecomeSellerRoute()),
                        icon: FlutterRemix.store_2_fill,
                      ),
                    ProfileMenuItem(
                      title: AppHelpers.getTranslation(TrKeys.settings),
                      onClick: () => context.pushRoute(const SettingsRoute()),
                      icon: FlutterRemix.settings_4_fill,
                    ),
                    if (LocalStorage.instance.getUser() != null)
                      Consumer(
                        builder: (context, ref, child) {
                          final chatState = ref.watch(chatProvider);
                          return ProfileMenuItem(
                            title: AppHelpers.getTranslation(TrKeys.qa),
                            onClick: () => context.pushRoute(const ChatRoute()),
                            icon: FlutterRemix.message_3_fill,
                            rightWidget: chatState.isLoading
                                ? SizedBox(
                                    height: 20.r,
                                    width: 20.r,
                                    child: CircularProgressIndicator(
                                      color: AppColors.green,
                                      strokeWidth: 2.r,
                                    ),
                                  )
                                : StreamBuilder<QuerySnapshot>(
                                    stream: _fireStore
                                        .collection('messages')
                                        .where('chat_id',
                                            isEqualTo: chatState.chatId)
                                        .where('unread', isEqualTo: true)
                                        .where('sender', isEqualTo: 0)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const SizedBox();
                                      }
                                      final List<DocumentSnapshot> docs =
                                          snapshot.data!.docs;
                                      if (docs.isEmpty) {
                                        return Container();
                                      }
                                      return Container(
                                        margin: REdgeInsets.only(right: 10),
                                        height: 24.r,
                                        width: 24.r,
                                        decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          docs.length.toString(),
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                            letterSpacing: -0.5,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          );
                        },
                      ),
                    ProfileMenuItem(
                      isLast: !(LocalStorage.instance.getUser() != null),
                      title: AppHelpers.getTranslation(
                        LocalStorage.instance.getUser() != null
                            ? TrKeys.logout
                            : TrKeys.login,
                      ),
                      onClick: () {
                        if (LocalStorage.instance.getUser() != null) {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: const LogoutModal(),
                          );
                        } else {
                          context.router.popUntilRoot();
                          context.replaceRoute(const LoginRoute());
                        }
                      },
                      icon: FlutterRemix.logout_circle_r_fill,
                    ),
                    if (LocalStorage.instance.getUser() != null)
                      ProfileMenuItem(
                        isLast: true,
                        title: AppHelpers.getTranslation(TrKeys.deleteAccount),
                        isWarning: true,
                        onClick: () {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: const DeleteUserModal(),
                          );
                        },
                        icon: FlutterRemix.logout_circle_r_fill,
                      ),
                    30.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
