import 'package:flutter/material.dart';

import 'package:place_autocomplete/models/prediction/structured_formatting_model.dart';

class SearchResultItemCard extends StatelessWidget {
  const SearchResultItemCard({
    required this.itemText,
    required this.onTap,
    super.key,
  });

  final StructuredFormatting itemText;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ListTile(
        leading: const Icon(
          Icons.location_pin,
          color: Colors.red,
        ),
        title: Text(itemText.mainText == null ? '' : itemText.mainText!),
        subtitle:
            Text(itemText.secondaryText == null ? '' : itemText.secondaryText!),
        onTap: onTap,
      ),
    );
  }
}
