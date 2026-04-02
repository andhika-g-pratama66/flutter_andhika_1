import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/constants/button_style.dart';
import 'package:flutter_andhika_1/constants/form_decoration.dart';
import 'package:flutter_andhika_1/database/preference.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/api/edit_profile_api.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/api/get_user.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/models/get_user.dart';

class EditProfileT15 extends StatefulWidget {
  const EditProfileT15({super.key});

  @override
  State<EditProfileT15> createState() => _EditProfileT15State();
}

class _EditProfileT15State extends State<EditProfileT15> {
  final _nameController = TextEditingController();

  GetUserModel? _user;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _isLoading = false;
  }

  Future<void> _fetchUserData() async {
    try {
      String? token = await PrefsHandler.getToken();
      if (token == null) return;

      GetUserModel? data = await getUser();

      if (mounted && data != null) {
        setState(() {
          _user = data;
          _nameController.text = data.data!.name ?? '';
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error fetching user: $e");
      setState(() => _isLoading = false);
    }
  }

  Future<void> _handleSave() async {
    setState(() => _isLoading = true);

    try {
      String? token = await PrefsHandler.getToken();
      if (token == null) {
        throw Exception("Token not found");
      }

      // Fix 5: Pass name and email as individual fields to updateUser()
      final result = await updateUser(name: _nameController.text.trim());
      bool success = result != null;
      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile updated successfully!')),
          );
          Navigator.pop(context, 'refresh');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to update profile.')),
          );
        }
      }
    } catch (e) {
      debugPrint("Error saving user: $e");
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('An error occurred: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: FadeInRight(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                child: Icon(Icons.person, size: 70),
              ),
              const SizedBox(height: 30),

              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: formInputConstant(labelText: 'Full Name'),
              ),
              const SizedBox(height: 20),

              // Gender Dropdown
              const SizedBox(height: 40),
              ElevatedButton(
                style: AppButtonStyles.defaultButton(),
                onPressed: () async {
                  await _handleSave();
                },
                child: const Text("Save Changes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
