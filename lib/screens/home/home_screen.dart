import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reach_out_rural/constants/constants.dart';
import 'package:reach_out_rural/screens/chatbot/chat_bot_screen.dart';
import 'package:reach_out_rural/screens/community/community_screen.dart';
import 'package:reach_out_rural/screens/dashboard/dashboard_screen.dart';
import 'package:reach_out_rural/screens/prescription/prescription_screen.dart';
import 'package:reach_out_rural/screens/scanner/scanner_screen.dart';
import 'package:reach_out_rural/screens/schedule/schedule_screen.dart';
import 'package:reach_out_rural/utils/size_config.dart';
import 'package:reach_out_rural/widgets/custom_bottom_navbar.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:reach_out_rural/repository/api/api_repository.dart';

const List<Widget> _screens = <Widget>[
  ScheduleScreen(),
  ChatBotScreen(),
  ScannerScreen(),
  CommunityScreen()
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isListening = false;
  late SpeechToText _speechToText;

  @override
  void initState() {
    super.initState();
    _speechToText = SpeechToText();
  }

  Future<void> _captureVoice() async {
    if (!_isListening) {
      bool available = await _speechToText.initialize();
      if (available) {
        setState(() {
          _isListening = true;
        });
        await _speechToText.listen(onResult: _onSpeechResult);
      }
    } else {
      setState(() {
        _isListening = false;
      });
      await _speechToText.stop();
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) async {
    final command = result.recognizedWords.toLowerCase();
    final authRepository = ApiRepository();
    // final SharedPreferencesHelper prefs = SharedPreferencesHelper();
    log(command);
    final data =
        await authRepository.checkNavigation({"query": command, "lang": "en"});

    final category = data["category"];

    if (!mounted) return;
    // log(command);

    if (category == "book_appointment") {
      setState(() {
        _currentIndex = 0; // Navigate to DashboardScreen
      });
    } else if (category == 'medibot') {
      setState(() {
        _currentIndex = 1; // Navigate to ChatBotScreen
      });
    } else if (category == 'mediscanner') {
      setState(() {
        _currentIndex = 2; // Navigate to ScannerScreen
      });
    } else if (category == 'upload_prescription') {
      setState(() {
        _currentIndex = 3; // Navigate to PrescriptionScreen
      });
    }
  }

  void _onPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _speechToText.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavbar(
        isListening: _isListening,
        currentIndex: _currentIndex,
        onPressed: _onPressed,
        onCaptureVoice: _captureVoice,
      ),
    );
  }
}
