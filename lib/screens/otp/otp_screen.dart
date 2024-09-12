import 'package:flutter/material.dart';
import 'package:reach_out_rural/constants/constants.dart';
import 'package:reach_out_rural/screens/otp/otp_form.dart';
import 'package:reach_out_rural/utils/size_config.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text("OTP Verification"),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.getProportionateTextSize(20)),
            iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color)),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(60)),
                    Text.rich(
                      TextSpan(
                        text: "We sent your code to ",
                        children: [
                          TextSpan(
                            text: "+91$phoneNumber",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    buildTimer(),
                    const OtpForm(),
                    SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(30)),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Resend OTP Code",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expire in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 00.0),
          duration: const Duration(seconds: 60),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: kprimaryColor),
          ),
        ),
      ],
    );
  }
}
