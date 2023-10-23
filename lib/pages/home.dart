import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diets_models.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(children: [
          _searchField(),
          const SizedBox(
            height: 40,
          ),
          _categoriesSection(),
          const SizedBox(
            height: 40,
          ),
          _dietsSection(),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Popular',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                itemCount: popularDiets.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Banner(popularDietModel: popularDiets[index]);
                },
              )
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ]));
  }

  Column _dietsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\n for Diet',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                  width: 210,
                  decoration: BoxDecoration(
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].iconPath),
                      Column(
                        children: [
                          Text(
                            diets[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          Text(
                            diets[index].level +
                                ' | ' +
                                diets[index].duration +
                                ' | ' +
                                diets[index].calorie,
                            style: const TextStyle(
                                color: Color(0xff7b6f72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                                color: diets[index].viewIsSelected
                                    ? Colors.white
                                    : Colors.purple,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              diets[index].viewIsSelected
                                  ? const Color(0xff9dceff)
                                  : Colors.transparent,
                              diets[index].viewIsSelected
                                  ? const Color(0xff92a3fd)
                                  : Colors.transparent
                            ]),
                            borderRadius: BorderRadius.circular(50)),
                      )
                    ],
                  ));
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        )
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Category',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
            height: 120,
            child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 25,
                    ),
                itemBuilder: (context, index) {
                  return Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: categories[index].boxColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.8),
                                  child: SvgPicture.asset(
                                      categories[index].iconPath),
                                )),
                            Text(
                              categories[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 14),
                            )
                          ]));
                }))
      ],
    );
  }

  Container _searchField() {
    return Container(
        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: const Color(0xFF1D1617).withOpacity(0.11),
              blurRadius: 40,
              spreadRadius: 0.0)
        ]),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Search Pancake',
              hintStyle: const TextStyle(
                color: Color(0xFFDDDADA),
                fontSize: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .end, //Alinha o objeto para a direita(final)
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 0.1,
                        indent: 10, //Creates space from the top
                        endIndent: 10, //Create space from the bottom
                      ), //Cria uma linha vertical a dividir
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none)),
        ));
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Breakfast',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          child:
              SvgPicture.asset('assets/icons/arrow.svg', height: 20, width: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 37,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            child: SvgPicture.asset('assets/icons/dots.svg',
                height: 20, width: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    super.key,
    required this.popularDietModel,
  });

  final PopularDietsModel popularDietModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            popularDietModel.iconPath,
            width: 65,
            height: 65,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                popularDietModel.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 16),
              ),
              Text(
                  popularDietModel.level +
                      ' | ' +
                      popularDietModel.duration +
                      ' | ' +
                      popularDietModel.calorie,
                  style: const TextStyle(
                      color: Color(0xff7b6f72),
                      fontSize: 13,
                      fontWeight: FontWeight.w400)),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff1d1617).withOpacity(
                  0.07,
                ),
                offset: const Offset(0, 10),
                blurRadius: 40,
                spreadRadius: 0)
          ]),
    );
  }
}
