
import 'package:flutter/cupertino.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperOne(),
      child: Image.asset(
        'assets/images/Welcome.jpg',
        height: MediaQuery.of(context).size.height * 0.3,
        width: 2000,
        fit: BoxFit.fill,
      ),
    );
  }
}
