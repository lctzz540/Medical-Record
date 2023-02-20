import 'package:flutter/cupertino.dart';
import 'package:medicalrecord/form/administrative.dart';
import 'package:medicalrecord/widgets/treeview.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({Key? key}) : super(key: key);
  final Map<String, List<String>> _items = const {
    'Bệnh án nội khoa': [
      'Nội tim mạch',
      'Nội hô hấp',
      'Nội tiêu hoá',
      'Nội thận niệu',
      'Nội thần kinh',
      'Nội nội tiết',
      'Nội cơ xương khớp',
      'Da liễu'
    ],
    'Bệnh án ngoại khoa': [
      'Ngoại lồng ngực',
      'Ngoại tiêu hoá',
      'Ngoại thận',
      'Ngoại thần kinh',
      'Chấn thương chỉnh hình'
    ],
    'Bệnh án sản khoa': [],
    'Bệnh án nhi khoa': [],
    'Bệnh án nhiễm': [],
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text('Collections'),
            trailing: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => PatientForm(),
                  ),
                );
              },
              child: const Icon(CupertinoIcons.add_circled),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TreeView(
                  items: _items,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
