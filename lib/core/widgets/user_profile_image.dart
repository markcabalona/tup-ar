import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final String? imageUrl;
  final double? maxRadius;
  const UserProfileImage({
    Key? key,
    this.imageUrl,
    this.maxRadius = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: maxRadius,
      child: ClipOval(
        clipBehavior: Clip.hardEdge,
        child: Builder(builder: (context) {
          if (imageUrl != null) {
            return Image.network(
              imageUrl!,
              errorBuilder: (context, error, stackTrace) => _defaultIcon,
            );
          }
          return _defaultIcon;
        }),
      ),
    );
  }

  Widget get _defaultIcon => Padding(
        padding: const EdgeInsets.all(4),
        child: LayoutBuilder(builder: (context, constraints) {
          return Icon(
            Icons.person,
            size: constraints.maxHeight,
          );
        }),
      );
}
