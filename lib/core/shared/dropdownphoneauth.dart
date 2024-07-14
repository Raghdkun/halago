import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownListAuth extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownSelectedname;
  final TextEditingController dropdownSelectedId;
  final TextEditingController formController ; 
  final String image ; 

  const CustomDropDownListAuth(
      {super.key,
      this.title,
      required this.listdata,
      required this.dropdownSelectedname,
      required this.dropdownSelectedId, 
      required this.formController, required this.image});

  @override
  State<CustomDropDownListAuth> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomDropDownListAuth> {
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        
          isDismissible: true,
          bottomSheetTitle: Text(
            widget.title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          submitButtonChild: const Text(
            'Done',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          data: widget.listdata,

          selectedItems: (List<dynamic> selectedList) {
            SelectedListItem selectedListItem = selectedList[0];
            widget.dropdownSelectedname.text = selectedListItem.name;
            widget.dropdownSelectedId.text = selectedListItem.value!;
          }),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1, 
          child: TextFormField(
            readOnly: true,
            controller: widget.dropdownSelectedname,
            cursorColor: Colors.black,
            onTap: () {
              FocusScope.of(context).unfocus();
              onTextFieldTap();
            },
            decoration: InputDecoration(
              filled: true,
              // fillColor: Colors.black12,
              contentPadding:
                  const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
              hintText: widget.dropdownSelectedname.text == ""
                  ? widget.title
                  : widget.dropdownSelectedname.text,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width:5), 
        Expanded(
          flex:4, 
          child: TextFormField(
            controller: widget.formController, 
            decoration: InputDecoration(
              filled: true,
              // fillColor: Colors.black12,
              contentPadding:
                  const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
              
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
          )
        )
        
      ],
    );
  }
}
