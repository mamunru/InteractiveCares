import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
          'order_success':
              '@name ,Your Order ( @order) was created Successfully ',
          'login_text': 'Login Here',
          'login': 'Login',
          'registration': 'Registration',
          'personal_info': 'Personal Information',
          'change_pass': 'Change Password',
          'language': 'Language',
          'certificates': 'Certificates',
          'books': 'Books',
          'payment': 'Payment & Order History',
          'blog': 'Blog',
          'store': 'Book Store',
          'hotline': 'HotLine @number',
          'report': 'Report',
          'terms': 'Terms & Conditions',
          'logout': 'Logout',
        },
        'bn_BD': {
          'hello': 'হেলো ওয়ার্ড',
          'order_success':
              '@name ,আপনার অর্ডার ( @order) সফলভাবে তৈরি করা হয়েছে ',
          'login_text': 'এখানে লগইন করুন',
          'login': 'লগইন',
          'registration': 'রেজিস্ট্রেশন',
          'personal_info': 'ব্যক্তিগত তথ্য',
          'change_pass': 'পাসওয়ার্ড পরিবর্তন',
          'language': 'ভাষা',
          'certificates': 'সার্টিফিকেট',
          'books': 'বই',
          'payment': 'পেমেন্ট এবং অর্ডার ইতিহাস',
          'blog': 'ব্লগ',
          'store': 'বইয়ের দোকান',
          'hotline': 'হটলাইন @number',
          'report': 'রিপোর্ট',
          'terms': 'শর্তাবলী',
          'logout': 'Logout'
        }
      };
}
