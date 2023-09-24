import 'package:flutter/material.dart';
import '../delegates/text_delegate.dart';

class ImageDialog extends StatefulWidget {
  const ImageDialog({
    super.key,
    required this.images,
    required this.onFinished,
    required this.textDelegate,
  });

  final List<String> images;
  final Function(String, int) onFinished;
  final TextDelegate textDelegate;

  static void show(
    BuildContext context, {
    required List<String> images,
    required TextDelegate textDelegate,
    required Function(String, int) onFinished,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return ImageDialog(
          images: images,
          onFinished: onFinished,
          textDelegate: textDelegate,
        );
      },
    );
  }

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {

  late String _image;
  double _size = 40.0;

  @override
  void initState() {
    _image = widget.images.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.0,
            width: 100.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: (100.0 - _size)/2),
              child: Image.asset(_image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Slider(
              value: _size,
              min: 20.0,
              max: 100.0,
              onChanged: (value) {
                setState(() {
                  _size = value;
                });
              },
            ),
          ),
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: widget.images.map((image) => ImageButton(
              image: image,
              onTap: () {
                setState(() {
                  _image = image;
                });
              },
            ),).toList(),
          ),
          const SizedBox(height: 40.0),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              child: Text(
                widget.textDelegate.done,
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              onPressed: () => widget.onFinished(_image, (_size * 1.9).round()),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  const ImageButton({
    super.key,
    required this.image,
    required this.onTap,
  });

  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        image,
        width: 40,
      ),
      onTap: onTap,
    );
  }
}
