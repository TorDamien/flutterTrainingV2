import '../commons.dart';

class GlobalLeftDrawer extends StatelessWidget {

  const GlobalLeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            customDrawerHeader(context),
            customDrawerMenuItems(context),
          ],
        ),
      )
    );
  }

  Widget customDrawerHeader(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserScreen(),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.only(
          top: 30 + MediaQuery.of(context).padding.top,
          bottom: 20,
          ),
          child: const Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/icons/pepe-the-frog.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Pepe the Frog',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }

  Widget customDrawerMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: Wrap(
        spacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}



