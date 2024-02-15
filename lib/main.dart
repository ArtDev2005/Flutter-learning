import 'package:flutter/material.dart';

void main(){
  const app = App();
  runApp(app);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: CustomMultiChildLayout(
            delegate: OwnMultiChildLayoutDelegate(),
            children: [
              LayoutId(
                id: 1,
                child: Text(
                  "left"
                )
              ),
              LayoutId(
                  id: 2,
                  child: Text(
                      "middle"
                  )
              ),
              LayoutId(
                  id: 3,
                  child: Text(
                      "right"
                  )
              ),
            ],
          ),
        )
      ),
    );
  }
}


class OwnMultiChildLayoutDelegate extends MultiChildLayoutDelegate{

  @override
  Size getSize(BoxConstraints constraints){
    return Size(constraints.biggest.width, 100);
  }

  @override
  void performLayout(Size size) {
    if (hasChild(1) & hasChild(2) & hasChild(3)){
      final MinOtherElement = 50;
      final firstElementMaxWidth = size.width - MinOtherElement * 2;
      final firstElementSize = layoutChild(1, BoxConstraints.loose(Size(firstElementMaxWidth, size.height)));

      final thirdElementMaxWidth = size.width - firstElementSize.width - MinOtherElement;
      final thirdElementSize = layoutChild(2, BoxConstraints.loose(Size(thirdElementMaxWidth, size.height)));

      final secondElementMaxWidth = size.width - firstElementSize.width - thirdElementSize.width;
      final secondElementSize = layoutChild(3, BoxConstraints.loose(Size(secondElementMaxWidth, size.height)));

      final firstElementYOffset = size.height / 2 - firstElementSize.height / 2;
      final secondElementYOffset = size.height / 2 - secondElementSize.height / 2;
      final thirdElementYOffset = size.height / 2 - thirdElementSize.height / 2;

      final thirdElementXOffset = size.width - thirdElementSize.width;

      var secondElementXOffset = size.width / 2 - secondElementSize.width / 2;

      if (firstElementSize.width > secondElementXOffset){
        secondElementXOffset = firstElementSize.width;
      }
      else if (thirdElementXOffset < secondElementXOffset + secondElementSize.width){
        secondElementXOffset = thirdElementXOffset - secondElementSize.width;
      }

      positionChild(1, Offset(0, firstElementYOffset));
      positionChild(2, Offset(secondElementXOffset, secondElementYOffset));
      positionChild(3, Offset(thirdElementXOffset, thirdElementYOffset));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
  
}


class OwnCustomSingleChildLayout extends SingleChildLayoutDelegate{
  @override
  Size getSize(BoxConstraints constraints){
    return Size(constraints.biggest.width, 100);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints){
    return BoxConstraints.tight(Size(50, 50));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize){
    final y_offset = size.height / 2 - childSize.height / 2;
    return Offset(childSize.width, y_offset);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate){
    throw true;
  }
}
