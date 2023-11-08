import 'package:flutter/material.dart';

class MyOwnWidget extends StatefulWidget {
  const MyOwnWidget({super.key});

  @override
  State<StatefulWidget> createState() => MyOwnWidgetState();
}

class MyOwnWidgetState extends State<MyOwnWidget> {
  bool _isShapeCircle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Own Title"),
      ),
      body: GestureDetector(
        onTap: () => setState(() {
          _isShapeCircle = !_isShapeCircle;
        }),
        child: Container(
          decoration: BoxDecoration(
              shape: _isShapeCircle ? BoxShape.circle : BoxShape.rectangle,
              color: _isShapeCircle ? Colors.lime : Colors.lightGreen),
          alignment: Alignment.center,
          child: const Text('Hello World',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.black, fontSize: 40)),
        ),
      ),
    );
  }
}

/**
 * Ի՞նչ ա Widget ը
 *
 * Ստատիկ կոնֆիգուրացիա։
 * Ծառանման, իերարխիկ ստրուկտուրա։
 */

/**
 * StatelessWidget
 * Թեթևքաշային կոնֆիգուրացիա
 * Նկարագրում է UI ը, լցնում է տվյալներով։
 * Ոչ մի բան չի կառավարում, կարող ա վերանկարագրվել, միայն ծնողի հրամանով։
 */

/**
 * StatefullWidget
 * Թեթևքաշային կոնֆիգուրացիա, չփոփոխվող, ոչ մի բան չի կարող։
 * State-ծանրքաշային, կարող է փոփոխվել։ State ը առանձին կլասս է, որի օբյեկտը ՉԻ ՎԵՐՍՏԵՂԾՎՈՒՄ վերանկարվելուց։
 * state ից կարող ենք կառավարել նկարվելու պռոցեսը setState ի օգնությամբ
 * state ը ունի իր lifecycle ը, որի իրադարձություններին կարելի է արձագանքել։
 *
 */

/// State LifeCycle
///
/// initState
/// աշխատում ա մեկ անգամ ինիցիալիզացիայի ժամանակ.
/// աշխատում ա միանգամից state ի օբյեկտ ստեղծվելուց հետո
/// կարևոր ա իմանալ նաև, որ initState ում մենք դոստուպ չունենք context ին.
///
/// didChangeDependencies
/// մի անգամ աշխատում ա միանգամից initState ից հետո
/// և հետո, աշխատում ա երբ վերևի widget ներից, որոնցից կախում ունի, ինչ որ ծանուցում ա ստանում։
///    ( StatefullWidget ը կարող է կախծավություն ունենալ ուրիշ widget ներից, որոնք գտնվում են ծառում ավելի վերև
///    և երբ իրենց ((վերևի widget ներում)) փոփոխվում են տվյալներ, կանչվում է didChangeDependencies state ի lifecycle ում)
/// didChangeDependencies ում արդեն հասանելիություն ունենք context ին.
///
/// didUpdateWidget
/// ամեն անգամ երբ state ի համախատասխան widget ը update ա լինում։
///    (օրինակ երբ widget ունենք, որը ընդունում ա String, և կանչում ենք այդ Widget ը , նոր ((ուրիշ String)) տալով )
///
/// setState
/// վերանկարագրելու հրամանն է
///
/// build
/// ամեն անգամ վերանկարելու կանչից հետո միշտ կանչվում է build ֊ը
///
/// dispose
/// ծառից ջնջվելուց կանչվում է dispose
///

class StatefulLifecycle extends StatefulWidget {
  final String text;

  const StatefulLifecycle({super.key, required this.text});

  @override
  State<StatefulWidget> createState() => _StatefulLifecycleState();
}

class _StatefulLifecycleState extends State<StatefulLifecycle> {
  late bool _isShapeCircle;

  @override
  void initState() {
    super.initState();
    print('initState');
    _isShapeCircle = false;
    /**
     * Ներքևի կոդով կարեղ ենք callback ստանալ միանգամից հենց առաջին frame ը նկարվի վերացնի.
     * @timeStamp տալիս ա հստակ ժամանակը, թե երբ է frame ը նկարվել.
     * բայց սա օգտագործելը չի խրախուսվում, ոնց որ android ում addViewOnThreeObserver ը.
     */
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print('first frame has been rendered');
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('initState');
  }

  @override
  void didUpdateWidget(covariant StatefulLifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget was $oldWidget, now ${widget.text}');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('setState');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Own Title"),
      ),
      body: GestureDetector(
        onTap: () => setState(() {
          _isShapeCircle = !_isShapeCircle;
        }),
        child: Container(
          decoration: BoxDecoration(
              shape: _isShapeCircle ? BoxShape.circle : BoxShape.rectangle,
              color: _isShapeCircle ? Colors.lime : Colors.lightGreen),
          alignment: Alignment.center,
          child: const Text('Hello World',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.black, fontSize: 40)),
        ),
      ),
    );
  }
}

/**
 * InheritedWidget
 * տրամադրում ա տվյալներ, բայց ոչ մի բան չի նկարում, ինքը "նկարող" չունի
 *
 *  Լուծում ա տվյալները կանստրուկտորով փոխանցելու խնդիրը-կոդը շատ հեշտացնելով
 *  ծառի մեջ ներքևում գտնվող widget ների համար կարա լինի հասանելի dependOnInheritedWidgetOfExactType<T>(BuildContext context)
 *  մեթոդի միջոցով.
 *
 *  կարող է տեղեկացնել ծառում ավելի ներքև գտնվող widget ներին, իր տվյալների փոփոխման մասին, որի արդյունքում էլ
 *  ծառի ներքևում գտնվող widget ները կարող են վերանկարվել
 */

/// Widget ը widget ի մեջ.

class RootLevelWidget extends StatelessWidget {
  final String title;

  const RootLevelWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Many Levels'),
        ),
        body: SecondLevelWidget(title: title),
      );
}

class SecondLevelWidget extends StatelessWidget {
  final String title;

  const SecondLevelWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      HelloWorldDecorationWidget(title: title);
}

class HelloWorldDecorationWidget extends StatelessWidget {
  final String title;

  const HelloWorldDecorationWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
        alignment: Alignment.center,
        child: HelloWorldTitleOnlyWidget(title: title),
      );
}

class HelloWorldTitleOnlyWidget extends StatelessWidget {
  final String title;

  const HelloWorldTitleOnlyWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Text(
    title,
    textDirection: TextDirection.ltr,
    style: const TextStyle(color: Colors.black, fontSize: 40),
  );
}

/// վերևում գրածիս մենք հասկանում ենք, որ ահավոր վատ ա 4 layer փոխանցել title ը, որ հասնի ընդեղ որտեղ որ պետք ա!
