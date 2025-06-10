import 'package:flutter/material.dart';
import 'components/navbarbutton.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int currentTab = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // Back button + profile header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF9ABD40),
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Profile picture
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/cat.png',
                    ), // Ganti gambar kamu
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF9ABD40),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Nama dan kontak
            const Text(
              "Alomani",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "087778899444",
              style: TextStyle(color: Color(0xFF9ABD40)),
            ),
            const Text(
              "alomani@gmail.com",
              style: TextStyle(color: Colors.white54),
            ),

            const SizedBox(height: 24),

            // Options
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListView(
                  children: [
                    _buildOption(Icons.history, "Menu History"),
                    _buildOption(Icons.help_outline, "Help Center"),
                    _buildOption(Icons.language, "Change Language"),
                    _buildOption(Icons.location_on_outlined, "Saved Addresses"),
                    _buildOption(Icons.settings, "Preferences"),
                    _buildOption(Icons.security, "Account Safety"),
                    _buildOption(Icons.manage_accounts, "Manage Accounts"),
                    _buildOption(Icons.privacy_tip_outlined, "Privacy Policy"),
                    _buildOption(
                      Icons.description_outlined,
                      "Term of Services",
                    ),
                    _buildOption(Icons.layers_outlined, "App Version"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: currentTab),
    );
  }

  Widget _buildOption(IconData icon, String label) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
      onTap: () {
        // TODO: Implement navigation or modal
      },
    );
  }
}
