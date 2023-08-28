import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/database/user/user_db.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusScopeNode _formNode = FocusScopeNode();

  bool agree = true;

  String username = '';
  String password = '';
  String repassword = '';
  String verifyCode = '';
  String apiVerifyCode = '';
  int countdown = 30;
  bool isCountDown = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _formNode.dispose();

    super.dispose();
  }

  void _showTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
      });
      if (countdown == 0) {
        timer.cancel();
        setState(() {
          isCountDown = false;
        });
      }
    });
  }

  String _generateRandomString(int len) {
    const int lowerStartNumber = 97;
    const int caseStartNumber = 65;

    final random = Random();
    final result = String.fromCharCodes(List.generate(len, (index) {
      bool lowerOrcase = random.nextBool();
      int number = lowerOrcase ? lowerStartNumber : caseStartNumber;
      return random.nextInt(26) + number;
    }));
    return result;
  }

  void _generateVerifyCode() {
    Future.delayed(Duration(seconds: Random().nextInt(3) + 1), () {
      setState(() {
        apiVerifyCode = _generateRandomString(6);
      });
    });
  }

  Future<void> sendVerifyCode() async {
    setState(() {
      isCountDown = true;
      verifyCode = '';
      countdown = 30;
    });

    _generateVerifyCode();
    _showTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomColors.secondary,
                  Colors.white,
                ],
                stops: [
                  0.0,
                  1.0
                ]),
            image: DecorationImage(
              image: AssetImage('assets/icons/logo03.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment(1.0, -.70),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 30,
                ),
                onPressed: () {
                  context.pop(false);
                },
              ),
              const SizedBox(height: 55),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 28.0, bottom: 30),
                  child: Text(
                    '注册',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: FocusScope(
                  node: _formNode,
                  child: SizedBox(
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: CustomColors.paimary,
                              value: agree,
                              onChanged: (value) {
                                setState(() {
                                  agree = value!;
                                });
                              },
                              shape: const CircleBorder(),
                              side: const BorderSide(width: 0.95),
                            ),
                            Text.rich(
                              TextSpan(
                                style: const TextStyle(
                                  color: CustomColors.paimary,
                                ),
                                children: [
                                  const TextSpan(
                                      text: '已详读并同意 ',
                                      style: TextStyle(color: Colors.grey)),
                                  TextSpan(
                                    text: '豆瓣使用协议',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.push('/user/usage_agreement');
                                      },
                                  ),
                                  const TextSpan(text: '、'),
                                  TextSpan(
                                    text: '个人信息保护政策',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.push('/user/protection_policy');
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: size.width * 0.95,
                          height: 40.0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '邮箱/手机号',
                              hintStyle: TextStyle(
                                textBaseline: TextBaseline.alphabetic,
                                fontSize: 14,
                                height: 2.2,
                                color: Colors.grey,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              disabledBorder: null,
                              enabledBorder: null,
                              fillColor: Colors.white,
                              // errorText: '',
                              focusedErrorBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(35),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[\w@.-]')),
                            ],
                            onSaved: (value) {
                              username = value!;
                            },
                            onEditingComplete: _formNode.nextFocus,
                          ),
                        ),
                        Container(
                          width: size.width * 0.95,
                          height: 40.0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '密码',
                              hintStyle: TextStyle(
                                backgroundColor: Colors.white,
                                fontSize: 14,
                                color: Colors.grey,
                                height: 2.2,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              disabledBorder: null,
                              enabledBorder: null,
                              fillColor: Colors.white,
                            ),
                            obscureText: true,
                            onSaved: (value) => password = value!,
                            onEditingComplete: _formNode.nextFocus,
                          ),
                        ),
                        Container(
                          width: size.width * 0.95,
                          height: 40.0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '确认密码',
                              hintStyle: TextStyle(
                                backgroundColor: Colors.white,
                                fontSize: 14,
                                color: Colors.grey,
                                height: 2.2,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              disabledBorder: null,
                              enabledBorder: null,
                              fillColor: Colors.white,
                            ),
                            obscureText: true,
                            onSaved: (value) => repassword = value!,
                            onEditingComplete: _formNode.nextFocus,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: size.width * 0.5,
                              height: 40.0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '验证码',
                                  hintStyle: const TextStyle(
                                    backgroundColor: Colors.white,
                                    fontSize: 14,
                                    color: Colors.grey,
                                    height: 2.2,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 5),
                                  disabledBorder: null,
                                  enabledBorder: null,
                                  fillColor: Colors.white,
                                  suffixIcon: SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 0.6,
                                          height: double.infinity,
                                          color: Colors.black26,
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                        ),
                                        isCountDown
                                            ? Container(
                                                width: 70,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${countdown}s',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    height: 1.2,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  sendVerifyCode();
                                                },
                                                child: const Text(
                                                  '获取验证码',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    height: 1.2,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                onSaved: (value) => verifyCode = value!,
                                onEditingComplete: _formNode.nextFocus,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(6)
                                ],
                                enabled: !isCountDown,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Visibility(
                                visible: apiVerifyCode.isNotEmpty,
                                child: SelectableText.rich(TextSpan(
                                  text: '获取到的验证码是：',
                                  style: const TextStyle(
                                    color: Colors.black45,
                                    fontSize: 11,
                                    height: 2,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: apiVerifyCode,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              // 验证
                              bool validated = _verifyValues();
                              if (!validated) {
                                return;
                              }

                              // 保存数据库
                              bool saved = await _saveDataToDb();
                              if (!saved) {
                                return;
                              }

                              // 弹窗： 注册成功, 并跳转到登录页
                              context.go('/user/sign_in');
                            },
                            style: ElevatedButton.styleFrom(
                              surfaceTintColor: Colors.white,
                              backgroundColor: Colors.white,
                            ),
                            child: const Text(
                              '注册',
                              style: TextStyle(
                                color: CustomColors.paimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  bool _verifyValues() {
    _formKey.currentState!.save();

    bool validated = true;

    RegExp usernameEmailRegexp =
        RegExp(r'([\d\w]+@[\d\w]+[.][\d\w]+)|(1[3-9]\d{9})');
    RegExp usernamePhoneRegexp =
        RegExp(r'([\d\w]+@[\d\w]+[.][\d\w]+)|(1[3-9]\d{9})');
    RegExp hasPhoneRegexp = RegExp(r'1[3-9]\d+');
    RegExp passwdRegexp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}$');
    String errorMeg = '';

    if (hasPhoneRegexp.hasMatch(username)) {
      if (!usernamePhoneRegexp.hasMatch(username)) {
        errorMeg = '用户名输入错误: 手机号不合法！';
        validated = false;
      }
    } else {
      if (!usernameEmailRegexp.hasMatch(username)) {
        errorMeg = '用户名输入错误: 邮箱地址不合法！';
        validated = false;
      }
    }

    if (validated) {
      if (!passwdRegexp.hasMatch(password)) {
        errorMeg = '密码输入格式错误: 8-15位,包含至少1个'
            '大写字母，1个小写字母，1个数字和1个特殊字符！';
        validated = false;
      }
    }

    if (validated && !passwdRegexp.hasMatch(repassword)) {
      errorMeg = '确认密码输入格式错误: 8-15位,包含至少1个'
          '大写字母，1个小写字母，1个数字和1个特殊字符！';
      validated = false;
    }

    if (validated && password != repassword) {
      errorMeg = '两次输入的密码不一致！';
      validated = false;
    }

    if (validated && verifyCode != apiVerifyCode) {
      errorMeg = '验证码不正确！';
      validated = false;
    }

    if (validated && !agree) {
      errorMeg = '请同意《豆瓣使用协议》和《豆瓣使用协议》';
      validated = false;
    }

    if (!validated) {
      _toast(errorMeg);
    }

    return validated;
  }

  Future<bool> _saveDataToDb() async {
    // 关闭键盘
    _formNode.unfocus();

    // 保存到数据库，并跳转到登录页
    Map<String, dynamic> userData = {
      'username': username,
      'nickname': _generateRandomString(8),
      'avatar': '',
      'phone': RegExp(r'1[3-9]\d{9}').hasMatch(username) ? username : '',
      'token': md5.convert(utf8.encode(password)).toString(),
      'signUpDate': DateTime.now().toString(),
      'signInLateDate': DateTime.now().toString(),
    };

    UserDb userDb = UserDb();
    int row = await userDb.insert(data: userData);
    if (row < 1) {
      _toast('注册数据保存失败');
    }

    return row > 0;
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
