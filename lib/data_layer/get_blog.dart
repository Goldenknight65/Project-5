import 'package:blog_app/model/blog_model.dart';
import 'package:get_storage/get_storage.dart';

class GetBlog {
  List<BlogModel> blogs = [];

  GetBlog() {
    loadblog();
  }
  final box = GetStorage();

  void addblog(BlogModel blog) {
    blogs.add(blog);
    saveTweat();
  }

  void saveTweat() {
    List<Map<String, dynamic>> map = [];
    for (BlogModel tweat in blogs) {
      map.add(tweat.toJson());
    }
    box.write("blog", map);
  }

  void loadblog() {
    if (box.hasData('blog')) {
      List<Map<String, dynamic>> data =
          List.from(box.read('blog')).cast<Map<String, dynamic>>();
      for (var element in data) {
        blogs.add(BlogModel.fromJson(element));
      }
    }
  }

  void delete(BlogModel blog) {
    blogs.remove(blog);
    List<Map<String, dynamic>> map = [];
    for (BlogModel blog in blogs) {
      map.add(blog.toJson());
    }
    box.write("blog", map);
  }
}
