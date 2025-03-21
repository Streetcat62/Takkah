import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../infrastructure/models/data/order_data.dart';
import 'ready_orders_state.dart';
import '../../../../domain/interface/interfaces.dart';
import '../../../../infrastructure/services/services.dart';

class ReadyOrdersNotifier extends StateNotifier<ReadyOrdersState> {
  final OrdersRepository _ordersRepository;
  int _page = 0;
  bool _hasMore = true;

  ReadyOrdersNotifier(this._ordersRepository) : super(const ReadyOrdersState());

  Future<void> fetchReadyOrders({
    RefreshController? refreshController,
    bool isRefresh = false,
    Function(int)? updateTotal,
  }) async {
    if (isRefresh) {
      _page = 0;
      _hasMore = true;
      refreshController?.requestRefresh();
    }
    if (!_hasMore) {
      refreshController?.loadNoData();
      return;
    }
    if (_page == 0 && !isRefresh) {
      state = state.copyWith(isLoading: true);
    }
    final response = await _ordersRepository.getOrders(
      status: OrderStatus.ready,
      page: ++_page,
    );
    response.when(
      success: (data) {
        List<OrderData> orders = isRefresh ? [] : List.from(state.orders);
        final List<OrderData> newOrders = data.data?.orders ?? [];
        orders.addAll(newOrders);
        _hasMore = newOrders.length >= 10;
        if (_page == 1 && !isRefresh) {
          state = state.copyWith(
            isLoading: false,
            orders: orders,
            totalCount: data.data?.statistic?.readyOrdersCount ?? 0,
          );
          updateTotal?.call(data.data?.statistic?.readyOrdersCount ?? 0);
        } else {
          state = state.copyWith(
            orders: orders,
            totalCount: data.data?.statistic?.readyOrdersCount ?? 0,
          );
          updateTotal?.call(data.data?.statistic?.readyOrdersCount ?? 0);
        }
        if (isRefresh) {
          refreshController?.refreshCompleted();
        } else {
          refreshController?.loadComplete();
        }
      },
      failure: (failure, status) {
        _page--;
        if (_page == 0) {
          state = state.copyWith(isLoading: false);
        }
        if (isRefresh) {
          refreshController?.refreshFailed();
        } else {
          refreshController?.loadFailed();
        }
      },
    );
  }
}
