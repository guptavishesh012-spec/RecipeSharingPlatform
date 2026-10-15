package com.recipehub;

import java.util.List;

public class RecipeController {

    private final RecipeService recipeService;

    public RecipeController() {
        recipeService = new RecipeService();
    }

    public void addRecipe(Recipe recipe) {
        recipeService.addRecipe(recipe);
    }

    public List<Recipe> getAllRecipes() {
        return recipeService.getAllRecipes();
    }

    public void deleteRecipe(Recipe recipe) {
        recipeService.deleteRecipe(recipe);
    }
}

