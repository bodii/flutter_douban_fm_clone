import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_douban_fm_clone/common/controllers/auth_provider.dart';
import 'package:flutter_douban_fm_clone/common/controllers/login.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/database/user/user_db.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusScopeNode _formNode = FocusScopeNode();

  bool agree = true;
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _formNode.dispose();

    super.dispose();
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
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&\.]{8,15}$');
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

    if (validated && !agree) {
      errorMeg = '请同意《豆瓣使用协议》和《豆瓣使用协议》';
      validated = false;
    }

    if (!validated) {
      _toast(errorMeg);
    }

    return validated;
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<void> _signInEvent() async {
    // 关闭键盘
    _formNode.unfocus();

    // 验证
    bool validated = _verifyValues();

    if (!validated) {
      return;
    }

    UserDb userDb = UserDb();
    User? userInfo = await userDb.signIn(username);
    if (userInfo == null || userInfo.id == 0) {
      _toast('用户信息不存在');
      return;
    }

    String signInToken = md5.convert(utf8.encode(password)).toString();
    if (signInToken != userInfo.token) {
      _toast('密码与注册时输入的密码不一致');
      return;
    }

    // 登录成功后记录最后登录时间
    await userDb.signInSuccessToRecord(userInfo.id);

    // 登录账户
    Login login = context.auth();
    login.login(userInfo);

    // 去用户中心
    context.go('/home/index/2');
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
                  0,
                  0.7
                ]),
            image: DecorationImage(
              image: AssetImage('assets/icons/logo03.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment(1.0, -.70),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      '登录',
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
                      height: 240,
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
                                          context
                                              .push('/user/protection_policy');
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '密码',
                                hintStyle: const TextStyle(
                                  backgroundColor: Colors.white,
                                  fontSize: 14,
                                  height: 2.2,
                                  color: Colors.grey,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                disabledBorder: null,
                                enabledBorder: null,
                                fillColor: Colors.white,
                                suffixIcon: TextButton(
                                  onPressed: () {
                                    context.push('/user/forgot_password');
                                  },
                                  child: const Text(
                                    '忘记密码',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                              obscureText: true,
                              onSaved: (value) => password = value!,
                              onEditingComplete: _formNode.nextFocus,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await _signInEvent();
                            },
                            style: ElevatedButton.styleFrom(
                              surfaceTintColor: Colors.white,
                              backgroundColor: Colors.white,
                            ),
                            child: const Text(
                              '登录',
                              style: TextStyle(
                                color: CustomColors.paimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          debugPrint('go sign up page');
                          context.push('/user/sign_up');
                        },
                        child: const Text(
                          '注册豆瓣账号',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                        height: 200,
                      ),
                      const Text(
                        '第三方账号登录',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            generateThirdPartyLogin(
                              'assets/icons/weibo_logo_icon.png',
                            ),
                            generateThirdPartyLogin(
                              'assets/icons/wechat_logo_icon.png',
                            ),
                            generateThirdPartyLogin(
                                'assets/icons/apple_logo_icon.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget generateThirdPartyLogin(String icon) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: .5,
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(9),
      child: Image.asset(
        icon,
        width: 25,
        height: 25,
      ),
    );
  }
}
