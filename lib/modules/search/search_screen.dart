import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SeacrhScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value)
                  {
                    if(value.isEmpty)
                    {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(child: ConditionalBuilder(
                condition: list.length > 0,
                builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildArticleItem(list[index], context),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: 10,
                ),
                fallback: (context) => Container(),
              ),),
            ],
          ),
        );
      },
    );
  }
}
