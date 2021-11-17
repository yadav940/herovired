import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herovired/model/second_page_model.dart';
import 'package:herovired/ui/usefull/palette.dart';
import 'package:herovired/ui/views/base/base.dart';

class AppExpandeWiget extends StatefulWidget {
  bool isExpanded = false;
  final SecondModel secondModel;
  final int index;

  AppExpandeWiget(this.secondModel, this.index);

  @override
  _ExpandedState createState() => _ExpandedState();
}

class _ExpandedState extends State<AppExpandeWiget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Palette.colorBorders, width: 1.0),
                  color: Palette.colorBorders,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: _title(),
              ),
              //Text('mdkkd')
              widget.isExpanded
                  ? ListView.builder(
                      itemCount: widget.secondModel.modules?.length ?? 0,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child:
                              _iteam(widget.secondModel.modules![index], index),
                        );
                      },
                    )
                  : Container()
            ],
          ),
        ),
      ],
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child:
                Text('${widget.index + 1}. ${widget.secondModel.name ?? ''}')),
        InkWell(
          onTap: () {
            setState(() {
              widget.isExpanded = !widget.isExpanded;
            });
          },
          child: Row(
            children: [
              widget.secondModel.uservisible ?? false ? getTrick : getUnTrick,
              const SizedBox(
                width: 8,
              ),
              Transform.rotate(
                angle: widget.isExpanded ? (22 / (7 * 2)) : (-22 / (7 * 2)),
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Palette.colorPrimaryText,
                  size: 15,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _iteam(Modules modul, int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Row(
              children: [
                Image.network(
                  modul.modicon ?? '',
                  errorBuilder: (context, url, error) {
                    return Icon(Icons.error);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    '${widget.index + 1}.${i + 1} ${modul.name ?? ''}',
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.isExpanded = !widget.isExpanded;
              });
            },
            child: modul.uservisible ?? false ? getTrick : getUnTrick,
          )
        ],
      ),
    );
  }

  Widget get getTrick => Icon(
        Icons.check_circle_outline,
        color: Palette.colorUserBackgroundPink,
      );

  Widget get getUnTrick => Icon(
        Icons.circle_outlined,
        color: Palette.colorUserBackgroundPink,
      );
}
