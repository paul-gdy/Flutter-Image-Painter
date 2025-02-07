import 'package:flutter/material.dart';

import '../../image_painter.dart';

class SelectionItems extends StatelessWidget {
  final bool isSelected;
  final ModeData data;
  final VoidCallback? onTap;

  const SelectionItems({
    required this.data,
    Key? key,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: isSelected ? Theme.of(context).dividerColor.withOpacity(0.2) : Colors.transparent),
      child: ListTile(
        leading: IconTheme(
          data: const IconThemeData(opacity: 1.0),
          child: Icon(
            data.icon,
            color: Theme.of(context).dividerColor,
          ),
        ),
        title: Text(
          data.label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).appBarTheme.foregroundColor,
              ),
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        selected: isSelected,
      ),
    );
  }
}

List<ModeData> paintModes(TextDelegate textDelegate) => [
      ModeData(
          icon: Icons.zoom_out_map,
          mode: PaintMode.none,
          label: textDelegate.noneZoom),
      ModeData(
          icon: Icons.edit,
          mode: PaintMode.freeStyle,
          label: textDelegate.drawing),
      ModeData(
          icon: Icons.horizontal_rule,
          mode: PaintMode.line,
          label: textDelegate.line),
      ModeData(
          icon: Icons.crop_free,
          mode: PaintMode.rect,
          label: textDelegate.rectangle),
      ModeData(
          icon: Icons.lens_outlined,
          mode: PaintMode.circle,
          label: textDelegate.circle),
      ModeData(
          icon: Icons.arrow_right_alt_outlined,
          mode: PaintMode.arrow,
          label: textDelegate.arrow),
      ModeData(
          icon: Icons.power_input,
          mode: PaintMode.dashLine,
          label: textDelegate.dashLine),
      ModeData(
          icon: Icons.text_format,
          mode: PaintMode.text,
          label: textDelegate.text),
      ModeData(
          icon: Icons.image,
          mode: PaintMode.image,
          label: textDelegate.image),
    ];

@immutable
class ModeData {
  const ModeData({
    required this.icon,
    required this.mode,
    required this.label,
  });
  final IconData icon;
  final PaintMode mode;
  final String label;
}
