//
//  RecipeToShow.swift
//  reciplease
//
//  Created by Gilles David on 05/02/2022.
//

import UIKit
import Foundation

struct RecipeToShow {
    
    init(idRecipe: String, label: String, yield: String, duration: String, ingredients: [String], ingredientWithDetails: [String], urlApi: String, urlSrc: String, favorite: Bool) {
        self.idRecipe = idRecipe
        self.label = label
        self.yield = yield
        self.duration = duration
        self.ingredients = ingredients
        self.ingredientWithDetails = ingredientWithDetails
        self.urlApi = urlApi
        self.urlSrc = urlSrc
        self.favorite = favorite
    }
    
    let idRecipe: String!
    let label: String!
    let yield: String!
    let duration: String!
    let ingredients: [String]!
    let ingredientWithDetails: [String]!
    let urlApi: String!
    let urlSrc: String!
    
    var img: UIImage! = UIImage(named: Constants.nameImageByDefault)
    var images: [String] = []
    var favorite: Bool
    
}

/*
 po listRecipesToShow
 ▿ 9 elements
   ▿ 0 : RecipeToShow
     ▿ idRecipe : Optional<String>
       - some : "cb760174c918642bbd6850e5ffe8b44d"
     ▿ label : Optional<String>
       - some : "Carrot Cake, French-Style (Gâteau Aux Carrottes)"
     ▿ yield : Optional<String>
       - some : "2"
     ▿ duration : Optional<String>
       - some : "0"
     ▿ ingredients : Optional<Array<String>>
       ▿ some : 7 elements
         - 0 : "pinch of salt"
         - 1 : "5 large eggs, at room temperature"
         - 2 : "1/4 cup, packed, (40g) finely grated carrot"
         - 3 : "2/3 cup (90g) flour"
         - 4 : "8 tablespoons (115g) butter, salted or unsalted, at room temperature"
         - 5 : "1 3/4 cups (225g) toasted almonds"
         - 6 : "1 1/4 cups (250g) sugar"
     ▿ ingredientWithDetails : Optional<Array<String>>
       ▿ some : 7 elements
         - 0 : "pinch of salt"
         - 1 : "5 large eggs, at room temperature"
         - 2 : "1/4 cup, packed, (40g) finely grated carrot"
         - 3 : "2/3 cup (90g) flour"
         - 4 : "8 tablespoons (115g) butter, salted or unsalted, at room temperature"
         - 5 : "1 3/4 cups (225g) toasted almonds"
         - 6 : "1 1/4 cups (250g) sugar"
     ▿ urlApi : Optional<String>
       - some : "http://www.edamam.com/recipe/carrot-cake-french-style-g%C3%A2teau-aux-carrottes-cb760174c918642bbd6850e5ffe8b44d/carrottes"
     ▿ urlSrc : Optional<String>
       - some : "http://www.davidlebovitz.com/2008/03/carrot-cake-fre/"
     ▿ img : Optional<UIImage>
       - some : <UIImage:0x60000092b4e0 anonymous {300, 300} renderingMode=automatic>
     ▿ images : 4 elements
       - 0 : "https://www.edamam.com/web-img/28e/28e4db787fd6b0def3916934512528da.jpg"
       - 1 : "https://www.edamam.com/web-img/28e/28e4db787fd6b0def3916934512528da-m.jpg"
       - 2 : "https://www.edamam.com/web-img/28e/28e4db787fd6b0def3916934512528da-s.jpg"
       - 3 : "https://www.edamam.com/web-img/28e/28e4db787fd6b0def3916934512528da-l.jpg"
     - favorite : false
   ▿ 1 : RecipeToShow
     ▿ idRecipe : Optional<String>
       - some : "f721649e4895568d5fec38fb2320d73b"
     ▿ label : Optional<String>
       - some : "Soy Steamed Chicken With Oriental Rice"
     ▿ yield : Optional<String>
       - some : "2"
     ▿ duration : Optional<String>
       - some : "0"
     ▿ ingredients : Optional<Array<String>>
       ▿ some : 8 elements
         - 0 : "175.0g basmati rice"
         - 1 : "1.0 tbsp reduced-salt soy sauce"
         - 2 : "1.0 tbsp sunflower oil"
         - 3 : "small knob of fresh root ginger , grated"
         - 4 : "425.0ml vegetable stock"
         - 5 : "2 boneless skinless chicken breasts (about 140g/5oz each)"
         - 6 : "250.0g pack prepared veg, broccoli , carrotts and green beans"
         - 7 : "3 spring onions , sliced"
     ▿ ingredientWithDetails : Optional<Array<String>>
       ▿ some : 8 elements
         - 0 : "175.0g basmati rice"
         - 1 : "1.0 tbsp reduced-salt soy sauce"
         - 2 : "1.0 tbsp sunflower oil"
         - 3 : "small knob of fresh root ginger , grated"
         - 4 : "425.0ml vegetable stock"
         - 5 : "2 boneless skinless chicken breasts (about 140g/5oz each)"
         - 6 : "250.0g pack prepared veg, broccoli , carrotts and green beans"
         - 7 : "3 spring onions , sliced"
     ▿ urlApi : Optional<String>
       - some : "http://www.edamam.com/recipe/soy-steamed-chicken-with-oriental-rice-f721649e4895568d5fec38fb2320d73b/carrottes"
     ▿ urlSrc : Optional<String>
       - some : "http://www.bbcgoodfood.com/recipes/4412/"
     ▿ img : Optional<UIImage>
       - some : <UIImage:0x600000935680 anonymous {300, 300} renderingMode=automatic>
     ▿ images : 4 elements
       - 0 : "https://www.edamam.com/web-img/3d2/3d26c48330c690acdc0e81ccafe9126c.jpg"
       - 1 : "https://www.edamam.com/web-img/3d2/3d26c48330c690acdc0e81ccafe9126c-m.jpg"
       - 2 : "https://www.edamam.com/web-img/3d2/3d26c48330c690acdc0e81ccafe9126c-s.jpg"
       - 3 : "https://www.edamam.com/web-img/3d2/3d26c48330c690acdc0e81ccafe9126c-l.jpg"
     - favorite : false
   ▿ 2 : RecipeToShow
     ▿ idRecipe : Optional<String>
       - some : "50ecd297d70e2ad20260beabef3e0917"
     ▿ label : Optional<String>
       - some : "Ropa Vieja"
     ▿ yield : Optional<String>
       - some : "6"
     ▿ duration : Optional<String>
       - some : "0"
     ▿ ingredients : Optional<Array<String>>
       ▿ some : 9 elements
         - 0 : "2.5 pounds Flank Steak or Brisket (Brisket needs more time)"
         - 1 : "2 Cloves of garlic"
         - 2 : "4 Tomatoes"
         - 3 : "2 Chilies"
         - 4 : "1 Onion Diced"
         - 5 : "2 tablespoons Tomato Paste"
         - 6 : "2 tablespoons Extra Virgin Olive Oil"
         - 7 : "1 pinch Cayenne pepper"
         - 8 : "1 of each Carrott , Onion, Celery (for stock)"
     ▿ ingredientWithDetails : Optional<Array<String>>
       ▿ some : 9 elements
         - 0 : "2.5 pounds Flank Steak or Brisket (Brisket needs more time)"
         - 1 : "2 Cloves of garlic"
         - 2 : "4 Tomatoes"
         - 3 : "2 Chilies"
         - 4 : "1 Onion Diced"
         - 5 : "2 tablespoons Tomato Paste"
         - 6 : "2 tablespoons Extra Virgin Olive Oil"
         - 7 : "1 pinch Cayenne pepper"
         - 8 : "1 of each Carrott , Onion, Celery (for stock)"
     ▿ urlApi : Optional<String>
       - some : "http://www.edamam.com/recipe/ropa-vieja-50ecd297d70e2ad20260beabef3e0917/carrottes"
     ▿ urlSrc : Optional<String>
       - some : "https://food52.com/recipes/20540-ropa-vieja"
     ▿ img : Optional<UIImage>
       - some : <UIImage:0x600000939d40 anonymous {300, 300} renderingMode=automatic>
     ▿ images : 3 elements
       - 0 : "https://www.edamam.com/web-img/eb7/eb714dc163df48788496f4545d5e1fc1.jpg"
       - 1 : "https://www.edamam.com/web-img/eb7/eb714dc163df48788496f4545d5e1fc1-m.jpg"
       - 2 : "https://www.edamam.com/web-img/eb7/eb714dc163df48788496f4545d5e1fc1-s.jpg"
     - favorite : false
   ▿ 3 : RecipeToShow
     ▿ idRecipe : Optional<String>
       - some : "99861d495ece780ad4d660d0f2c45cb1"
     ▿ label : Optional<String>
       - some : "Salade De Carrotte Râpées"
     ▿ yield : Optional<String>
       - some : "4"
     ▿ duration : Optional<String>
       - some : "0"
     ▿ ingredients : Optional<Array<String>>
       ▿ some : 9 elements
         - 0 : "2 Cloves of garlic"
         - 1 : "2 tablespoons Extra Virgin Olive Oil"
         - 2 : "1 Lemon Juiced"
         - 3 : "1 Tsp Dijon mustard"
         - 4 : "Large handful of Parsley Chopped"
         - 5 : "pinch of salt"
         - 6 : "1/4 cup, packed, (40g) finely grated carrot"
         - 7 : "1 Shallot Finely sliced"
         - 8 : "4 Tbsp Red wine vinegar"
     ▿ ingredientWithDetails : Optional<Array<String>>
       ▿ some : 9 elements
         - 0 : "1 Garlic clove Crushed & minced"
         - 1 : "6 Tbsp Olive oil Extra virgin"
         - 2 : "1 Lemon Juiced"
         - 3 : "1 Tsp Dijon mustard"
         - 4 : "Large handful of Parsley Chopped"
         - 5 : "Salt & Pepper To taste"
         - 6 : "5 Large carrots"
         - 7 : "1 Shallot Finely sliced"
         - 8 : "4 Tbsp Red wine vinegar"
     ▿ urlApi : Optional<String>
       - some : "http://www.edamam.com/recipe/salade-de-carrotte-r%C3%A2p%C3%A9es-99861d495ece780ad4d660d0f2c45cb1/carrottes"
     ▿ urlSrc : Optional<String>
       - some : "http://www.ideasfordinner.co.uk/salade-de-carrotte-rapees/"
     ▿ img : Optional<UIImage>
       - some : <UIImage:0x60000092ed00 anonymous {300, 300} renderingMode=automatic>
     ▿ images : 3 elements
       - 0 : "https://www.edamam.com/web-img/78e/78e360d62059b81829b35a27c75a8cb5.jpg"
       - 1 : "https://www.edamam.com/web-img/78e/78e360d62059b81829b35a27c75a8cb5-m.jpg"
       - 2 : "https://www.edamam.com/web-img/78e/78e360d62059b81829b35a27c75a8cb5-s.jpg"
     - favorite : false
   ▿ 4 : RecipeToShow
     ▿ idRecipe : Optional<String>
       - some : "61555c7fed05c9d57c946d6ad43e401d"
     ▿ label : Optional<String>
       - some : "Rich soup from chicken liver Recipe"
     ▿ yield : Optional<String>
       - some : "6"
     ▿ duration : Optional<String>
       - some : "35"
     ▿ ingredients : Optional<Array<String>>
       ▿ some : 14 elements
         - 0 : "1 medium potato (whole)"
         - 1 : "1 Onion Diced"
         - 2 : "7 ounces (20 dkg) chicken liver"
         - 3 : "1 of each Carrott , Onion, Celery (for stock)"
         - 4 : "3 ounces cabbage cut into strips"
         - 5 : "6-7 pieces of whole black pepper"
         - 6 : "2 Cloves of garlic"
         - 7 : "Large handful of Parsley Chopped"
         - 8 : "1 green pepper"
         - 9 : "4 Tomatoes"
         - 10 : "2 chicken bouillon/seasoning cube"
         - 11 : "pinch of salt"
         - 12 : "3 ounces green peas"
         - 13 : "+ 7 ounces vermicelli noodle"
     ▿ ingredientWithDetails : Optional<Array<String>>
       ▿ some : 14 elements
         - 0 : "1 medium potato (whole)"
         - 1 : "1 red onion"
         - 2 : "7 ounces (20 dkg) chicken liver"
         - 3 : "1 stick of celery cut into slices"
         - 4 : "3 ounces cabbage cut into strips"
         - 5 : "6-7 pieces of whole black pepper"
         - 6 : "2 colves of garlic"
         - 7 : "1 buch of parsley"
         - 8 : "1 green pepper"
         - 9 : "1 tomato"
         - 10 : "2 chicken bouillon/seasoning cube"
         - 11 : "+salt, ground pepper if desired"
         - 12 : "3 ounces green peas"
         - 13 : "+ 7 ounces vermicelli noodle"
     ▿ urlApi : Optional<String>
       - some : "http://www.edamam.com/recipe/rich-soup-from-chicken-liver-recipe-61555c7fed05c9d57c946d6ad43e401d/carrottes"
     ▿ urlSrc : Optional<String>
       - some : "http://www.grouprecipes.com/38508/rich-soup-from-chicken-liver.html"
     ▿ img : Optional<UIImage>
       - some : <UIImage:0x600000900120 anonymous {300, 300} renderingMode=automatic>
     ▿ images : 4 elements
       - 0 : "https://www.edamam.com/web-img/18b/18bcad4ee31b100db3500e6933a04e3c.JPG"
       - 1 : "https://www.edamam.com/web-img/18b/18bcad4ee31b100db3500e6933a04e3c-m.JPG"
       - 2 : "https://www.edamam.com/web-img/18b/18bcad4ee31b100db3500e6933a04e3c-s.JPG"
       - 3 : "https://www.edamam.com/web-img/18b/18bcad4ee31b100db3500e6933a04e3c-l.JPG"
     - favorite : false
   ▿ 5 : RecipeToShow
     ▿ idRecipe : Optional<String>
       - some : "9952b623098b9a45d22d778103d59cf9"
     ▿ label : Optional<String>
       - some : "Lentil Soup With Bacon"
     ▿ yield : Optional<String>
       - some : "6"
     ▿ duration : Optional<String>
       - some : "0"
     ▿ ingredients : Optional<Array<String>>
       ▿ some : 14 elements
         - 0 : "1/2 teaspoon McCormick Gourmet™ Sicilian Sea Salt"
         - 1 : "8 slices thick-cut bacon, chopped"
         - 2 : "1 container (32 ounces) Kitchen Basics® Original Beef Stock"
         - 3 : "1 teaspoon McCormick Gourmet™ Sage Leaves, Dalmatian"
         - 4 : "1 teaspoon McCormick Gourmet™ Rosemary, Crushed"
         - 5 : "2 teaspoons McCormick Gourmet™ Thyme"
         - 6 : "1 cup red lentils, picked over and rinsed"
         - 7 : "6-7 pieces of whole black pepper"
         - 8 : "1 of each Carrott , Onion, Celery (for stock)"
         - 9 : "2 cloves garllic, finely chopped"
         - 10 : "1 Onion Diced"
         - 11 : "1 can (14 1/2 ounces) petite diced tomatoes, undrained"
         - 12 : "8 tablespoons (115g) butter, salted or unsalted, at room temperature"
         - 13 : "2 McCormick Gourmet™ Bay Leaves, Turkish"
     ▿ ingredientWithDetails : Optional<Array<String>>
       ▿ some : 14 elements
         - 0 : "1/2 teaspoon McCormick Gourmet™ Sicilian Sea Salt"
         - 1 : "8 slices thick-cut bacon, chopped"
         - 2 : "1 container (32 ounces) Kitchen Basics® Original Beef Stock"
         - 3 : "1 teaspoon McCormick Gourmet™ Sage Leaves, Dalmatian"
         - 4 : "1 teaspoon McCormick Gourmet™ Rosemary, Crushed"
         - 5 : "2 teaspoons McCormick Gourmet™ Thyme"
         - 6 : "1 cup red lentils, picked over and rinsed"
         - 7 : "1/4 teaspoon McCormick Gourmet™ Black Pepper, Coarse Ground"
         - 8 : "2 ribs celery, chopped"
         - 9 : "2 cloves garllic, finely chopped"
         - 10 : "1 large onion, chopped"
         - 11 : "1 can (14 1/2 ounces) petite diced tomatoes, undrained"
         - 12 : "1 tablespoon butter"
         - 13 : "2 McCormick Gourmet™ Bay Leaves, Turkish"
     ▿ urlApi : Optional<String>
       - some : "http://www.edamam.com/recipe/lentil-soup-with-bacon-9952b623098b9a45d22d778103d59cf9/carrottes"
     ▿ urlSrc : Optional<String>
       - some : "http://www.mccormick.com/Gourmet/Recipes/Soups-Stews/Lentil-Soup-with-Bacon"
     ▿ img : Optional<UIImage>
       - some : <UIImage:0x600000900b40 anonymous {300, 300} renderingMode=automatic>
     ▿ images : 4 elements
       - 0 : "https://www.edamam.com/web-img/9e5/9e57f86ba8ac5bcc8fd4a5384de53c43.jpg"
       - 1 : "https://www.edamam.com/web-img/9e5/9e57f86ba8ac5bcc8fd4a5384de53c43-m.jpg"
       - 2 : "https://www.edamam.com/web-img/9e5/9e57f86ba8ac5bcc8fd4a5384de53c43-s.jpg"
       - 3 : "https://www.edamam.com/web-img/9e5/9e57f86ba8ac5bcc8fd4a5384de53c43-l.jpg"
     - favorite : false
   ▿ 6 : RecipeToShow
     ▿ idRecipe : Optional<String>
       - some : "ffb2f259b90324760aaa9881dfdd8028"
     ▿ label : Optional<String>
       - some : "Djuwec Rice With Pljeskavica"
     ▿ yield : Optional<String>
       - some : "12"
     ▿ duration : Optional<String>
       - some : "0"
     ▿ ingredients : Optional<Array<String>>
       ▿ some : 21 elements
         - 0 : "1 tbsp paprika paste"
         - 1 : "2 teaspoons McCormick Gourmet™ Thyme"
         - 2 : "1 cup water"
         - 3 : "2 Cloves of garlic"
         - 4 : "1 teaspoon McCormick Gourmet™ Rosemary, Crushed"
         - 5 : "6-7 pieces of whole black pepper"
         - 6 : "2 Chilies"
         - 7 : "1 1/2 cup tomato juice"
         - 8 : "1 Onion Diced"
         - 9 : "5 large eggs, at room temperature"
         - 10 : "1/2 cup sliced yellow pepper"
         - 11 : "500 g minced pork and beef"
         - 12 : "1 cup long grain rice"
         - 13 : "3 tbsp bread crumbs"
         - 14 : "150 g sheep feta"
         - 15 : "500 g minced pork and beef"
         - 16 : "Large handful of Parsley Chopped"
         - 17 : "pinch of salt"
         - 18 : "pinch of salt"
         - 19 : "3 ounces green peas"
         - 20 : "1 tbsp mixed dried herbs like rosemary and thyme and oregano"
     ▿ ingredientWithDetails : Optional<Array<String>>
       ▿ some : 21 elements
         - 0 : "1 tbsp paprika paste"
         - 1 : "1 tbsp mixed dried herbs like rosemary and thyme and oregano"
         - 2 : "1 cup water"
         - 3 : "4 cloves of garlic"
         - 4 : "1 tbsp mixed dried herbs like rosemary and thyme and oregano"
         - 5 : "1 tsp salt, pepper and chili"
         - 6 : "1 tsp salt, pepper and chili"
         - 7 : "1 1/2 cup tomato juice"
         - 8 : "2 tsp cubed onion"
         - 9 : "1 egg"
         - 10 : "1/2 cup sliced yellow pepper"
         - 11 : "500 g minced pork and beef"
         - 12 : "1 cup long grain rice"
         - 13 : "3 tbsp bread crumbs"
         - 14 : "150 g sheep feta"
         - 15 : "500 g minced pork and beef"
         - 16 : "1 tbsp parsley"
         - 17 : "1 tsp salt"
         - 18 : "1 tsp salt, pepper and chili"
         - 19 : "1/2 cup peas defrosted"
         - 20 : "1 tbsp mixed dried herbs like rosemary and thyme and oregano"
     ▿ urlApi : Optional<String>
       - some : "http://www.edamam.com/recipe/djuwec-rice-with-pljeskavica-ffb2f259b90324760aaa9881dfdd8028/carrottes"
     ▿ urlSrc : Optional<String>
       - some : "https://sortedfood.com/recipe/8766"
     ▿ img : Optional<UIImage>
       - some : <UIImage:0x600000934120 anonymous {300, 300} renderingMode=automatic>
     ▿ images : 4 elements
       - 0 : "https://www.edamam.com/web-img/68c/68caad54d19488427bce4edebcd4e84e.jpg"
       - 1 : "https://www.edamam.com/web-img/68c/68caad54d19488427bce4edebcd4e84e-m.jpg"
       - 2 : "https://www.edamam.com/web-img/68c/68caad54d19488427bce4edebcd4e84e-s.jpg"
       - 3 : "https://www.edamam.com/web-img/68c/68caad54d19488427bce4edebcd4e84e-l.jpg"
     - favorite : false
   ▿ 7 : RecipeToShow
     ▿ idRecipe : Optional<String>
       - some : "2d30829f3a4b121e38de3acd368beabd"
     ▿ label : Optional<String>
       - some : "Ditzy\'s Shrimp Salad"
     ▿ yield : Optional<String>
       - some : "14"
     ▿ duration : Optional<String>
       - some : "90"
     ▿ ingredients : Optional<Array<String>>
       ▿ some : 14 elements
         - 0 : "30 medium Shrimp, raw"
         - 1 : "2 cup No Name Frozen Peas and Carrotts (by LISSSYWE)"
         - 2 : "6 tbsp Sour Cream"
         - 3 : "1 Lemon Juiced"
         - 4 : "6-7 pieces of whole black pepper"
         - 5 : "1/2 teaspoon McCormick Gourmet™ Sicilian Sea Salt"
         - 6 : "3 tbsp Vinegar - Natural Rice Vinegar (Nakano)"
         - 7 : "3 ounces cabbage cut into strips"
         - 8 : "4 stalk, large (11\"-12\" long) Celery, raw"
         - 9 : "6 tbsp Hellmann\'s Mayonaise"
         - 10 : "1 cup, chopped Onions, raw"
         - 11 : "1 1/4 cups (250g) sugar"
         - 12 : "1 tsp Dill weed, dried"
         - 13 : "+ 7 ounces vermicelli noodle"
     ▿ ingredientWithDetails : Optional<Array<String>>
       ▿ some : 14 elements
         - 0 : "30 medium Shrimp, raw"
         - 1 : "2 cup No Name Frozen Peas and Carrotts (by LISSSYWE)"
         - 2 : "6 tbsp Sour Cream"
         - 3 : "1 serving Lemon, fresh squeezed, juice of one whole lemon"
         - 4 : "1 tsp Pepper, black"
         - 5 : ".25 tsp Pink Himalayan Sea Salt (Evolution Salt Co) (by TAMMAGDALENO)"
         - 6 : "3 tbsp Vinegar - Natural Rice Vinegar (Nakano)"
         - 7 : "1 cup, chopped Cabbage, red, fresh"
         - 8 : "4 stalk, large (11\"-12\" long) Celery, raw"
         - 9 : "6 tbsp Hellmann\'s Mayonaise"
         - 10 : "1 cup, chopped Onions, raw"
         - 11 : ".25 cup Granulated Sugar"
         - 12 : "1 tsp Dill weed, dried"
         - 13 : "3 serving maccaroni - elbow - Catelli (3/4 cup dry) (by NAJEAN)"
     ▿ urlApi : Optional<String>
       - some : "http://www.edamam.com/recipe/ditzy-s-shrimp-salad-2d30829f3a4b121e38de3acd368beabd/carrottes"
     ▿ urlSrc : Optional<String>
       - some : "https://recipes.sparkpeople.com/recipe-detail.asp?recipe=3395768"
     ▿ img : Optional<UIImage>
       - some : <UIImage:0x600000900d80 anonymous {300, 300} renderingMode=automatic>
     ▿ images : 3 elements
       - 0 : "https://www.edamam.com/web-img/ca0/ca0483df3fffbab308348c58034f54ba.jpg"
       - 1 : "https://www.edamam.com/web-img/ca0/ca0483df3fffbab308348c58034f54ba-m.jpg"
       - 2 : "https://www.edamam.com/web-img/ca0/ca0483df3fffbab308348c58034f54ba-s.jpg"
     - favorite : false
   ▿ 8 : RecipeToShow
     ▿ idRecipe : Optional<String>
       - some : "9971d1507898232200766ca80bdbdd94"
     ▿ label : Optional<String>
       - some : "Savory Pork Pot Stickers"
     ▿ yield : Optional<String>
       - some : "24"
     ▿ duration : Optional<String>
       - some : "35"
     ▿ ingredients : Optional<Array<String>>
       ▿ some : 16 elements
         - 0 : "24 Wonton Wrappers (We Used 3x3 Inch Size)"
         - 1 : "3 spring onions , sliced"
         - 2 : "¼ teaspoons Sesame Seeds"
         - 3 : "3 tbsp Vinegar - Natural Rice Vinegar (Nakano)"
         - 4 : "3 spring onions , sliced"
         - 5 : "1 teaspoon Sesame Oil"
         - 6 : "8 ounces, weight Ground Pork"
         - 7 : "¼ teaspoons Garlic Powder"
         - 8 : "4 Tablespoons Vegetable Oil, For Cooking Dumplings (2 Tablespoons Per Batch)"
         - 9 : "2 Cloves of garlic"
         - 10 : "1 1/4 cups (250g) sugar"
         - 11 : "½ cups Chopped Cilantro"
         - 12 : "1 cup water"
         - 13 : "3 spring onions , sliced"
         - 14 : "3 ounces cabbage cut into strips"
         - 15 : "1.0 tbsp reduced-salt soy sauce"
     ▿ ingredientWithDetails : Optional<Array<String>>
       ▿ some : 16 elements
         - 0 : "24 Wonton Wrappers (We Used 3x3 Inch Size)"
         - 1 : "1 Tablespoon Finely Chopped Green Onions"
         - 2 : "¼ teaspoons Sesame Seeds"
         - 3 : "¼ cups Rice Vinegar"
         - 4 : "¼ cups Finely Chopped Green Onions"
         - 5 : "1 teaspoon Sesame Oil"
         - 6 : "8 ounces, weight Ground Pork"
         - 7 : "¼ teaspoons Garlic Powder"
         - 8 : "4 Tablespoons Vegetable Oil, For Cooking Dumplings (2 Tablespoons Per Batch)"
         - 9 : "1 teaspoon Freshly Chopped Garlic"
         - 10 : "½ teaspoons Sugar"
         - 11 : "½ cups Chopped Cilantro"
         - 12 : "½ cups Water, For Cooking Dumplings (1/4 Cup Per Batch)"
         - 13 : "2 Tablespoons Finely Chopped Ramps Or Garlic"
         - 14 : "½ cups Finely Chopped Cabbage"
         - 15 : "1 Tablespoon Soy Sauce"
     ▿ urlApi : Optional<String>
       - some : "http://www.edamam.com/recipe/savory-pork-pot-stickers-9971d1507898232200766ca80bdbdd94/carrottes"
     ▿ urlSrc : Optional<String>
       - some : "https://tastykitchen.com/recipes/appetizers-and-snacks/savory-pork-pot-stickers/"
     ▿ img : Optional<UIImage>
       - some : <UIImage:0x60000091c120 anonymous {300, 300} renderingMode=automatic>
     ▿ images : 3 elements
       - 0 : "https://www.edamam.com/web-img/daf/daf05989cf32cf91fc31c5a4960ea537.jpg"
       - 1 : "https://www.edamam.com/web-img/daf/daf05989cf32cf91fc31c5a4960ea537-m.jpg"
       - 2 : "https://www.edamam.com/web-img/daf/daf05989cf32cf91fc31c5a4960ea537-s.jpg"
     - favorite : false
 */
