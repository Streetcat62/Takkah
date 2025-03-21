import 'package:auto_route/auto_route.dart';
import 'package:venderfoodyman/presentation/pages/main/create_order/shipping/widgets/select_address_page.dart';
import 'package:venderfoodyman/presentation/pages/main/foods/widgets/sub_category_products.dart';

import '../pages/generate_image/generate_image_page.dart';
import '../pages/main/create_order/shipping/widgets/sub_categories_page.dart';
import '../pages/pages.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CupertinoRoute(path: '/', page: SplashPage),
    CupertinoRoute(path: '/main', page: MainPage),
    CupertinoRoute(path: '/login', page: LoginPage),
    CupertinoRoute(path: '/order', page: OrderPage),
    CupertinoRoute(path: '/income', page: IncomePage),
    CupertinoRoute(path: '/select-user', page: SelectUserPage),
    CupertinoRoute(path: '/sub-category-products', page: SubCategoryProductsPage),
    CupertinoRoute(path: '/sub-category-orders-products', page: SubCategoryProductsOrderPage),
    CupertinoRoute(path: '/select-address-from-list', page: SelectAddressFromListPage),
    CupertinoRoute(path: '/delivery-time', page: DeliveryTimePage),
    CupertinoRoute(path: '/order-history', page: OrderHistoryPage),
    CupertinoRoute(path: '/delivery-zone', page: DeliveryZonePage),
    CupertinoRoute(path: '/no-connection', page: NoConnectionPage),
    CupertinoRoute(path: '/select-address', page: SelectAddressPage),
    CupertinoRoute(path: '/order-products', page: CreateOrderPage),
    CupertinoRoute(path: '/shipping-address', page: ShippingAddressPage),
    CupertinoRoute(path: '/list-notification', page: ListNotificationPage),
    CupertinoRoute(path: '/generate_image', page: GenerateImagePage)
  ],
)
class $AppRouter {}
