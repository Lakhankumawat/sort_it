import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sort_it/src/screens/home/home.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/src/screens/sign_up/sign_up.dart';

import 'components/bunny.dart';

class SignIn extends StatefulWidget {
  static String routeName = '/sign-in';

  @override
  State<SignIn> createState() => _SignInState();
}

const Color _textColor = Color.fromRGBO(150, 167, 175, 1);

class _SignInState extends State<SignIn> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Bunny _bunny;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.stop();
    _bunny = Bunny(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double textFieldWidth = MediaQuery.of(context).size.width - 32;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0.6, 0.7),
              end: Alignment(-0.7, 0.6),
              colors: [
                Color.fromRGBO(34, 52, 60, 1),
                Color.fromRGBO(31, 46, 53, 1)
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.1.sw,
            vertical: 0.1.sh,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   width: 50,
              //   height: 50,
              //   // decoration: BoxDecoration(
              //   //   borderRadius: BorderRadius.circular(12),
              //   //   boxShadow: [
              //   //     BoxShadow(
              //   //         color: Color.fromRGBO(15, 218, 136, 0.3),
              //   //         offset: Offset(0, 2),
              //   //         blurRadius: 4)
              //   //   ],
              //   //   gradient: LinearGradient(
              //   //       begin: Alignment(0, 1),
              //   //       end: Alignment(-1, 0),
              //   //       colors: [
              //   //         Color.fromRGBO(63, 223, 158, 1),
              //   //         Color.fromRGBO(62, 213, 152, 1)
              //   //       ]),
              //   // )
              //   child: Image.asset('assets/images/logo.png'),
              // ),
              // Text(
              //   'Welcome',
              //   style: Theme.of(context).textTheme.headline1,
              // ),
              // Text(
              //   'Sign in to continue',
              //   style: Theme.of(context).textTheme.headline2,
              // ),
              //SizedBox(height: 32.h),
              Align(
                alignment: Alignment.center,
                child: Lottie.asset(
                  'assets/lottie/bunny_mouth.json',
                  width: 0.35.sw,
                  height: 0.17.sh,
                  controller: _controller,
                  fit: BoxFit.fill,
                  onLoaded: (composition) {
                    setState(() {
                      _controller.duration = composition.duration;
                    });
                  },
                ),
              ),
              _MyTextField(
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                onHasFocus: (isObscure) {
                  /// 获取焦点，开始文字跟踪状态
                  _bunny.setTrackingState();
                },
                onChanged: (text) {
                  _bunny.setEyesPosition(_getTextSize(text) / textFieldWidth);
                },
              ),
              _MyTextField(
                labelText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onHasFocus: (isObscure) {
                  /// 获取焦点，设置状态
                  if (isObscure) {
                    _bunny.setShyState();
                  } else {
                    _bunny.setPeekState();
                  }
                },
                onObscureText: (isObscure) {
                  if (isObscure) {
                    _bunny.setShyState();
                  } else {
                    _bunny.setPeekState();
                  }
                },
              ),
              CustomButton(
                buttonText: 'Sign In',
                textColor: Colors.white,
                buttonColor: Color.fromRGBO(63, 223, 158, 1),
                leading: true,
                onTap: () {
                  Navigator.of(context).pushNamed(Home.routeName);
                },
              ),
              // Figma Flutter Generator ForgotWidget - TEXT
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Forgot password?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              CustomButton(
                buttonText: 'Create an account',
                textColor: Color.fromRGBO(63, 223, 158, 1),
                buttonColor: Color(0xFF286053),
                onTap: () => Navigator.of(context).pushNamed(SignUp.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _getTextSize(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: text,
          style: const TextStyle(
            fontSize: 16.0,
          )),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }
}

class _MyTextField extends StatefulWidget {
  const _MyTextField(
      {Key? key,
      required this.labelText,
      this.obscureText = false,
      this.keyboardType,
      this.onHasFocus,
      this.onObscureText,
      this.onChanged})
      : super(key: key);

  final String labelText;
  final bool obscureText;
  final TextInputType? keyboardType;

  /// 获取焦点监听
  final Function(bool isObscure)? onHasFocus;

  /// 密码可见监听
  final Function(bool isObscure)? onObscureText;

  /// 文字输入监听
  final Function(String text)? onChanged;

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<_MyTextField> {
  bool _isObscure = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_refresh);
  }

  void _refresh() {
    if (_focusNode.hasFocus && widget.onHasFocus != null) {
      widget.onHasFocus?.call(_isObscure);
    }
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.removeListener(_refresh);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFF30444E),
      ),
      padding: const EdgeInsets.all(8.0),
      height: 60.0,
      child: Listener(
        onPointerDown: (e) => FocusScope.of(context).requestFocus(_focusNode),
        child: TextField(
          focusNode: _focusNode,
          style: Theme.of(context).textTheme.headline2,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            fillColor: Color(0xFF30444E),
            contentPadding: new EdgeInsets.symmetric(vertical: 12),
            border: InputBorder.none,
            prefixIcon: Prefix(),
            hintText: widget.labelText,
            hintStyle: Theme.of(context).textTheme.headline2,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: _textColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                      if (widget.onObscureText != null) {
                        widget.onObscureText?.call(_isObscure);
                      }
                    },
                  )
                : null,
          ),
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText ? _isObscure : widget.obscureText,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}

Widget Prefix() {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Container(
      width: 25,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(98, 91, 57, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Icon(
          FontAwesomeIcons.solidUser,
          color: Color(0xFFFFC542),
        ),
      ),
    ),
  );
}
