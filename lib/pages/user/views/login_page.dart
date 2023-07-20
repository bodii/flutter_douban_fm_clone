import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/configs/custom_color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                    height: 185,
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
                              hintText: '邮箱/手机号',
                              hintStyle: TextStyle(
                                textBaseline: TextBaseline.alphabetic,
                                backgroundColor: Colors.white,
                                fontSize: 14,
                                color: Colors.grey.shade400,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 9),
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '密码',
                              hintStyle: const TextStyle(
                                backgroundColor: Colors.white,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              disabledBorder: null,
                              enabledBorder: null,
                              fillColor: Colors.white,
                              suffix: TextButton(
                                onPressed: () {
                                  debugPrint('忘记密码');
                                },
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.only(top: 3)),
                                child: const Text(
                                  '忘记密码',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            debugPrint('登录');
                          },
                          style: ElevatedButton.styleFrom(
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
