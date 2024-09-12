import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reach_out_rural/constants/constants.dart';
import 'package:reach_out_rural/widgets/default_icon_button.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  Future<File?> _pickPrescription() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      // User canceled the picker
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: const Text('My Prescriptions'),
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/prescription.svg",
                width: 175,
                height: 195,
              ),
              const SizedBox(height: 10),

              // Old Prescriptions List
              const Text(
                'Upload Prescription',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Upload button
              DefaultIconButton(
                  width: 350,
                  height: 70,
                  fontSize: 20,
                  text: 'Upload Prescription',
                  icon: Iconsax.document_upload,
                  press: () async {
                    File? prescription = await _pickPrescription();
                    if (prescription != null) {
                      String fileUrl = prescription.path;
                      // ignore: use_build_context_synchronously
                      context.go('/prescription/view?fileUrl=$fileUrl');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
