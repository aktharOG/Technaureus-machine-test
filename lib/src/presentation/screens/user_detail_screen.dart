import 'package:adhoc/exports_main.dart';
import 'package:adhoc/src/core/constants/app_images.dart';
import 'package:adhoc/src/presentation/widgets/app_space_widget.dart';
import 'package:adhoc/src/presentation/widgets/custom_text.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: 'user-profile',
                      child: Image.asset(
                        AppImages.img1,
                        height: 400,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),

                    // back button and star

                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.3),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black.withOpacity(0.3),
                            child: const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // user deatls

                setHeight(40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        name: "Davis Baptista",
                        fontweight: FontWeight.bold,
                        fontsize: 18,
                      ),
                      const CustomText(
                        name: "Software Engineer,",
                        color: Colors.grey,
                        fontsize: 13,
                      ),
                      setHeight(30),
                      const CustomText(name: "About"),
                      const Divider(
                        color: AppColors.primary,
                        height: 2,
                        thickness: 2,
                        endIndent: 306,
                      ),
                      setHeight(10),
                      CustomText(
                        name: dummmyTxt,
                        maxlines: 100,
                      ),
                      setHeight(10),
                      const CustomText(name: "Hobbies and interests"),
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Chip(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: AppColors.chipRed,
                              label: CustomText(name: "Music"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final String dummmyTxt =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
}
