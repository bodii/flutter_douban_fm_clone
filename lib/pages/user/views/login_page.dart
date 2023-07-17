import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/configs/custom_color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool checkbox = false;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
                  debugPrint('退出');
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
              Row(
                children: [
                  Checkbox(
                    activeColor: CustomColors.paimary,
                    value: true,
                    onChanged: (value) {
                      checkbox = !checkbox;
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
                              debugPrint('使用协议');
                            },
                        ),
                        const TextSpan(text: '、'),
                        TextSpan(
                          text: '个人信息保护政策',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              debugPrint('个人信息保护政策');
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Form(
                child: SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '邮箱/手机号',
                            hintStyle: TextStyle(
                              backgroundColor: Colors.white,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            disabledBorder: null,
                            enabledBorder: null,
                            fillColor: Colors.white,
                          ),
                          cursorHeight: 15,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 40.0,
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
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            disabledBorder: null,
                            enabledBorder: null,
                            fillColor: Colors.white,
                            suffix: Text(
                              '忘记密码',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          cursorHeight: 15,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          '登录',
                          style: TextStyle(color: CustomColors.paimary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        '注册豆瓣账号',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
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
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: .5,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              'assets/icons/weibo_logo_icon.png',
                              width: 25,
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: .5,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              'assets/icons/wechat_logo_icon.png',
                              width: 25,
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: .5,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              'assets/icons/apple_logo_icon.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
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
    );
  }
}
