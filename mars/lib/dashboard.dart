import 'package:flutter/material.dart';

class BelajarRow extends StatelessWidget {
  final String username;

  const BelajarRow({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            _showLogoutConfirmation(context);
          },
        ),
        title: Text("Dashboard"),
        actions: [Icon(Icons.search), Icon(Icons.settings)],
        backgroundColor: Color.fromARGB(255, 156, 77, 170),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Selamat Datang, $username",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIconButton(Icons.accessibility_new_rounded, context),
              _buildIconButton(Icons.access_alarm_rounded, context),
              _buildIconButton(Icons.add, context),
              _buildIconButton(Icons.edit, context),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIconButton(Icons.access_time, context),
              _buildIconButton(Icons.attach_money, context),
              _buildIconButton(Icons.favorite, context),
              _buildIconButton(Icons.movie, context),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 158, 86, 171),
        unselectedItemColor: Color.fromARGB(255, 158, 86, 171),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Tombol diKlik"),
              content: Text("Kamu nge klik Tombol ${_getIconName(icon)}"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 164, 73, 180),
          shape: BoxShape.circle,
        ),
        child: Icon(icon),
      ),
    );
  }

  String _getIconName(IconData icon) {
    if (icon == Icons.accessibility_new_rounded) {
      return "Accessibility";
    } else if (icon == Icons.access_alarm_rounded) {
      return "Alarm";
    } else if (icon == Icons.add) {
      return "Add";
    } else if (icon == Icons.edit) {
      return "Edit";
    } else if (icon == Icons.access_time) {
      return "Time";
    } else if (icon == Icons.attach_money) {
      return "Money";
    } else if (icon == Icons.favorite) {
      return "Favorite";
    } else if (icon == Icons.movie) {
      return "Movie";
    }
    return "";
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Logout"),
          content: Text("Anda yakin ingin logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                // Hapus token, nntidisini
                Navigator.of(context).pop(); // Tutup dialog
                //Kembali ke halaman sebelumnya
                Navigator.pop(context);
              },
              child: Text("Ya"),
            ),
          ],
        );
      },
    );
  }
}