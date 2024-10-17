import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'dart:async';

class SearchBox extends StatefulWidget {
  final TextEditingController cntlr;

  const SearchBox({super.key, required this.cntlr});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    widget.cntlr.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 900), () {
      if (widget.cntlr.text.isNotEmpty) {
        context.read<HomeScreenBloc>().add(SearchBooksEvent(widget.cntlr.text));
      }
    });
  }

  @override
  void dispose() {
    widget.cntlr.removeListener(_onSearchChanged);
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: appcolor.borderColor,
      ),
      child: TextFormField(
        controller: widget.cntlr,
        style: Fontstyles.ContentTextStyle(context),
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(Icons.search, size: 20),
          prefixIconColor: appcolor.secondaryColor,
          hintText: "Search..",
          hintStyle: Fontstyles.lightTextStyle(context),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
      ),
    );
  }
}
