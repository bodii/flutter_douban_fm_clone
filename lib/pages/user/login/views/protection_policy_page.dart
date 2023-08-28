import 'package:flutter/material.dart';
import 'package:flutter_douban_fm_clone/common/custom_color.dart';
import 'package:go_router/go_router.dart';

class ProtectionPolicyPage extends StatelessWidget {
  const ProtectionPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.paimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text('个人信息保护政策', style: TextStyle(color: Colors.black45)),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Text(
            '''
豆瓣个人信息保护政策

引言

豆瓣（以下称“我们”）深知个人信息对你的重要性，并会全力保护你的个人信息安全。我们致力于维持你对我们的信任，恪守以下原则，保护你的个人信息：合法原则、正当原则、必要原则、诚信原则、目的限制原则、公开透明原则、准确性原则、责任原则、安全原则等。同时，我们承诺，将按业界成熟的安全标准，采取必要的安全保护措施来保护你的个人信息。

豆瓣网及相关产品由北京豆网科技有限公司及其关联公司提供运营和服务。《豆瓣个人信息保护政策》（以下简称“本政策”）适用于豆瓣的所有产品或服务。如豆瓣某类产品或服务单独设有个人信息保护政策（如《豆瓣阅读隐私政策》），则该类产品或服务适用相应的个人信息保护政策。

在使用豆瓣各项产品或服务前，请你务必仔细阅读并透彻理解本政策，并做出你认为适当的选择。但你同意本政策并不代表只要你开始使用我们的产品或服务，我们就会处理本政策中涉及的全部个人信息。我们仅在你使用某项业务功能时，处理与该业务功能相关的个人信息，以实现向你提供产品或服务的目的。

本政策中与你权利存在重大关系的内容，我们采用加粗的形式提示你注意，请重点阅读。

本政策将帮助你了解以下内容：

1. 我们如何收集和使用你的个人信息

2. 我们如何使用Cookie和同类技术

3. 我们如何对外提供你的个人信息

4. 我们如何存储你的个人信息

5. 我们如何保护你的个人信息

6. 你的权利

7. 我们如何保护未成年人的个人信息

8. 我们如何保护逝者的个人信息

9. 本政策如何更新

10. 如何联系我们

11. 争议解决
……
        ''',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
