class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<Signup> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('')

      ),

      body:Column(
          children:[
            Column(
              children:[
            Text('Welcome', style: TextStyle(fontSize: 30.0),),
            Text('Sign Up', style: TextStyle(fontSize: 23.0),),
          ]),



          TextField(
              decoration: InputDecoration(
                labelText: 'FirstName',
                hintText : 'Mary',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),


            TextField(
              decoration: InputDecoration(
                labelText: 'LastName',
                hintText : 'Kamau',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),



            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText : 'example@gmail.com',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Phone',
                hintText : '254721465789',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Course',
                hintText : 'Bachelor of Science in Computer Science',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Lab',
                hintText : 'Lab 9',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Profile Image',
                hintText : 'url',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Github',
                hintText : 'url',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            TextField(
              decoration: InputDecoration(
                labelText: 'Address',
                hintText : 'P.O. BOX 45763 Muranga',
                suffixIcon : Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            )

          ]

          ),
          

            )
          
      
    
  }


      
      
    



}
