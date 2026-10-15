package com.recipehub;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RecipeRepository {

    private static final String URL =
            "jdbc:mysql://localhost:3306/recipehub";

    private static final String USER = "root";

    private static final String PASSWORD = "YOUR_MYSQL_PASSWORD";

    // Load MySQL JDBC Driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(
                    "MySQL JDBC Driver not found", e
            );
        }
    }

    // Add Recipe
    public void addRecipe(Recipe recipe) {

        String sql =
                "INSERT INTO recipes " +
                        "(title, description, ingredients, instructions) " +
                        "VALUES (?, ?, ?, ?)";

        try (
                Connection con =
                        DriverManager.getConnection(URL, USER, PASSWORD);

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setString(1, recipe.getTitle());
            ps.setString(2, recipe.getDescription());
            ps.setString(3, recipe.getIngredients());
            ps.setString(4, recipe.getInstructions());

            ps.executeUpdate();

            System.out.println("Recipe added successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // Get All Recipes
    public List<Recipe> getAllRecipes() {

        List<Recipe> recipes = new ArrayList<>();

        String sql = "SELECT * FROM recipes";

        try (
                Connection con =
                        DriverManager.getConnection(URL, USER, PASSWORD);

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ResultSet rs =
                        ps.executeQuery()
        ) {

            while (rs.next()) {

                Recipe recipe = new Recipe();

                recipe.setId(rs.getLong("id"));
                recipe.setTitle(rs.getString("title"));
                recipe.setDescription(rs.getString("description"));
                recipe.setIngredients(rs.getString("ingredients"));
                recipe.setInstructions(rs.getString("instructions"));

                recipes.add(recipe);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return recipes;
    }


    // Delete Recipe
    public void deleteRecipe(Recipe recipe) {

        String sql =
                "DELETE FROM recipes WHERE id = ?";

        try (
                Connection con =
                        DriverManager.getConnection(URL, USER, PASSWORD);

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setLong(1, recipe.getId());

            ps.executeUpdate();

            System.out.println("Recipe deleted successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}