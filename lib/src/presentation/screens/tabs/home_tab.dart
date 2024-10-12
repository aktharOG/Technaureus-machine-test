import 'package:adhoc/exports_main.dart';
import 'package:adhoc/src/core/constants/app_images.dart';
import 'package:adhoc/src/presentation/widgets/app_space_widget.dart';
import 'package:adhoc/src/presentation/widgets/custom_button.dart';
import 'package:adhoc/src/presentation/widgets/custom_text.dart';
import 'package:adhoc/src/presentation/widgets/custom_text_field.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // appbar
          SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Image.asset(
              AppImages.logo,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ],
          ),

          // body

          // header

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  const Row(
                    children: [
                      CustomText(name: "Interact With Your"),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(name: "Happiness !"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    height: 40,
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(30),
                    leading: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    controller: TextEditingController(),
                    name: "Search for partner",
                  ),
                ],
              ),
            ),
          ),

          // new

          const SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(name: "New Matches"),
                        CustomText(
                          name: "See all",
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),

                  // horizonatal list view

                  CustomHorizontalWidget(slug: "newmatches",),
                ],
              ),
            ),
          ),

          // suggested

          const SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(name: "Suggested Posts"),
                        CustomText(
                          name: "See all",
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),

                  // horizonatal list view

                  CustomHorizontalWidget(slug: "suggested",),
                ],
              ),
            ),
          ),

          // all matches

          const SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(name: "All Matches"),
                        CustomText(
                          name: "See all",
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),

                  // horizonatal list view

                  CustomHorizontalWidget(slug: "allmatches",),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomHorizontalWidget extends StatelessWidget {
  final String slug;
  const CustomHorizontalWidget({
    super.key,
    required this.slug
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          2,
          (index) => InkWell(
            borderRadius: BorderRadius.only(
              topLeft: index == 0 ? const Radius.circular(30) : Radius.zero,
            ),
            onTap: () {
              navigator?.pushNamed(RouteName.userDetailScreen,
              arguments: slug+index.toString()
              );
            },
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft:
                          index == 0 ? const Radius.circular(30) : Radius.zero,
                    ),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Hero(
                            tag: 'user-profile$slug$index',
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: index == 0
                                    ? const Radius.circular(30)
                                    : Radius.zero,
                              ),
                              child: Image.asset(
                                AppImages.img1,
                                height: 200,
                                // width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          // user details

                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    name: "Anika",
                                    fontsize: 10,
                                    color: Colors.white,
                                  ),
                                  CustomText(
                                    name: "24 yrs, 5'5",
                                    fontsize: 10,
                                    color: Colors.white,
                                  ),
                                  CustomText(
                                    name: "Kozhikode. Kerala",
                                    fontsize: 10,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      setHeight(10),
                      const CustomButton(
                        height: 35,
                        label: "Sent Interest",
                        fontSize: 12,
                        backgroundColor: Colors.white,
                        isOutline: true,
                        outlineColor: AppColors.primary,
                        foregroundColor: AppColors.primary,
                        radius: 2,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10))),
                    child: const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
