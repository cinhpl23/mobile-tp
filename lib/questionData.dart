import 'package:mobile_tp/question.dart';

class QuestionData {
  int questionNumber = 0;

  List<Question> questionList = [
    Question(
        id: "1",
        question: "L'homme a marché sur la Lune avant d'inventé la valise à roulette",
        response: true,
        explanation: 'Le premier alunissage a eu lieu en 1969 tandis que les premières roulettes sont apparues en 1970',
        imagePath: 'suitcase.jpeg'
    ),
    Question(
        id: "2",
        question: "Une cuillère de miel correspond au travail d'une vie de 12 abeilles ?",
        response: true,
        explanation: "Les abeilles sont indispensables et très fragiles ...",
        imagePath: 'honey.webp'
    ),
    Question(
        id: "3",
        question: "Les avions volent plus rapidement aujourd'hui qu'avant ?",
        response: false,
        explanation: "Pour des raisons économiques et de carburants, les avions d'aujourd'hui volent moins vite !",
        imagePath: 'airplane.webp'),
    Question(
        id: "4",
        question: "L'inventeur des publicités pop-ups s'est excusé pour sa création ?",
        response: true,
        explanation: "Il est vraiment désolé, c'est intentions étaient bonnes ...",
        imagePath: 'web.webp'
    ),
    Question(
        id: "5",
        question: "Possédons-nous un peu d'or dans notre corps ?",
        response: true,
        explanation: "Une personne de 70kg possède environ 0.2mg d'or en elle",
        imagePath: 'gold.webp'
    ),
    Question(
        id: "6",
        question: "100k, c'est le nombre de combinaisons possibles avec des briques 2x4 de LEGO ?",
        response: false,
        explanation: "915,103,765 combinaisons possibles, c'est le résultat obtenu après une semaine de calcul par le programme du mathématicien Soren Eilers",
        imagePath: 'lego.jpeg'
    ),
    Question(
        id: "7",
        question: "Une vache appelée par son nom produira plus de lait qu'une qui ne l'est pas ?",
        response: true,
        explanation: '258L de lait en plus par an pour être exact !',
        imagePath: 'cow.jpeg'
    ),
    Question(
        id: "8",
        question: "Le drapeau des Etats-Unis a été créé par un étudiant ?",
        response: true,
        explanation: "Pour un projet de classe, l'étudiant a eu un B puis un A lorsque le congrès l'a choisi comme drapeau national !",
        imagePath: 'america.jpeg'
    ),
    Question(
        id: "9",
        question: "Les astronautes peuvent-ils voter depuis l'espace ?",
        response: true,
        explanation: "Même dans l'espace, le devoir d'un citoyen doit être effectué !",
        imagePath: 'astronaut.jpeg'
    ),
    Question(
        id: "10",
        question: "Tout le Nutella vendu en 1 an pourrait être étalé sur environ 50 terrains de football",
        response: false,
        explanation: "En realité il pourrait être étalé sur 1000 terrain de football !",
        imagePath: 'nutella.jpeg'
    )
  ];

  String getId() {
    return questionList[questionNumber].id;
  }

  String getQuestion() {
    return questionList[questionNumber].question;
  }

  bool getResponse(int questionNumber) {
    return questionList[questionNumber].response;
  }

  String getExplanation(int questionNumber) {
    return questionList[questionNumber].explanation;
  }

}