import 'package:auto_route/auto_route.dart';

import '../pages/pages.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CupertinoRoute(path: '/', page: SplashPage),
    CupertinoRoute(path: '/home', page: HomePage),
    CupertinoRoute(path: '/login', page: LoginPage),
    CupertinoRoute(path: '/story', page: StoryPage),
    CupertinoRoute(path: '/income', page: IncomePage),
    CupertinoRoute(path: '/profile', page: ProfilePage),
    CupertinoRoute(path: '/ordersPage', page: OrdersPage),
    CupertinoRoute(path: '/orderHistory', page: OrderHistoryPage),
    CupertinoRoute(path: '/no-connection', page: NoConnectionPage),
    CupertinoRoute(path: '/listNotification', page: ListNotificationPage),
  ],
)
class $AppRouter {}
