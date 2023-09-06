import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavBar.dart';
// import 'individualitema.dart';
// import 'package:flutter_auth/Screens/widgets/searchBar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Good morning User!",
                          style: Helper.getTheme(context).headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: SizedBox(
                        width: 250,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // SearchBar(title: "title",),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryCard(
                            image: Image.asset(
                              Helper.getAssetName("Mental_Health.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Checkup",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CategoryCard(
                            image: Image.asset(
                              Helper.getAssetName("Mental_Health.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Checkup",
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Items",
                          style: Helper.getTheme(context).headlineSmall,
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text("View all"))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ItemsCard(
                    image: Image.asset(
                      Helper.getAssetName("Mental_Health.jpg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Task1",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ItemsCard(
                    image: Image.asset(
                      Helper.getAssetName("Mental_Health.jpg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Task1",
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Most Popular",
                  //         style: Helper.getTheme(context).headline5,
                  //       ),
                  //       TextButton(
                  //         onPressed: () {},
                  //         child: Text("View all"),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   height: 250,
                  //   width: double.infinity,
                  //   padding: const EdgeInsets.only(left: 20),
                  //   child: SingleChildScrollView(
                  //     scrollDirection: Axis.horizontal,
                  //     child: Row(
                  //       children: [
                  //         MostPopularCard(
                  //           image: Image.asset(
                  //             Helper.getAssetName("pizza4.jpg", "real"),
                  //             fit: BoxFit.cover,
                  //           ),
                  //           name: "Cafe De Bambaa",
                  //         ),
                  //         SizedBox(
                  //           width: 30,
                  //         ),
                  //         MostPopularCard(
                  //           name: "Burger by Bella",
                  //           image: Image.asset(
                  //             Helper.getAssetName("dessert3.jpg", "real"),
                  //             fit: BoxFit.cover,
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Recent Items",
                  //         style: Helper.getTheme(context).headline5,
                  //       ),
                  //       TextButton(
                  //         onPressed: () {},
                  //         child: Text("View all"),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 20,
                  //   ),
                  //   child: Column(
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           Navigator.of(context)
                  //               .pushNamed(IndividualItem.routeName);
                  //         },
                  //         child: RecentItemCard(
                  //           image: Image.asset(
                  //             Helper.getAssetName("pizza3.jpg", "real"),
                  //             fit: BoxFit.cover,
                  //           ),
                  //           name: "Mulberry Pizza by Josh",
                  //         ),
                  //       ),
                  //       RecentItemCard(
                  //           image: Image.asset(
                  //             Helper.getAssetName("coffee.jpg", "real"),
                  //             fit: BoxFit.cover,
                  //           ),
                  //           name: "Barita"),
                  //       RecentItemCard(
                  //           image: Image.asset(
                  //             Helper.getAssetName("pizza.jpg", "real"),
                  //             fit: BoxFit.cover,
                  //           ),
                  //           name: "Pizza Rush Hour"),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          const Align(
              alignment: Alignment.bottomLeft,
              child: CustomNavBar(
                home: true,
              )),
        ],
      ),
    );
  }
}

// class RecentItemCard extends StatelessWidget {
//   const RecentItemCard({
//     Key? key,
//     required String name,
//     required Image image,
//   })  : _name = name,
//         _image = image,
//         super(key: key);

//   final String _name;
//   final Image _image;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: SizedBox(
//             width: 80,
//             height: 80,
//             child: _image,
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           child: SizedBox(
//             height: 100,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _name,
//                   style: Helper.getTheme(context)
//                       .headlineMedium
//                       ?.copyWith(color: AppColor.primary),
//                 ),
//                 const Row(
//                   children: [
//                     Text("Cafe"),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 5.0),
//                       child: Text(
//                         ".",
//                         style: TextStyle(
//                           color: AppColor.orange,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Text("Western Food"),
//                     SizedBox(
//                       width: 20,
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Image.asset(
//                       Helper.getAssetName("star_filled.png", "virtual"),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     const Text(
//                       "4.9",
//                       style: TextStyle(
//                         color: AppColor.orange,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     const Text('(124) Ratings')
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// class MostPopularCard extends StatelessWidget {
//   const MostPopularCard({
//     Key? key,
//     required String name,
//     required Image image,
//   })  : _name = name,
//         _image = image,
//         super(key: key);

//   final String _name;
//   final Image _image;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: SizedBox(
//             width: 300,
//             height: 200,
//             child: _image,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           _name,
//           style: Helper.getTheme(context)
//               .headlineMedium
//               ?.copyWith(color: AppColor.primary),
//         ),
//         Row(
//           children: [
//             const Text("Cafe"),
//             const SizedBox(
//               width: 5,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(bottom: 5.0),
//               child: Text(
//                 ".",
//                 style: TextStyle(
//                   color: AppColor.orange,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 5,
//             ),
//             const Text("Western Food"),
//             const SizedBox(
//               width: 20,
//             ),
//             Image.asset(
//               Helper.getAssetName("star_filled.png", "virtual"),
//             ),
//             const SizedBox(
//               width: 5,
//             ),
//             const Text(
//               "4.9",
//               style: TextStyle(
//                 color: AppColor.orange,
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }

class ItemsCard extends StatelessWidget {
  const ItemsCard({
    Key? key,
    required String name,
    required Image image,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200, width: double.infinity, child: _image),
          const SizedBox(height: defaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      _name,
                      style: const TextStyle(
                        fontSize: 16, // Set your desired font size here
                        fontWeight: FontWeight
                            .normal, // You can also set other text styles if needed
                      ),
                    )
                  ],
                ),
                const SizedBox(height: defaultPadding),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required Image image,
    required String name,
  })  : _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 100,
            height: 100,
            child: _image,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headlineMedium
              ?.copyWith(color: AppColor.primary, fontSize: 16),
        ),
      ],
    );
  }
}
