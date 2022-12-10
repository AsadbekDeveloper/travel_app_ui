import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../providers/data_provider.dart';
import '../widgets/category_item.dart';
import '../widgets/place_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<DataProvider>(context).getDataByIndex(selectedIndex);
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'O\'zbekistonni bilib oling!',
            style: mainHeader,
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: (() => setState(() {
                      selectedIndex = index;
                    })),
                child: CategoryItem(
                    title: categoryList[index],
                    isSelected: index == selectedIndex),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: ListView.builder(
                clipBehavior: Clip.antiAlias,
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) => PlaceCard(
                  index: index,
                  type: data[index].type,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
