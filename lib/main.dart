import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Theme/theme.dart';
import 'package:task_manager/Theme/theme_provider.dart';

import 'Home.dart';


void main ()
{
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp( {super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      home: Home(),
    );

      }
}

