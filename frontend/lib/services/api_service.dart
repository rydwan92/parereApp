class ApiService {
  Future<String?> fetchRandomQuestion() async {
    // tymczasowy placeholder
    return 'Co dzisiaj fajnego zrobiłeś?';
  }

  Future<bool> submitQuestion(String text) async {
    // tymczasowy placeholder
    print("Przesłane pytanie: $text");
    return true;
  }
}
