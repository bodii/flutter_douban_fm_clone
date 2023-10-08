import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_douban_fm_clone/common/controllers/auth_provider.dart';
import 'package:flutter_douban_fm_clone/common/controllers/login.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:flutter_douban_fm_clone/common/handler/utils.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';
import 'package:go_router/go_router.dart';

class ModifyPassword extends StatefulWidget {
  const ModifyPassword({super.key});

  @override
  State<ModifyPassword> createState() => _ModifyPasswordState();
}

class _ModifyPasswordState extends State<ModifyPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusScopeNode _formNode = FocusScopeNode();

  String password = '';
  String repassword = '';
  bool visibilityPassword = false;
  bool visibilityRepassword = false;
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

  void _generateVerifyCode() {
    Future.delayed(Duration(seconds: Random().nextInt(3) + 1), () {
      setState(() {
        apiVerifyCode = Utils.generateRandomString(6);
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
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () {
              context.pop(false);
            }),
        title: const Text("修改密码"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0, left: 10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Form(
            key: _formKey,
            child: FocusScope(
              node: _formNode,
              child: SizedBox(
                height: 280,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                            color: Colors.grey,
                            height: 2.2,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          disabledBorder: null,
                          enabledBorder: null,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visibilityPassword = !visibilityPassword;
                                });
                              },
                              icon: Icon(
                                  visibilityPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 20)),
                        ),
                        obscureText: visibilityPassword,
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
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '确认密码',
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
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visibilityRepassword =
                                        !visibilityRepassword;
                                  });
                                },
                                icon: Icon(
                                    visibilityRepassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20))),
                        obscureText: visibilityRepassword,
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
                                      margin: const EdgeInsets.only(right: 10),
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
                            enabled: true,
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
                        },
                        style: ElevatedButton.styleFrom(
                          surfaceTintColor: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          '确定',
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
    );
  }

  bool _verifyValues() {
    _formKey.currentState!.save();

    bool validated = true;

    RegExp passwdRegexp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}$');
    String errorMeg = '';

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

    if (!validated) {
      _toast(errorMeg);
    }

    return validated;
  }

  Future<bool> _saveDataToDb() async {
    // 关闭键盘
    _formNode.unfocus();

    Login? login = context.auth();
    User userInfo = login.userInfo!;
    userInfo.password = password;
    userInfo.token = Utils.generateToken(password);

    login.upInfo(userInfo);
    _toast("更新成功");

    return true;
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
