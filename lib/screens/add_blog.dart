import 'package:blog_app/helper/screen.dart';
import 'package:blog_app/widget/button/textfield/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final formKey = GlobalKey<FormState>();
  List<String> categories = ["technology", "ai", "cloud", "robotic", "iot"];
  TextEditingController titleFieldController = TextEditingController();
  int? value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.bottomRight,
          child: Text("Post"),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Image"),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: context.getHight(value: .2),
                  child: const Card(
                    child: Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ),
              const Text("Title"),
              Card(
                child: CustomTextFormField(
                  hintText: "Enter your blog title",
                  onChanged: (p0) {},
                  userTextcontroller: titleFieldController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                ),
              ),
              const Text("Summary"),
              Card(
                child: CustomTextFormField(
                  maxLines: 4,
                  hintText: "Give a brief summary about your blog ",
                  onChanged: (p0) {},
                  userTextcontroller: titleFieldController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                ),
              ),
              const Text("Content"),
              Card(
                child: CustomTextFormField(
                  maxLines: 7,
                  hintText: "Give a brief summary about your blog ",
                  onChanged: (p0) {},
                  userTextcontroller: titleFieldController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "write your blog here";
                    }
                    return null;
                  },
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: categories.map((category) {
                  return Container(
                    margin: const EdgeInsets.all(19),
                    child: ChoiceChip(
                      checkmarkColor: Colors.red,
                      label: Text(category),
                      onSelected: (bool selected) {
                        value = selected ? categories.indexOf(category) : null;
                        setState(() {});
                      },
                      selected: value == categories.indexOf(category),
                    ),
                  );
                }).toList()),
              ),
              const Text("Reading Minuts"),
              Card(
                child: CustomTextFormField(
                  maxLines: 1,
                  hintText: "Minutes of reading this blog",
                  onChanged: (p0) {},
                  userTextcontroller: titleFieldController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "write your blog here";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
