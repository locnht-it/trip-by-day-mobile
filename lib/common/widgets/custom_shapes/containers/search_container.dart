// // import 'package:flutter/material.dart';
// // import 'package:iconsax/iconsax.dart';
// //
// // import '../../../../utils/constants/colors.dart';
// // import '../../../../utils/constants/sizes.dart';
// // import '../../../../utils/device/device_utility.dart';
// // import '../../../../utils/helpers/helper_functions.dart';
// //
// //
// // class TSearchContainer extends StatelessWidget {
// //   const TSearchContainer({
// //     super.key, required this.text, this.icon = Iconsax.search_normal, this.showBackground = true, this.showBorder = true, this.onTap,
// //   });
// //
// //   final String text;
// //   final IconData? icon;
// //   final bool showBackground, showBorder;
// //   final VoidCallback? onTap;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final dark = THelperFunctions.isDarkMode(context);
// //
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
// //         child: Container(
// //           width: TDeviceUtils.getScreenWidth(context),
// //           padding: const EdgeInsets.all(TSizes.md),
// //           decoration: BoxDecoration(
// //             color: showBackground ? dark ? TColors.dark : TColors.light : Colors.transparent,
// //             borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
// //             border: showBorder ? Border.all(color: TColors.grey) : null,
// //           ),
// //           child: Row(
// //             children: [
// //               Icon(icon, color: TColors.grey),
// //               const SizedBox(width: TSizes.spaceBtwItems),
// //               Text(text, style: Theme.of(context).textTheme.bodySmall),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
//
//
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/device/device_utility.dart';
// import '../../../../utils/helpers/helper_functions.dart';
//
// class TSearchContainer extends StatelessWidget {
//   const TSearchContainer({
//     super.key, required this.text, this.icon = Iconsax.search_normal, this.showBackground = true, this.showBorder = true, this.onTap,
//   });
//
//   final String text;
//   final IconData? icon;
//   final bool showBackground, showBorder;
//   final VoidCallback? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
//         child: Container(
//           width: TDeviceUtils.getScreenWidth(context),
//           padding: const EdgeInsets.all(TSizes.md),
//           decoration: BoxDecoration(
//             color: Colors.transparent,
//             borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
//             border: Border.all(color: Colors.black),
//           ),
//           child: Row(
//             children: [
//               Icon(icon, color: TColors.grey),
//               const SizedBox(width: TSizes.spaceBtwItems),
//               Text(text, style: Theme.of(context).textTheme.bodySmall),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onFilterTap,
    this.onSearch,
    this.selectedCategories = const [],
    this.selectedBrands = const [],
    this.priceRange,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onFilterTap;
  final Function(String)? onSearch; // Thêm callback cho tìm kiếm
  final List<String> selectedCategories;
  final List<String> selectedBrands;
  final RangeValues? priceRange;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    TextEditingController _searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? (dark ? TColors.dark : TColors.light)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: TColors.grey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: text,
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  if (onSearch != null) {
                    onSearch!(value); // Gọi hàm tìm kiếm
                  }
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.grey),
              onPressed: onFilterTap,
            ),
          ],
        ),
      ),
    );
  }
}