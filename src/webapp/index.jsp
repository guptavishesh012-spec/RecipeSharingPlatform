<%@ page import="java.util.List" %>
<%@ page import="com.recipehub.Recipe" %>
<%@ page import="com.recipehub.RecipeController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    RecipeController controller = new RecipeController();
    List<Recipe> recipes = controller.getAllRecipes();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>RecipeHub - Recipe Sharing Platform</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f8f8f8;
            color: #333;
        }

        /* NAVBAR */

        header {
            background: #ffffff;
            padding: 18px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .logo {
            color: #ff5722;
            font-size: 28px;
            font-weight: bold;
        }

        nav a {
            color: #333;
            text-decoration: none;
            margin-left: 30px;
            font-weight: bold;
        }

        nav a:hover {
            color: #ff5722;
        }

        /* HERO */

        .hero {
            min-height: 440px;
            background: linear-gradient(135deg, #fff3e0, #ffe0b2);
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 50px 20px;
        }

        .hero-content {
            max-width: 750px;
        }

        .hero h1 {
            font-size: 52px;
            color: #e64a19;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 20px;
            line-height: 1.7;
            color: #555;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            background: #ff5722;
            color: white;
            padding: 14px 28px;
            border-radius: 7px;
            text-decoration: none;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        .btn:hover {
            background: #e64a19;
        }

        /* GENERAL */

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 70px 0;
        }

        .section-title {
            text-align: center;
            font-size: 34px;
            color: #e64a19;
            margin-bottom: 10px;
        }

        .section-subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 40px;
        }

        /* RECIPE CARDS */

        .recipe-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
        }

        .recipe-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: 0.3s;
            border-top: 5px solid #ff5722;
        }

        .recipe-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 22px rgba(0,0,0,0.12);
        }

        .recipe-card h3 {
            color: #e64a19;
            font-size: 24px;
            margin-bottom: 18px;
        }

        .recipe-card h4 {
            margin-top: 15px;
            margin-bottom: 7px;
            color: #444;
        }

        .recipe-card p {
            color: #666;
            line-height: 1.6;
            white-space: pre-line;
        }

        .empty-message {
            grid-column: 1 / -1;
            background: white;
            text-align: center;
            padding: 35px;
            border-radius: 10px;
            color: #777;
        }

        /* ADD RECIPE */

        .add-section {
            background: #fff3e0;
        }

        .form-box {
            max-width: 700px;
            margin: 35px auto 0;
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #444;
        }

        input,
        textarea {
            width: 100%;
            padding: 13px;
            border: 1px solid #ccc;
            border-radius: 7px;
            font-family: inherit;
            font-size: 15px;
            outline: none;
        }

        input:focus,
        textarea:focus {
            border-color: #ff5722;
        }

        textarea {
            min-height: 110px;
            resize: vertical;
        }

        .submit-btn {
            width: 100%;
            margin-top: 5px;
        }

        /* FOOTER */

        footer {
            background: #222;
            color: #ddd;
            text-align: center;
            padding: 25px;
        }

        footer strong {
            color: #ff7043;
        }

        /* MOBILE */

        @media (max-width: 700px) {

            header {
                flex-direction: column;
                gap: 15px;
            }

            nav a {
                margin: 0 10px;
            }

            .hero h1 {
                font-size: 38px;
            }

            .hero p {
                font-size: 17px;
            }

            .form-box {
                padding: 25px 18px;
            }
        }
    </style>
</head>

<body>

<!-- NAVBAR -->

<header>

    <div class="logo">
        RecipeHub
    </div>

    <nav>
        <a href="#home">Home</a>
        <a href="#recipes">Recipes</a>
        <a href="#addRecipe">Add Recipe</a>
    </nav>

</header>


<!-- HERO -->

<section class="hero" id="home">

    <div class="hero-content">

        <h1>Discover Delicious Recipes</h1>

        <p>
            Explore tasty recipes, discover new dishes and
            share your own favourite recipes with everyone.
        </p>

        <a href="#recipes" class="btn">
            Explore Recipes
        </a>

    </div>

</section>


<!-- RECIPES -->

<section id="recipes">

    <div class="container">

        <h2 class="section-title">
            Our Recipes
        </h2>

        <p class="section-subtitle">
            Discover recipes shared on RecipeHub
        </p>


        <div class="recipe-grid">

            <%
                if (recipes != null && !recipes.isEmpty()) {

                    for (Recipe recipe : recipes) {
            %>

            <div class="recipe-card">

                <h3>
                    <%= recipe.getTitle() %>
                </h3>

                <%
                    if (recipe.getDescription() != null &&
                        !recipe.getDescription().trim().isEmpty()) {
                %>

                <h4>Description</h4>

                <p>
                    <%= recipe.getDescription() %>
                </p>

                <%
                    }
                %>


                <h4>Ingredients</h4>

                <p>
                    <%= recipe.getIngredients() %>
                </p>


                <h4>Instructions</h4>

                <p>
                    <%= recipe.getInstructions() %>
                </p>

            </div>

            <%
                    }

                } else {
            %>

            <div class="empty-message">
                No recipes available yet. Add your first recipe!
            </div>

            <%
                }
            %>

        </div>

    </div>

</section>


<!-- ADD RECIPE -->

<section class="add-section" id="addRecipe">

    <div class="container">

        <h2 class="section-title">
            Add Your Recipe
        </h2>

        <p class="section-subtitle">
            Share your favourite recipe with RecipeHub
        </p>


        <div class="form-box">

            <form action="recipes" method="post">

                <div class="form-group">

                    <label>
                        Recipe Name
                    </label>

                    <input
                        type="text"
                        name="name"
                        placeholder="Enter recipe name"
                        required
                    >

                </div>


                <div class="form-group">

                    <label>
                        Ingredients
                    </label>

                    <textarea
                        name="ingredients"
                        placeholder="Enter ingredients"
                        required
                    ></textarea>

                </div>


                <div class="form-group">

                    <label>
                        Instructions
                    </label>

                    <textarea
                        name="instructions"
                        placeholder="Enter cooking instructions"
                        required
                    ></textarea>

                </div>


                <button
                    type="submit"
                    class="btn submit-btn">

                    Add Recipe

                </button>

            </form>

        </div>

    </div>

</section>


<!-- FOOTER -->

<footer>

    <p>
        <strong>RecipeHub</strong>
        — Recipe Sharing Platform
    </p>

    <p>
        Java • JSP • Servlets • JDBC • MySQL
    </p>

</footer>

</body>
</html>