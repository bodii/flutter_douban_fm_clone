import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool checkbox = false;
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
                    '忘记密码',
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
                  height: 300,
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
                          ),
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
                            suffix: Text(
                              '错误信息',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ),
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
                            suffix: Text(
                              '错误信息',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ),
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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '验证码',
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
                                suffixIcon: Text(
                                  // '60s',
                                  '获取验证码',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                    height: 2.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            debugPrint('注册');
                          },
                          style: ElevatedButton.styleFrom(
                            surfaceTintColor: Colors.white,
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            '确认',
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
            ]),
          ),
        ),
      ),
    );
  }
}
