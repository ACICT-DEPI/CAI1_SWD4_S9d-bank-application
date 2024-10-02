import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';


Set<String> uniqueNumbers = {};
final FirebaseFirestore fireStore = FirebaseFirestore.instance;

Future<String> createUniqueAccountNumber() async{
  print("function create is called");
  Random randomGenerator = Random();
  if(uniqueNumbers.isEmpty){
    await retrieveAccountNumbers();
  }
  print("is creating number");
  String uniqueNumberGenerated = "";
  int digitsLength = 0;
  int generatedDigit;
  do{
    while(digitsLength < 12){
      generatedDigit = randomGenerator.nextInt(10);
      uniqueNumberGenerated += generatedDigit.toString();
      digitsLength++;
    }
  }while(uniqueNumbers.contains(uniqueNumberGenerated));
  uniqueNumbers.add(uniqueNumberGenerated);

  await fireStore.collection('accountNumbers').add({
    'number': uniqueNumberGenerated,
  });

  return uniqueNumberGenerated;
}

Future<void> retrieveAccountNumbers() async{
  print("retrieving numbers");
  try{
    QuerySnapshot querySnapshot = await fireStore.collection('accountNumbers').get();

    for(var doc in querySnapshot.docs){
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if(data.containsKey('number')){
        uniqueNumbers.add(data['number']);
      }
    }
  }catch (e){
    print("error fetching account numbers");
  }

}