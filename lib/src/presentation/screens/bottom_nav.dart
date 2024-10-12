import 'package:adhoc/exports_main.dart';
import 'package:adhoc/src/presentation/provider/bottom_nav_provider.dart';
import 'package:adhoc/src/presentation/screens/tabs/home_tab.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const IndexedStack(
        children: [
         HomeTab(),
          Center(
            child: Text('Search'),
          ),
          Center(
            child: Text('Profile'),
          ),
        ],
      ),
      bottomNavigationBar: Consumer<BottomNavProvider>(
        builder: (context, state, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            currentIndex: state.currentIndex,
            onTap: (index) {
              state.updateIndex = index;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
