
        package com.recipehub.servlet;

import com.recipehub.Recipe;
import com.recipehub.RecipeController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/recipes")
public class RecipeServlet extends HttpServlet {

    private final RecipeController controller = new RecipeController();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<html><body><h1>Recipe List</h1>");

        for (Recipe recipe : controller.getAllRecipes()) {
            out.println("<h2>" + recipe.getTitle() + "</h2>");
            out.println("<p>Ingredients: " + recipe.getIngredients() + "</p>");
            out.println("<p>Instructions: " + recipe.getInstructions() + "</p>");
            out.println("<hr>");
        }

        out.println("<a href='index.html'>Back to Home</a>");
        out.println("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        Recipe recipe = new Recipe();
        recipe.setTitle(request.getParameter("name"));
        recipe.setDescription("");
        recipe.setIngredients(request.getParameter("ingredients"));
        recipe.setInstructions(request.getParameter("instructions"));

        controller.addRecipe(recipe);

        response.sendRedirect("index.jsp");
    }
}
