import 'package:flutter/material.dart';
import '../plugins/helpers/stateful_holder.dart';

class FallbackableNetworkImage extends StatefulWidget {
  const FallbackableNetworkImage({
    required final this.url,
    required final this.headers,
    required final this.placeholder,
    final this.errorPlaceholder,
    final Key? key,
  }) : super(key: key);

  final String url;
  final Map<String, String> headers;
  final Widget placeholder;
  final Widget? errorPlaceholder;

  @override
  _FallbackableNetworkImageState createState() =>
      _FallbackableNetworkImageState();
}

class _FallbackableNetworkImageState extends State<FallbackableNetworkImage> {
  LoadState state = LoadState.waiting;
  ImageInfo? imageInfo;
  late final NetworkImage networkImage;

  @override
  void initState() {
    super.initState();

    Future<void>.delayed(Duration.zero, () {
      networkImage = NetworkImage(widget.url);
      networkImage.resolve(const ImageConfiguration()).addListener(
            ImageStreamListener(
              (final ImageInfo image, final bool synchronousCall) {
                if (mounted) {
                  setState(() {
                    imageInfo = image;
                    state = LoadState.resolved;
                  });
                }
              },
              onError: (final Object exception, final StackTrace? stackTrace) {
                if (mounted) {
                  setState(() {
                    state = LoadState.failed;
                  });
                }
              },
            ),
          );
    });
  }

  @override
  void dispose() {
    imageInfo?.dispose();

    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    if (state == LoadState.resolved) {
      return Image(image: networkImage);
    }

    if (state == LoadState.failed && widget.errorPlaceholder != null) {
      return widget.errorPlaceholder!;
    }

    return widget.placeholder;
  }
}