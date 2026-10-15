package com.recipehub;

import java.util.List;

public class RecipeService {

    private RecipeRepository recipeRepository;

    public RecipeService() {
        recipeRepository = new RecipeRepository();
    }

    public void addRecipe(Recipe recipe) {
        recipeRepository.addRecipe(recipe);
    }

    public List<Recipe> getAllRecipes() {
        return recipeRepository.getAllRecipes();
    }

    public void deleteRecipe(Recipe recipe) {
        recipeRepository.deleteRecipe(recipe);
    }
}