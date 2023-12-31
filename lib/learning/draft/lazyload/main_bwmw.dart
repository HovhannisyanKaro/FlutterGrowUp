/**
 * խի՞ են հրաժարվել ChangeNotifier ից ու ոնց ա ստեղծվել BloC ը
 *
 * Google ից եսիմ ով, ով որ աշխատում էր Flutter ի վրա, ներվայնանում ա, որ էն ամբողջ կոդը, որը որ գրված ա
 * ChangeNotifier հիմքով չի աշխատում Dart Angular ում, որովհետև դա գրված ա Flutter ով, ոչ թե մաքուր Dart ով.
 * Ու որոշում ա լիբ գրի, որը ամբողջովին կարելիա ա ասել փոխարինում ա ChangeNotifier ին, բայց աշխատում ա մաքուր Dart ի Stream երով,
 * որի հետևանքով էլ արդեն կաշխատի ցանկացած տեղ, որտեղ որ աշխատում են Dart ով, հետևաբար նաև Dart Angluar ով.
 */

/**
 *  !!! ԱՄԲՈՂՋ Bloc-Ի ԻՄԱՍՏԸ !!!
 * Bloc ը դա մի բան է, որտեղ կան, մեկ կամ մեկից ավելի Stream եր. Չկա UI , պահվում են ինչ որ տվյալներ.
 * ու իհարկե կարելիա  Stream երին "լսել".
 *
 * Կարելի ա ասել, որ Bloc ը դա ViewModel ա, որտեղ պարտադիր օգտագործվում են Stream եր.
 *
 * Իսկ MVVM ասելով հասկանում ենք, որ կա "ինչ որ բան" որին կարողանում ես լսես, Stream ա , Observable-ա թե ինչ ա, էական չի.
 *
 *
 * ԲԱՅՑ
 * Bloc ի մասին կարծիքները բաժանվում են 2 մասի
 * - մի մասը ասում ա, որ փոխարինում ա ViewModel ին, կամ կարելիա ասել հանդիսանում ա ViewModel
 * - մյուս մասը , ասում ա, որ չի հանդիսանում VM այլ հանդիսանում ա ինչ որ Repository/Service, այսինքն պատասխանատու ա
 *   ինչ որ լոգիկայի համար, ինչ որ տվյալնե պահելու համար և այլն.
 *
 *
 *
 * Miro.com ում նկարել եմ դիագրամներ,
 * 1-ում Bloc ից մի քանի Stream եր են գնում դեպի UI(Widget), այսինքն տարբեր Widget ներ կպնում են տարբեր Stream երի.
 * 2-ում Bloc ից ընդամենը ՄԵԿ Stream ա գնում դեպի UI(Widget) որը պարունակում ա էկրանի ամբողջ State ը.
 *   այսինքն մեկ տվյալների կառուցվածք, որոնք նախատեսված են էկրանի UI(Widget) update անելու համար ( ԱՄԵՆԱՏԱՐԱԾՎԱԾ )
 * 3-երբ Bloc ը ունի "դեպի իրեն/մուտքային" stream ( էս նման ա MVI-ի Intent ), ուղղակի ստեղ ասում են Event ներ.
 *   աշխատում ա լրիվ նույն տրամաբանությամբ, ոնց որ մենք արել ենք KMM ով. Bloc ը ունենում ա միատ Stream, որին գալիս են ինչ որ
 *   event ներ, լսում ա դրանց, ու անում ա համապատասխան գործողություններ.
 *
 * 4-երբ Bloc ը կպնում ա մի քանի UI(Widget) ների, ստեղ եթե համեմատական ենք տանում ViewModel-ի հետ, ապա ViewModel-ը
 *   ստեղվծում ա կամ նախատեսված ա կոնկրետ Screen-ի համար, իսկ այդ տարբերակով Bloc-ը ոչ. ( ներկայիս ԱՄԵՆԱՊՈՊՈՒԼՅԱՐ )
 *   Նման մոտեցման դեպքում Bloc-ը հենց ինքը ունենում ա Strem իր ընդունող Event ները և դուրս ա տալիս Stream State երը.
 *   ԵՎ այս մոտեցման ժամանակ կարող են մի քանի Bloc-եր փոխազդել միմիանց վրա.
 *
 *   ԵԹԵ 4րդ դիագրամը նայեցինք հասկացանք, սա Bloc Architecture -այա, բայց կա նաև Bloc library (https://bloclibrary.dev/#/gettingstarted)
 *   որը գրել ա Felix Angelov-ը (https://github.com/felangel)
 *
 *   ԵՎ ԵԹԵ ՎԵՐԵՎԻ ԱՄԲՈՂՋԸ ՀԱՍԿԱՑԵԼ ԵՆՔ, ԱՊԱ Ի՞ՆՉ ԽՆԴԻՐ ԵՆՔ ՏԵՍՆՈՒՄ
 *
 *
 *
 *   Էն խնդիրը, որ կոնրկետ էկրանը չի ունենում իրա կոնկրետ բիզնես լոգիկայի կլասսը, (կարանք պատկերացնենք, օրինակ ViewModel)-ը.
 *
 *   ու ըստ ԻՍ ստեղ մենք պետք ա ստեղծենք մեր Arhitecture-ն, հենց մենք, հենց թազա.
 *   Օրինակ անունը դնենք BWMW ( Bloc-WidgetModel-Widget ), ունենանք թե ViewModel ԳԱՂԱՊԱՐԸ ԵՎ թե օգտագործենք Bloc եր,
 *   բայց ընգծենք հենց էն միտքը, որ
 *   ԱՄԵՆ Screen(Screen Widget) ունի իրեն համապատասխան Model ը, անունը կարա լինի օրինակ ոչ թե ViewModel, այլ WidgetModel
 *
 *
 */