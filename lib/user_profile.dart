import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final List<MenuRowData> FirstMenuRow = [
    MenuRowData(Icons.favorite_outline, "Избранное"),
    MenuRowData(Icons.call, "Звонки"),
    MenuRowData(Icons.computer, "Устройства"),
    MenuRowData(Icons.folder, "Папки")
  ];
  final List<MenuRowData> SecondMenuRow = [
    MenuRowData(Icons.notifications, "Уведомления и звуки"),
    MenuRowData(Icons.privacy_tip, "Конфиденциальность"),
    MenuRowData(Icons.date_range, "Данные и память"),
    MenuRowData(Icons.brush, "Оформление"),
    MenuRowData(Icons.language, "Язык"),
  ];
  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: Text("Test app"),
            backgroundColor: Colors.blue,
          ),
          body:Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _UserInfo(),
                SizedBox(height: 30,),
                _MenuWidget(menuRow: FirstMenuRow),
                SizedBox(height: 30,),
                _MenuWidget(menuRow: SecondMenuRow)
              ],
            )
          )
        ),
      ),
    );
  }
}

class MenuRowData{
  final IconData icon;
  final String text;
  MenuRowData(this.icon, this.text);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  _MenuWidget({super.key, required this.menuRow});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList()
      ),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;
  const _MenuWidgetRow({
    super.key,
    required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(data.icon),
          SizedBox(width: 15,),
          Expanded(child: Text(data.text)),
          Icon(Icons.chevron_right),
          Divider(height: 1,)
        ],
      ),
    );
  }
}


class _UserInfo extends StatelessWidget {
  const _UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          _AvatarWidget(),
          SizedBox(
            height: 10,
          ),
          _UserNameWidget(),
          _UserPhoneWidget(),
          _UserNickNameWidget()
        ],
      ),
    );
  }
}


class _UserNickNameWidget extends StatelessWidget {
  const _UserNickNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "@artDev",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15
      ),
    );
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "+7(965)765 90 62",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15
      ),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Artem Petrov",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 26
      ),

    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Image.asset("assets/icon.png"),
    );
  }
}
