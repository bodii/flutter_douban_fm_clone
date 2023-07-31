extension HtmlEntitiesToString on String {
  String htmlEntitiesToString() {
    const Map<String, String> htmlEntities = {
      '&nbsp;': ' ',
      '&excl;': '!',
      '&quot;': '"',
      '&num;': '#',
      '&dollar;': '\$',
      '&percnt;': '%',
      '&amp;': '&',
      '&apos;': '\'',
      '&lpar;': '(',
      '&rpar;': ')',
      '&ast;': '*',
      '&plus;': '+',
      '&comma;': ',',
      '&hyphen;': '-',
      '&period;': '.',
      '&sol;': '/',
      '&colon;': ':',
      '&semi;': ';',
      '&lt;': '<',
      '&equals;': '=',
      '&gt;': '>',
      '&quest;': '?',
      '&commat;': '@',
      '&lsqb;': '[',
      '&bsol;': '\\',
      '&rsqb;': ']',
      '&circ;': '^',
      '&lowbar;': '_',
      '&grave;': '`',
      '&lcub;': '{',
      '&verbar;': '|',
      '&rcub;': '}',
      '&tilde;': '~'
    };

    String replate(String word) =>
        word.replaceAllMapped(RegExp(r'(&[^&]+?;)', caseSensitive: false),
            (Match m) {
          return m[0]!.isEmpty ? '' : '${htmlEntities[m[0]]}';
        });
    return replate(this);
  }
}
