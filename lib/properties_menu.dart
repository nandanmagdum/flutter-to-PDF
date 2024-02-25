import 'package:download_pdf/sizes.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PropertyInformationMenu extends StatelessWidget {
  const PropertyInformationMenu({
    super.key,
    this.icon = Icons.arrow_forward_ios_rounded,
    // required this.onPressed,
    required this.title,
    required this.value,
    this.showIcon2 = false, // Parameter to control whether to show icon2 or not
    this.icon2 = const Icon(
      LineAwesomeIcons.indian_rupee_sign,
      size: 20,
    ),
  });
  final IconData icon;
  final Icon icon2;
  final bool showIcon2; // Whether to show icon2 or not
  // final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                if (showIcon2) icon2, // Conditionally include icon2
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // Expanded(child: Icon(icon, size: 18)),
        ],
      ),
    );
  }
}
