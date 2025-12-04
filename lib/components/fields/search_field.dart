import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  
  final TextEditingController searchFieldTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    searchFieldTextEditingController.addListener((){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      width: size.width,
      height: size.height * .07,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.shade300,
        ),
        borderRadius: .circular(10),
      ),
      child: Center(
        child: TextField(
          controller: searchFieldTextEditingController,
          decoration: InputDecoration(
            border: .none,
            icon: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(
                CupertinoIcons.search,
                size: 30,
                color: Colors.grey,
              ),
            ),
            hintText: 'نام آموزش، دسته بندی، برچسب و ...',
            hintStyle: textTheme.labelMedium,
            labelText: 'جستجو کنید',
            labelStyle: textTheme.labelMedium!.copyWith(
              color: Colors.grey
            ),
            suffixIcon: searchFieldTextEditingController.text != ''
            ? IconButton(
              onPressed: () {
                searchFieldTextEditingController.clear();
                FocusScope.of(context).unfocus();
              },
              icon: Icon(Icons.delete),
            )
            : SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}