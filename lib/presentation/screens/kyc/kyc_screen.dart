import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/custom_button.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  final _nameController = TextEditingController();
  final _aadhaarController = TextEditingController();
  final _panController = TextEditingController();

  Map<String, File?> uploadedFiles = {
    'aadhaarFront': null,
    'aadhaarBack': null,
    'panCard': null,
    'drivingLicence': null,
  };

  Future<void> _pickFile(String key) async {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text("Upload JPG/PNG"),
            onTap: () async {
              final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (picked != null) {
                setState(() {
                  uploadedFiles[key] = File(picked.path);
                });
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: const Text("Upload PDF"),
            onTap: () async {
              final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
              if (result != null && result.files.single.path != null) {
                setState(() {
                  uploadedFiles[key] = File(result.files.single.path!);
                });
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUploadBox(String label, String key) {
    return InkWell(
      onTap: () => _pickFile(key),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 24,
        height: 143,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: uploadedFiles[key] != null
            ? uploadedFiles[key]!.path.endsWith('.pdf')
            ? const Center(child: Icon(Icons.picture_as_pdf, size: 40, color: Colors.white))
            : ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(uploadedFiles[key]!, fit: BoxFit.cover),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(CupertinoIcons.camera, color: Colors.white, size: 40),
            const SizedBox(height: 15),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("KYC",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.left_chevron,size: 30,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          _buildTextField("Full Name", _nameController),
          const SizedBox(height: 12),
          _buildTextField("UIDAI NO. (Adhaar Card)", _aadhaarController),
          const SizedBox(height: 12),
          _buildTextField("Pan Card No.", _panController),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildUploadBox("Upload Aadhaar Front", 'aadhaarFront'),
              _buildUploadBox("Upload Aadhaar Back", 'aadhaarBack'),
              _buildUploadBox("Upload PAN Card", 'panCard'),
              _buildUploadBox("Upload Driving Licence", 'drivingLicence'),
            ],
          ),
          const SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => QrApxBuyScreen(),));
            },
            label: "Submit KYC",
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextField(
      cursorColor: Colors.white,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
