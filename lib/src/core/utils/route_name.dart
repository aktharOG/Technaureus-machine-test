import 'package:flutter/material.dart';

class RouteName {
  static const String home = '/';
  static const String login = 'login';
  static const String otpVerify = '/otp';
  static const String register = '/register';
  static const String latestOffers = '/latest_offers';
  static const String latestOfferDetails = '/latest_offer_details';
  static const String pdfView = '/pdf_view';
  static const String highlights = '/highlights';
  static const String qrCode = '/qrcode';
  static const String createVoucher = '/create_voucher';
  static const String billingDetails = '/billing_details';
  static const String editProfile = '/edit_profile';
  static const String about = '/about';
  static const String privacyPolicy = '/privacy_policy';
  static const String tnc = '/tnc';
  static const String contactAndSupport = '/contact_and_support';
}

final _navKey = GlobalKey<NavigatorState>();

GlobalKey<NavigatorState> get navKey => _navKey;

NavigatorState? get navigator => _navKey.currentState;

final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

GlobalKey<ScaffoldMessengerState> get scaffoldKey => _scaffoldMessengerKey;

ScaffoldMessengerState? get snackkey => _scaffoldMessengerKey.currentState;
