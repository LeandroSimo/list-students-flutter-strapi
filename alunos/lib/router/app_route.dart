import 'package:alunos/views/create_view.dart';
import 'package:alunos/views/detaiIs_view.dart';
import 'package:alunos/views/edit_view.dart';
import 'package:alunos/views/home_view.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routes = {
    HomeView.route: (_) => HomeView(),
    CreateView.route: (_) => CreateView(),
    DetailsView.route: (_) => DetailsView(),
    EditView.route: (_) => const EditView()
  };
}
