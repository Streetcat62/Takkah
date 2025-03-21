import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/models/models.dart';
import '../../infrastructure/services/services.dart';

class OrderNotifier extends StateNotifier<OrderState> {
  final OrdersRepository _orderRepository;
  final UserRepository _userRepository;
  int _historyOrder = 1;
  int _availableOrderPage = 1;
  int _activeOrdersPage = 0;
  bool _hasMoreActiveOrders = true;

  OrderNotifier(this._orderRepository, this._userRepository)
      : super(const OrderState());

  Future<void> updateToOnAWay(
    BuildContext context,
    int? orderId, {
    ValueSetter<OrderDetailData?>? success,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isApproveLoading: true);
      final response =
          await _userRepository.updateOrder(orderId ?? 0, 'on_a_way');
      response.when(
        success: (data) {
          state = state.copyWith(isApproveLoading: false);
          success?.call(data.data);
        },
        failure: (failure, status) {
          state = state.copyWith(isApproveLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> refreshActiveOrders(
    BuildContext context, {
    RefreshController? controller,
    VoidCallback? emptyActiveOrders,
    Function(OrderDetailData)? setNextActiveOrder,
  }) async {
    if (await AppConnectivity.connectivity()) {
      final response = await _orderRepository.getActiveOrders(1);
      response.when(
        success: (data) {
          _activeOrdersPage = 1;
          final List<OrderDetailData> orders = data.data ?? [];
          state = state.copyWith(
            activeOrders: orders,
            totalActiveOrder: data.orderCount ?? 0,
          );
          _hasMoreActiveOrders = orders.length >= 10;
          controller?.refreshCompleted();
          if (orders.isNotEmpty) {
            if (setNextActiveOrder != null) {
              setNextActiveOrder(orders.first);
            }
          }
        },
        failure: (failure, status) {
          controller?.refreshFailed();
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchMoreActiveOrdersPage(
    BuildContext context,
    RefreshController controller,
  ) async {
    if (!_hasMoreActiveOrders) {
      controller.loadNoData();
      return;
    }
    if (await AppConnectivity.connectivity()) {
      final response =
          await _orderRepository.getActiveOrders(++_activeOrdersPage);
      response.when(
        success: (data) {
          List<OrderDetailData> orders = List.from(state.activeOrders);
          final List<OrderDetailData> newOrders = data.data ?? [];
          orders.addAll(newOrders);
          state = state.copyWith(activeOrders: orders);
          _hasMoreActiveOrders = newOrders.length >= 10;
          controller.loadComplete();
        },
        failure: (failure, status) {
          _activeOrdersPage--;
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> initialFetchActiveOrders(
    BuildContext context, {
    ValueSetter<OrderDetailData>? setActiveOrder,
  }) async {
    if (state.activeOrders.isNotEmpty) {
      return;
    }
    state = state.copyWith(isActiveLoading: true);
    final response =
        await _orderRepository.getActiveOrders(1);
    response.when(
      success: (data) {
        final List<OrderDetailData> orders = data.data ?? [];
        state = state.copyWith(
          activeOrders: orders,
          totalActiveOrder: data.orderCount ?? 0,
          isActiveLoading: false,
        );
        if (orders.isNotEmpty) {
          setActiveOrder?.call(orders.first);
        }
        _hasMoreActiveOrders = orders.length >= 10;
      },
      failure: (fail, status) {
        _activeOrdersPage--;
        state = state.copyWith(isActiveLoading: false);
        AppHelpers.showCheckTopSnackBar(
          context,
          AppHelpers.getTranslation(status.toString()),
        );
        debugPrint('==> get active orders fail: $fail');
      },
    );
  }

  void changeDeliveryType(int index) {
    state = state.copyWith(deliveryType: index);
  }

  void changeDeliveryTime(int index) {
    state = state.copyWith(deliveryTime: index);
  }

  void changePaymentType(bool isActive) {
    state = state.copyWith(paymentType: isActive);
  }

  Future<void> showOrder(BuildContext context, int orderId) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _orderRepository.showOrders(orderId);
      response.when(
        success: (data) {
          state = state.copyWith(order: data.data, isLoading: false);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
          debugPrint('==> get order failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> setCurrentOrder(
    BuildContext context,
    int orderId,
    VoidCallback onSuccess,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      List<OrderDetailData> list = List.from(state.activeOrders);
      List<OrderDetailData> newList = list.map((element) {
        if (element.id == orderId) {
          element.current = true;
        } else {
          element.current = false;
        }
        return element;
      }).toList();
      state = state.copyWith(activeOrders: newList);
      final response = await _orderRepository.setCurrentOrder(orderId);

      response.when(
        success: (data) {
          onSuccess();
        },
        failure: (failure, status) {
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
          debugPrint('==> get set current order failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchAvailableOrders(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        availableOrders: [],
        isAvailableLoading: true,
      );
      final response = await _orderRepository.getAvailableOrders(1);
      response.when(
        success: (data) {
          state = state.copyWith(
            availableOrders: data,
            isAvailableLoading: false,
          );
        },
        failure: (failure, status) {
          state = state.copyWith(isAvailableLoading: true);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
          debugPrint('==> get history orders failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchAvailableOrdersPage(
      BuildContext context, RefreshController controller,
      {bool isRefresh = false}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (isRefresh) {
        _availableOrderPage = 1;
      }
      final response = await _orderRepository
          .getAvailableOrders(isRefresh ? 1 : ++_availableOrderPage);
      response.when(
        success: (data) {
          if (isRefresh) {
            state = state.copyWith(
              availableOrders: data,
            );
            controller.refreshCompleted();
          } else {
            if (data.isNotEmpty) {
              List<OrderDetailData> list = List.from(state.availableOrders);
              list.addAll(data);
              state = state.copyWith(
                availableOrders: list,
              );
              controller.loadComplete();
            } else {
              _availableOrderPage--;
              controller.loadNoData();
            }
          }
        },
        failure: (failure, status) {
          if (!isRefresh) {
            _availableOrderPage--;
            controller.loadFailed();
          } else {
            controller.refreshFailed();
          }
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchHistoryOrders(BuildContext context,
      {DateTime? start, DateTime? end}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        historyOrders: [],
        isHistoryLoading: true,
      );
      final response =
          await _orderRepository.getHistoryOrders(1, start: start, end: end);
      response.when(
        success: (data) {
          state = state.copyWith(
            historyOrders: data,
            isHistoryLoading: false,
          );
        },
        failure: (failure, status) {
          state = state.copyWith(isHistoryLoading: true);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
          debugPrint('==> get history orders failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchHistoryOrdersPage(
      BuildContext context, RefreshController controller,
      {bool isRefresh = false}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (isRefresh) {
        _historyOrder = 1;
      }
      final response = await _orderRepository
          .getHistoryOrders(isRefresh ? 1 : ++_historyOrder);
      response.when(
        success: (data) {
          if (isRefresh) {
            state = state.copyWith(
              historyOrders: data,
            );
            controller.refreshCompleted();
          } else {
            if (data.isNotEmpty) {
              List<OrderDetailData> list = List.from(state.historyOrders);
              list.addAll(data);
              state = state.copyWith(
                historyOrders: list,
              );
              controller.loadComplete();
            } else {
              _historyOrder--;
              controller.loadNoData();
            }
          }
        },
        failure: (failure, status) {
          if (!isRefresh) {
            _historyOrder--;
            controller.loadFailed();
          } else {
            controller.refreshFailed();
          }
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
