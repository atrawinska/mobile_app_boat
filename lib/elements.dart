import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///File with theme elements like texts, colours
///
///
///
///
///text widget
///defined colour
///box withj question - what this will be?
///

Color customPink = const Color.fromARGB(255, 184, 95, 148);
Color customLightPink = const Color.fromARGB(250, 255, 220, 254);
Color customRed = const Color.fromARGB(255, 255, 107, 109);
Color customGreen = const Color.fromARGB(255, 50, 196, 27);
Color customBlack = const Color.fromARGB(255, 0, 0, 0);
Color customWhite = const Color.fromARGB(255, 255, 255, 255);
Color customGrey = const Color.fromARGB(255, 218, 218, 218);



class CustomText extends StatelessWidget{

  String words = '';
  double size = 10.0;
  Color ownColor ;
  FontWeight ownFontWeight;
  TextAlign alignText;

CustomText(this.words, {this.size = 10.0,this.ownColor = Colors.white, this.ownFontWeight = FontWeight.w600, this.alignText = TextAlign.center, super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Text(
    
    textAlign: alignText,
    words,
    style: GoogleFonts.nunito(
        color: ownColor,
        fontSize: size, // Adjust the font size as needed
        fontWeight: ownFontWeight, // Optional: Adjust weight (normal, bold, etc.)

      ),

   );
  }
}


///A button with a question mark which if clicked shows a drawer with instructions.
class QuestionElevatedButton extends StatelessWidget{

String text = '';
  QuestionElevatedButton(this.text, {super.key});

  @override
  Widget build(BuildContext context){

    return Align( 
      alignment: Alignment.bottomRight,
      
      
      
      child: Container(
      margin: const EdgeInsets.all(16),
    
      child: 
       ElevatedButton(
    
     style: ButtonStyle(
        
        backgroundColor: WidgetStatePropertyAll(customPink),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Optional: Rounded corners
          ),
        ),
      ),



    

  onPressed: () {
            // Show bottom sheet on button press
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 600, // Set the height of the bottom sheet
                 
                  decoration: BoxDecoration(

                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: customPink,




                  ),
                  child: Container( margin: const EdgeInsets.all(10),
                    
                    child: Column( children: [
                       const SizedBox(height: 20),
                    CustomText( "Help",
                    ownColor: customWhite, size: 23,
                    ),
                    const SizedBox(height: 20),

                    DrawerText( text,
                    ownColor: customWhite, size: 20,
                    ),


                  ],



                  ) )
                );
              },);
  },
    
     child: Icon(Icons.question_mark, color: customWhite)


    ),





    )
    );
  }

  


}





///Custom text only for the navigation bars: (new) text overflow
class DrawerText extends StatelessWidget{

  String words = '';
  double size = 10.0;
  Color ownColor ;
  FontWeight ownFontWeight;
  TextAlign alignText;
DrawerText(this.words, {this.size = 10.0,this.ownColor = Colors.white, this.ownFontWeight = FontWeight.w600, this.alignText = TextAlign.center, super.key});


  @override
  Widget build(BuildContext context) {
   return Text(
    textAlign: alignText,
    words,
    style: GoogleFonts.nunito(
        color: ownColor,
        fontSize: size, // Adjust the font size as needed
        fontWeight: ownFontWeight, // Optional: Adjust weight (normal, bold, etc.)
    

      ),
          softWrap: true,
          overflow: TextOverflow.visible,

   );
  }
}