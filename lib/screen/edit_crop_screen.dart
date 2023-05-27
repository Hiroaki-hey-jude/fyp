import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/model/category_model/category_model.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:fyp/state/editcrop_state.dart';
import 'package:fyp/state/sell_state.dart';

class EditCropScreen extends StatelessWidget {
  const EditCropScreen({super.key, required this.cropId});
  final String cropId;

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(editcropStateProvider(cropId));
    // final notifier = ref.watch(editcropStateProvider(cropId).notifier);
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
    final TextEditingController cropTitleEditingController =
        TextEditingController();
    final TextEditingController descriptionEditingController =
        TextEditingController();
    final TextEditingController priceEditingController =
        TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.amber,
        ),
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(editcropStateProvider(cropId));
            final notifier = ref.watch(editcropStateProvider(cropId).notifier);
            return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                  : SingleChildScrollView(
                      child: Form(
                        key: formKey,
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
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.1,
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        // await notifier.pickImage();
                                      },
                                      child: Stack(
                                        children: [
                                          const Positioned(
                                            top: 0,
                                            left: 3,
                                            child: Text(
                                              '1',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: state.imagefiles.isNotEmpty
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: FileImage(
                                                          state.imagefiles[0],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(state
                                                                  .cropModel!
                                                                  .picsOfCrops![
                                                              0])),
                                                    ),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  state.cropModel!.picsOfCrops!.length >= 2
                                      ? CameraBox(
                                          index: 2,
                                          cropId: cropId,
                                        )
                                      : CameraBoxWithoutPic(
                                          index: 2,
                                          cropId: cropId,
                                        ),
                                  state.cropModel!.picsOfCrops!.length >= 3
                                      ? CameraBox(
                                          index: 3,
                                          cropId: cropId,
                                        )
                                      : CameraBoxWithoutPic(
                                          index: 3,
                                          cropId: cropId,
                                        ),
                                  state.cropModel!.picsOfCrops!.length == 3
                                      ? InkWell(
                                          onTap: () {
                                            notifier.pickImage();
                                          },
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 0.1,
                                              ),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Center(
                                                child: Icon(
                                                    Icons.camera_alt_rounded),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container()
                                  // state.numberOfPictures == 3
                                  //     ? CameraBox(index: 4, cropId: cropId)
                                  //     : Container(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            const GreyDescription(title: '商品の詳細'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('カテゴリーを選んでください:'),
                                  const SizedBox(width: 30),
                                  Consumer(builder: (context, ref, child) {
                                    final state1 = ref
                                        .watch(editcropStateProvider(cropId));
                                    final notifier1 = ref.watch(
                                        editcropStateProvider(cropId).notifier);
                                    return DropdownButton(
                                      value: state1.selectedCategory,
                                      // icon: const Icon(Icons.arrow_downward),
                                      style:
                                          const TextStyle(color: Colors.black),
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
                                      // onChanged: (String? value) {},
                                      onChanged: (String? value) {
                                        notifier1.changeCategory(value!);
                                      },
                                    );
                                  }),
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
                                      enableInteractiveSelection: true,
                                      controller: cropTitleEditingController,
                                      cursorColor: Colors.black,
                                      decoration:
                                          sellTextInputDecoration.copyWith(
                                        hintText: state.originalTitle,
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
                                      controller: descriptionEditingController,
                                      maxLines: 5,
                                      cursorColor: Colors.black,
                                      decoration:
                                          sellTextInputDecoration.copyWith(
                                        hintText: state.orginalDescription,
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
                              padding:
                                  const EdgeInsets.only(left: 20, right: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            const SizedBox(height: 20),
                            const GreyDescription(title: '販売価格'),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              child: Container(
                                color: Colors.grey[300],
                                child: TextFormField(
                                  controller: priceEditingController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  cursorColor: Colors.black,
                                  decoration: sellTextInputDecoration.copyWith(
                                    hintText: state.cropModel!.price,
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
                                bottom: 5,
                                left: 3,
                                right: 3,
                                top: 10,
                              ),
                              child: Container(
                                color: Colors.red,
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      notifier.onEditButton(
                                        cropTitleEditingController.text,
                                        descriptionEditingController.text,
                                        priceEditingController.text,
                                        context,
                                      );
                                    }
                                  },
                                  child: const Text(
                                    '編集して投稿',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                                left: 3,
                                right: 3,
                                top: 0,
                              ),
                              child: Container(
                                color: Colors.red,
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: () {
                                    notifier.onDeliteCropPost(cropId, context);
                                  },
                                  child: const Text(
                                    '削除',
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
          },
        ),
      ),
    );
  }
}

class CameraBox extends ConsumerWidget {
  CameraBox({
    super.key,
    required this.index,
    required this.cropId,
  });

  final int index;
  final String cropId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editcropStateProvider(cropId));
    final notifier = ref.watch(editcropStateProvider(cropId).notifier);
    return Container(
      margin: const EdgeInsets.all(10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.1,
        ),
      ),
      child: state.imagefiles.isEmpty
          ? InkWell(
              onTap: () async {
                await notifier.pickImage();
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 3,
                    child: Text(
                      index.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: state.imagefiles.isEmpty
                        ? Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(state
                                      .cropModel!.picsOfCrops![index - 1])),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(state.imagefiles[index - 1]),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}

class CameraBoxWithoutPic extends ConsumerWidget {
  CameraBoxWithoutPic({
    super.key,
    required this.index,
    required this.cropId,
  });

  final int index;
  final String cropId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editcropStateProvider(cropId));
    final notifier = ref.watch(editcropStateProvider(cropId).notifier);
    return InkWell(
      onTap: () {
        notifier.pickImage();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
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
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: state.imagefiles.isEmpty
                  ? const Icon(Icons.camera_alt_rounded)
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(state.imagefiles[index - 1]),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
