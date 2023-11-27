import 'package:flutter/material.dart';
import 'package:shafinbd/config/myStyle.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Text(
              'মোবাইল আর ডেস্কটপের নানান প্ল্যাটফর্মের জন্যে একইসাথে অ্যাপ ডেভেলপ করতে চাচ্ছেন? প্রায় সব প্ল্যাটফর্মের জন্যেই আলদা আলাদা অ্যাপ ডেভেলপ করতে চাইলে সময় তো লাগবেই, তাছাড়া এফোর্টও দিতে হবে বেশি। কিন্তু কেমন হতো যদি, একই সময়ে একই কোডবেস ইউজ করে দুইটার বেশি প্ল্যাটফর্মের জন্যে অ্যাপ ডেভেলপ করা যাচ্ছে, তাও মিনিমাল এফোর্ট দিয়ে? ঠিক এই কাজটাই পসিবল হয়ে উঠছে ডার্ট প্রোগ্রামিং ল্যাঙ্গুয়েজের ফ্লাটার ফ্রেমওয়ার্ক দিয়ে। ',
              style: myStyle.detailText16,
            ),
          ],
        ),
      ),
    ));
  }
}
