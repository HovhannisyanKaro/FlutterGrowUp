void main() {
  final bot = ChatBot('1');

  if(bot is ElevatedClient){
    print(true);
  }else{
    print(false);
  }

  bot.sendElevatedMessage('hello');

  // a(ChatBot(''));
  //
  // b(ChatBot(''));
}

void a(Admin admin){

}

void b(ElevatedClient elevatedClient){

}

class User {
  final String firstName;
  final String lastName;

  User(this.firstName, this.lastName);
}

class Admin extends User with ElevatedClient{
  final double specialAdminField;

  Admin(
      {required this.specialAdminField,
      required String firstName,
      required String lastName})
      : super(firstName, lastName);

  void sendElevatedMessage(String text) {
    print('Sending message with an elevated importance: $text');
  }
}

class ChatBot with ElevatedClient{
  final String id;

  ChatBot(this.id);

  void sendElevatedMessage(String text) {
    print('Sending message with an elevated importance: $text');
  }
}

mixin  ElevatedClient {
  void sendElevatedMessage(String text) {
    print('Sending message with an elevated importance: $text');
  }
}
/**
 * What is the different with mixins ??
 *  Mixins do not perform any sort of inheritance, this means
 *  that even though admin and chatbot are mixed in with elevated client, you can not do something like instantiating a chat bot
 *
 * Admin is not an elevatedClient
 * You can think that this ElevatedClient is mixin as sort of copying this method and pasted it into classes.
 * It's just copies and pastes members and methods into the classes which is use it.
 * But admin is not an elevatedClient and ChatBot is not an elevatedClient
 */
