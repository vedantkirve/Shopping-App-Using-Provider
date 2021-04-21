import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = 'edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Title",
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
              ),
              TextFormField(
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                decoration: InputDecoration(
                  labelText: "Price",
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
              ),
              TextFormField(
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Description",
                ),
                focusNode: _descriptionFocusNode,
                // textInputAction: TextInputAction.next,
                // onFieldSubmitted: (_) {
                //   FocusScope.of(context).requestFocus(_priceFocusNode);
                // },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
