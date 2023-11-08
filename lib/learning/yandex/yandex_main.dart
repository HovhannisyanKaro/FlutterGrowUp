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
  final String name;

  const StatefulLifecycle({super.key, required this.name});

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
     */
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('initState');
  }

  @override
  void didUpdateWidget(covariant StatefulLifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
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