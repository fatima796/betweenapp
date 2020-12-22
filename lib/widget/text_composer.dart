import 'package:flutter/material.dart';
class TextComposer extends StatefulWidget{
  final Function(String) sendCallBack;
  const TextComposer({Key key , this.sendCallBack, sendCallback}) : super(key:key);
  @override
  _TextComposerState createState()=>_TextComposerState();
}
class _TextComposerState extends State<TextComposer>with
    TickerProviderStateMixin {
  final TextEditingController _textEditingController=TextEditingController();
  bool _isComposing =false;
  void _handleSubmitted(String text){
    _textEditingController.clear();
    setState(() {
      _isComposing=false;
      widget.sendCallBack(text);
    });
  }
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color : Theme.of(context).cardColor,
      ),

      child: IconTheme (
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          child:Row(
            children:[
              IconButton(
                icon: Icon(Icons.photo),
              ),
              Flexible(
                child: TextField(
                  onSubmitted: _handleSubmitted,
                  controller: _textEditingController,
                  onChanged:(String text){
                    setState((){
                      _isComposing=text.length>0;
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _isComposing ? () => _handleSubmitted(_textEditingController.text)
                    :null,
              ),

            ],
          ),
        ),
      ),
    );
  }

}