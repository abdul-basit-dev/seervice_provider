import 'package:flutter/widgets.dart';
import 'package:handyprovider/screens/add_new_service/add_new_service_screen.dart';
import 'package:handyprovider/screens/add_new_service/components/add_service_images/add_service_images.dart';
import 'package:handyprovider/screens/admin/admin_dashboard/admin_dashboard.dart';
import 'package:handyprovider/screens/admin/admin_manage_service/admin_manage_services.dart';
import 'package:handyprovider/screens/admin/admin_manage_service/admin_update_services/admin_update_services.dart';
import 'package:handyprovider/screens/admin/manage_service_providers/manage_service_providers.dart';
import 'package:handyprovider/screens/admin/manage_service_providers/provider_details/provider_details_screen.dart';
import 'package:handyprovider/screens/admin/manage_services/manage_services_screen.dart';
import 'package:handyprovider/screens/admin/manage_users/manage_users.dart';
import 'package:handyprovider/screens/admin/manage_users/user_details/user_details_screen.dart';

import 'package:handyprovider/screens/home_screen/homescreen.dart';

import 'package:handyprovider/screens/map_location/map_location_screen.dart';
import 'package:handyprovider/screens/offers_detail/offers_detail_screen.dart';

import 'package:handyprovider/screens/profile/components/edit_profile/edit_profile_screen.dart';
import 'package:handyprovider/screens/profile/profile_screen.dart';
import 'package:handyprovider/screens/sign_up/choose_tracking_id/choose_tracking_id_screen.dart';

import 'package:handyprovider/screens/splash/splash_screen.dart';
import 'package:handyprovider/screens/sign_in/sign_in_screen.dart';

import 'package:handyprovider/screens/forgot_password/forgot_password_screen.dart';
import 'package:handyprovider/screens/location_permission/location_permission_screen.dart';
import 'package:handyprovider/screens/otp/otp_screen.dart';
import 'package:handyprovider/screens/sign_up/sign_up_screen.dart';
import 'package:handyprovider/screens/view_offers/view_offers_screen.dart';
import 'package:handyprovider/screens/view_services/view_booking_screen.dart';

import 'screens/admin/add_services/add_services_sccreen.dart';
import 'screens/view_services_details/view_services_details.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LocationPermissionScreen.routeName: (context) =>
      const LocationPermissionScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  MapScreen.routeName: (context) => const MapScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  EditProfileScreen.routeName: (context) => const EditProfileScreen(),
  ChooseTrackingID.routeName: (context) => const ChooseTrackingID(
      name: '', email: '', gender: '', mobile: '', cnic: '', password: ''),
  AddNewServiceScreen.routeName: (context) => const AddNewServiceScreen(),
  AddServiceImages.routeName: (context) => const AddServiceImages(
        title: '',
        description: '',
        note: '',
        adress: '',
        speciality: '',
        rate: '',
        sub_cat: '',
      ),
  ViewServicesScreen.routeName: (context) => const ViewServicesScreen(),
  ServiceDetailScreen.routeName: (context) => const ServiceDetailScreen(
        id: '',
        title: '',
        speciality: '',
        description: '',
        note: '',
        adress: '',
        rate: '',
        status: '',
        spName: '',
        spId: '',
        serviceImages: '',
        serviceImages1: '',
        serviceImages2: '',
      ),
  ViewOffersScreen.routeName: (context) => const ViewOffersScreen(),
  OffersDetails.routeName: (context) => const OffersDetails(
        id: '',
        uid: '',
        serviceName: '',
        b_date: '',
        b_time: '',
        b_hours: '',
        b_price: '',
        booking_status: '',
      ),
  //admin
  AdminManageScreen.routeName: (context) => const AdminManageScreen(),
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
      const AdminManageServicesScreen(),
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
      ),
};
