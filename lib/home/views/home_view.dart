import 'package:artivatic_practical/home/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static Widget providedInstance() {
    return BlocProvider(
        create: (cotext) => PostBloc()..add(GetAll()), child: HomeView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextFormField(
          decoration: InputDecoration(
              hintText: 'Search with title',
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none),
          onChanged: (txt) {
            context.read<PostBloc>().add(FilterPost(title: txt));
          },
        ),
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        return state is PostSuccess
            ? ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.posts[index].title!),
                  subtitle: Text(state.posts[index].body!),
                ),
                itemCount: state.posts.length,
                separatorBuilder: (context, count) =>
                    Divider(thickness: 1, height: 5),
              )
            : Center(child: CircularProgressIndicator());
      }),
    );
  }
}
