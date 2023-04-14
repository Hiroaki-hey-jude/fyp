import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/model/category_model/category_model.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:fyp/state/sell_state.dart';

class SellScreen extends ConsumerWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sellStateProvider);
    final notifier = ref.watch(sellStateProvider.notifier);
    final TextEditingController cropTitleEditingController =
        TextEditingController();
    final TextEditingController descriptionEditingController =
        TextEditingController();
    // final TextEditingController passwordEditingController =
    //     TextEditingController();
    final List<String> prefectures = [
      '北海道',
      '青森県',
      '岩手県',
      '宮城県',
      '秋田県',
      '山形県',
      '福島県',
      '茨城県',
      '栃木県',
      '群馬県',
      '埼玉県',
      '千葉県',
      '東京都',
      '神奈川県',
      '新潟県',
      '富山県',
      '石川県',
      '福井県',
      '山梨県',
      '長野県',
      '岐阜県',
      '静岡県',
      '愛知県',
      '三重県',
      '滋賀県',
      '京都府',
      '大阪府',
      '兵庫県',
      '奈良県',
      '和歌山県',
      '鳥取県',
      '島根県',
      '岡山県',
      '広島県',
      '山口県',
      '徳島県',
      '香川県',
      '愛媛県',
      '高知県',
      '福岡県',
      '佐賀県',
      '長崎県',
      '熊本県',
      '大分県',
      '宮崎県',
      '鹿児島県',
      '沖縄県',
    ];
    final List<String> daysForDelivery = ['1~2日で発送', '2~3日で発送', '4~7日で発送'];
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 225, 222, 222),
                // ),
                child: const Text(
                  '商品の情報を入力',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.1,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Stack(
                        children: const [
                          Positioned(
                            top: 0,
                            left: 3,
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CameraBox(index: 2),
                  CameraBox(index: 3),
                ],
              ),
              const SizedBox(height: 10),
              const GreyDescription(title: '商品の詳細'),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('カテゴリーを選んでください:'),
                    const SizedBox(width: 30),
                    DropdownButton(
                      value: state.selectedCategory,
                      // icon: const Icon(Icons.arrow_downward),
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 3,
                        color: Colors.green,
                      ),
                      items: category_list.map((category) {
                        return DropdownMenuItem<String>(
                          value: category.title,
                          child: Text(category.title),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        notifier.changeCategory(value!);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const GreyDescription(title: '商品名と説明'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[300],
                      child: TextFormField(
                        cursorColor: Colors.black,
                        decoration: sellTextInputDecoration.copyWith(
                          hintText: '商品名',
                        ),
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return '商品名を入力してください';
                          }
                        },
                      ),
                    ),
                    Container(
                      color: Colors.grey[300],
                      child: TextFormField(
                        maxLines: 5,
                        cursorColor: Colors.black,
                        decoration: sellTextInputDecoration.copyWith(
                          hintText: '商品の説明',
                        ),
                        validator: (val) {
                          if (val!.isNotEmpty) {
                            return null;
                          } else {
                            return '商品の説明を入力してください';
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const GreyDescription(title: '配送について'),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('発送元の地域:'),
                    const SizedBox(width: 30),
                    DropdownButton(
                      value: state.selectedCity,
                      // icon: const Icon(Icons.arrow_downward),
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 3,
                        color: Colors.green,
                      ),
                      items: prefectures.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        notifier.changeCity(value!);
                      },
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 40),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Text('発送までの日数:'),
              //       const SizedBox(width: 30),
              //       DropdownButton(
              //         value: '2~3日で発送',
              //         style: const TextStyle(color: Colors.black),
              //         underline: Container(
              //           height: 3,
              //           color: Colors.green,
              //         ),
              //         items: daysForDelivery.map((category) {
              //           return DropdownMenuItem<String>(
              //             value: category,
              //             child: Text(category),
              //           );
              //         }).toList(),
              //         onChanged: (String? value) {},
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 20),
              const GreyDescription(title: '販売価格'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Container(
                  color: Colors.grey[300],
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    cursorColor: Colors.black,
                    decoration: sellTextInputDecoration.copyWith(
                      hintText: '￥３００',
                    ),
                    validator: (val) {
                      if (val!.isNotEmpty) {
                        return null;
                      } else {
                        return '販売価格を入力してください';
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30,
                  left: 3,
                  right: 3,
                  top: 10,
                ),
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      '出品',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CameraBox extends StatelessWidget {
  CameraBox({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.1,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 3,
            child: Text(
              index.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
