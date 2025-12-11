import 'package:google_generative_ai/google_generative_ai.dart';

class RecipeService {
  // PASTE YOUR KEY HERE
  static const String _apiKey = String.fromEnvironment('GOOGLE_API_KEY');

  final GenerativeModel? _model;

  RecipeService()
    : _model = _apiKey.isNotEmpty
          // We use the model name found in your screenshot
          ? GenerativeModel(model: 'gemini-2.5-flash', apiKey: _apiKey)
          : null;

  Future<String> generateRecipe(String ingredients) async {
    if (_model == null) return "Error: API Key is missing.";

    final prompt =
        '''
    Act as a Michelin-star chef. I have these ingredients: $ingredients.
    Create a sophisticated but easy recipe.
    
    Format in Markdown:
    # [Dish Name]
    *A brief, appetizing description.*
    
    **⏱️ Time:** [Prep/Cook]
    
    ## The Ingredients
    * [List]
    
    ## The Method
    1. [Steps]
    ''';

    try {
      final response = await _model!.generateContent([Content.text(prompt)]);
      return response.text ?? "The chef is silent.";
    } catch (e) {
      return "Kitchen Error: $e";
    }
  }
}
