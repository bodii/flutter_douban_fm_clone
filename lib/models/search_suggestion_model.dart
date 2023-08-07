class SearchSuggestion {
  late List<String>? suggestionList;

  SearchSuggestion({this.suggestionList});

  SearchSuggestion.fromJson(List<String> json) {
    suggestionList = json;
  }

  List<String>? toJson() {
    return suggestionList;
  }

  SearchSuggestion copyWith({
    List<String>? list,
  }) =>
      SearchSuggestion(
        suggestionList: list ?? suggestionList,
      );
}
