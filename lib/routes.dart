import 'package:flutter/widgets.dart';

import 'package:handyprovider/screens/admin/admin_dashboard/admin_dashboard.dart';
import 'package:handyprovider/screens/admin/admin_manage_service/admin_manage_services.dart';
import 'package:handyprovider/screens/admin/admin_manage_service/admin_update_services/admin_update_services.dart';
import 'package:handyprovider/screens/admin/manage_service_providers/manage_service_providers.dart';
import 'package:handyprovider/screens/admin/manage_service_providers/provider_details/provider_details_screen.dart';

import 'package:handyprovider/screens/admin/manage_users/manage_users.dart';
import 'package:handyprovider/screens/admin/manage_users/user_details/user_details_screen.dart';
import 'package:handyprovider/screens/admin/search_screen/search_screen.dart';
import 'package:handyprovider/screens/offers_detail/offers_detail_screen.dart';

import 'package:handyprovider/screens/splash/splash_screen.dart';
import 'package:handyprovider/screens/sign_in/sign_in_screen.dart';
import 'package:handyprovider/screens/view_bookings/view_bookings_screen.dart';

import 'screens/admin/add_services/add_services_sccreen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SearchScreen.routeName: (context) => const SearchScreen(),
  ViewAllBookingsScreen.routeName: (context) =>
      const ViewAllBookingsScreen(userid: ''),
  OffersDetails.routeName: (context) => const OffersDetails(
        id: '',
        uid: '',
        serviceName: '',
        b_date: '',
        b_time: '',
        b_hours: '',
        b_price: '',
        booking_status: '',
        user_booking_status: '',
      ),

  //admin

  AdminViewAllUsers.routeName: (context) => const AdminViewAllUsers(),
  ProviderDetailsScreen.routeName: (context) => const ProviderDetailsScreen(
        name: '',
        id: '',
        email: '',
        cnic: '',
        contact: '',
        adress: '',
        gender: '',
        status: '',
        image: '',
        img: '',
        p_token: '',
      ),
  UserDetailsScreen.routeName: (context) => const UserDetailsScreen(
        name: '',
        id: '',
        email: '',
        contact: '',
        adress: '',
        gender: '',
        status: '',
        image: '',
      ),
  ManageServiceProviderScreen.routeName: (context) =>
      const ManageServiceProviderScreen(),
  AdminAddServicesScreen.routeName: (context) => const AdminAddServicesScreen(),
  AdminDashBoard.routeName: (context) => const AdminDashBoard(),
  AdminManageServicesScreen.routeName: (context) =>
      const AdminManageServicesScreen(serviceName: ''),
  AdminUpdateServicesScreen.routeName: (context) =>
      const AdminUpdateServicesScreen(
        sub3: '',
        serviceName: '',
        sub1: '',
        sub2: '',
        sub4: '',
        sub5: '',
        cat_status: '',
        id: '',
        image: '',
        servicepriceMax: '',
        servicepriceMin: '',
      ),
};
