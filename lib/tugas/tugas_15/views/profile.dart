import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/database/preference.dart';
import 'package:flutter_andhika_1/extension/navigator.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/api/get_user.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/models/get_user.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/views/edit_profile.dart';
import 'package:flutter_andhika_1/tugas/tugas_15/views/login.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  GetUserModel? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      String? token = await PrefsHandler.getToken();
      debugPrint("TOKEN DI PROFILE: $token");

      if (token != null && token.isNotEmpty) {
        GetUserModel? data = await getUser();

        debugPrint("HASIL GET USER: $data");

        if (!mounted) return;
        setState(() {
          _user = data;
          _isLoading = false;
        });
      } else {
        debugPrint("TOKEN NULL / KOSONG");

        if (!mounted) return;
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("ERROR FETCH USER DATA: $e");

      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Refetch user data after edit
  Future<void> _refreshUser() async {
    setState(() {
      _isLoading = true;
    });
    await _fetchUserData();
  }

  void _logoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await PrefsHandler.deleteToken();

                if (!mounted) return;

                context.pop();

                context.pushAndRemoveAll(const LoginUserT15());
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _user == null
            ? const Center(child: Text("No user data found"))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FadeIn(
                  child: RefreshIndicator(
                    onRefresh: _refreshUser,
                    child: ListView(
                      children: [
                        const SizedBox(height: 20),

                        /// USER CARD
                        ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.person_2),
                          ),
                          title: Text(
                            _user?.data?.name ?? "No Name",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(_user?.data?.email ?? "No Email"),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// MENU CARD
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              /// EDIT PROFILE
                              Material(
                                color: Colors.transparent,
                                child: ListTile(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  leading: const Icon(Icons.person_2),
                                  dense: true,
                                  title: const Text('Edit Profile'),
                                  subtitle: const Text(
                                    'Change profile picture, email',
                                  ),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () async {
                                    final refresh = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const EditProfileT15(),
                                      ),
                                    );

                                    if (refresh == 'refresh') {
                                      _refreshUser();
                                    }
                                  },
                                ),
                              ),

                              /// CHANGE PASSWORD
                              Material(
                                color: Colors.transparent,
                                child: ListTile(
                                  dense: true,
                                  leading: const Icon(Icons.lock),
                                  title: const Text('Change Password'),
                                  subtitle: const Text(
                                    'Update your account security',
                                  ),
                                  trailing: const Icon(Icons.chevron_right),
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Change Password belum dibuat",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              /// LOG OUT
                              Material(
                                color: Colors.transparent,
                                child: ListTile(
                                  dense: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(20),
                                    ),
                                  ),
                                  title: const Text(
                                    'Log Out',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  leading: const Icon(
                                    Icons.logout,
                                    color: Colors.red,
                                  ),
                                  subtitle: const Text(
                                    'Securely log out your account',
                                  ),
                                  onTap: _logoutDialog,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
