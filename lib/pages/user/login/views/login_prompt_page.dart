import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:go_router/go_router.dart';

class LoginPromptPage extends StatelessWidget {
  const LoginPromptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
      ),
      backgroundColor: Colors.grey.shade300,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(bottom: 40),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 400,
            height: 405,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                const Text(
                  '温馨提示',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600, height: 1.8),
                ),
                Text.rich(
                  style: const TextStyle(
                      color: Colors.grey, fontSize: 13, height: 1.5),
                  TextSpan(
                    text: '为了更好的保护你的权益以及履行监管要求，请你在使用前务'
                        '必阅读',
                    children: [
                      TextSpan(
                        text: '《豆瓣个人信息保护政策》',
                        style: const TextStyle(color: CustomColors.paimary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint('《豆瓣个人信息保护政策》');
                          },
                      ),
                      const TextSpan(
                        text: '，并特向你说明如下:\n'
                            '1.为向您提供基本服务，我们会遵守正当、合法、必要的原则收集'
                            '和使用必要的信息。\n'
                            '2.为了向你提供发布信息、周边活动等服务，基于你的授权，我们'
                            '会收集和使用你的位置和设备等个人信息。\n'
                            '3.上述权限及摄像头、相册、GPS等敏感权限均不会默认或强制开启'
                            '收集信息。\n'
                            '4.我们已使用符合业界标准的安全防护措施保护你的个人信息。',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: CustomColors.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadowColor: Colors.white,
                      ),
                      onPressed: () {
                        context.push('/user/login/home');
                      },
                      child: const Text(
                        '同意',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.go('/user/login/no_login');
                  },
                  child: const Text(
                    '不同意并退出应用',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
