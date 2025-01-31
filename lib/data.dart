import 'package:kfc_project/images.dart';

//Menu Item
/*List<Map<String, String>> menuItem = [
  {
    "title": "Everyday Value",
    "image": Images.categoryEveryday
  },
  {
    "title": "Ala-Carte & Combos",
    "image": Images.categoryAlaCarte
  },
  {
    "title": "Promotion",
    "image": Images.categoryPromotion
  },
  {
    "title": "Signature Boxes",
    "image": Images.categorySignature
  },
  {
    "title": "Sharing",
    "image": Images.categorySharing
  }
];*/

// Best sellers
List<Map<String, String>> bestSeller = [
  {
    "name": "Krunch Burger",
    "price": "310",
    "image": Images.productKrunchBurger
  },
  {"name": "Krunch Combo", "price": "580", "image": Images.productkrunchCombo},
  {
    "name": "Chicken & Chips",
    "price": "250",
    "image": Images.productChickenChips
  },
  {"name": "Hot Wings Bucket", "price": "390", "image": Images.productHotWings},
  {"name": "Mighty Zinger", "price": "350", "image": Images.productMightyZinger}
];
// Top Deal
List<Map<String, String>> topDeals = [
  {
    "name": "Zinger Stacker Combo",
    "price": "900",
    "description": "1 Zinger Stacker + 1 Regular fries + 1 Regular drink",
    "image": Images.productZingerStacker
  },

  // {
  //   "name":"Zinger Got Wings",
  //   "price":"3500",
  //   "description":"2 Zinger Burgers + 2 Regular Drinks + Wings Bucket (6 pcs)",
  //   "image":Images.productZingerGotWings
  // },
  {
    "name": "Crispy Duo Box",
    "price": "3400",
    "description":
        "Turn up the fun with 5 pcs Hot & Crispy Chicken + 1 Large fries + 2 Regular drinks",
    "image": Images.productCrispyDuoBox
  },
  {
    "name": "Family Festival 3",
    "price": "1100",
    "description":
        "An ultimate meal for the fam. It includes 4 Zinger burgers + 4 pieces Hot and Crispy Chicken + 2 Dinner rolls + 1.5 Liter drink",
    "image": Images.productFamilyFestival
  }
];
// Products list
/*List<Map<String, dynamic>> products = [
  //Everyday
  {
    "category": "Everyday Value",
    "title": "Krunch Burger",
    "description": "Krunch fillet, spicy mayo, lettuce, sandwiched between a sesame seed bun",
    "price": "Rs 310",
    "imageUrl": "https://www.kfcpakistan.com/images/b438e990-bc23-11ee-be0d-ed0e61ce8a3a-Untitleddesign(5)-min_variant_0-2024-01-26082002.png"
  },
  {
    "category": "Everyday Value",
    "title": "Zingeratha",
    "description": "Tender boneless strips, sliced onions, tangy imli chutney, mint mayo, wrapped in a soft paratha",
    "price": "Rs 390",
    "imageUrl": "https://www.kfcpakistan.com/images/19b05560-bc56-11ee-97d6-7187fd7553de-Zingeratha_variant_0-2024-01-26142047.png"
  },
  {
    "category": "Everyday Value",
    "title": "Rice & Spice",
    "description": "Spiced and buttery rice with 6 pcs of Hot Shots topped with our signature Vietnamese sauce",
    "price": "Rs 390",
    "imageUrl": "https://www.kfcpakistan.com/images/b0c33f70-bc52-11ee-b144-5b816f8c83f0-Riceandspice_variant_0-2024-01-26135623.png"
  },
  {
    "category": "Everyday Value",
    "title": "Krunch Burger + Drink",
    "description": "1 Krunch burger + 1 Regular drink",
    "price": "Rs 410",
    "imageUrl": "https://www.kfcpakistan.com/images/634e6df0-9627-11ef-9743-9dc2917109de-Krunch+drink-2024-10-29185538.png"
  },
  {
    "category": "Everyday Value",
    "title": "Boneless Strips",
    "description": "3 Chicken strips for a hassle free boneless experience",
    "price": "Rs 440",
    "imageUrl": "https://www.kfcpakistan.com/images/3fda5fc0-c1c8-11ee-88d6-317ad09e56fd-Chicken-Strips_variant_0-2024-02-02124030.png"
  },
  {
    "category": "Everyday Value",
    "title": "Twister",
    "description": "Tender boneless strips, black pepper mayo, diced tomatoes and lettuce- wrapped in a tortilla",
    "price": "Rs 440",
    "imageUrl": "https://www.kfcpakistan.com/images/337af8e0-0461-11ee-a89a-612c84c58a93-twister_variant_0-2023-06-06115641.png"
  },
  {
    "category": "Everyday Value",
    "title": "Krunch Combo",
    "description": "1 Krunch burger + 1 Regular fries + 1 Regular drink",
    "price": "Rs 590",
    "imageUrl": "https://www.kfcpakistan.com/images/63fb28b0-9627-11ef-b835-bd990eec9c91-Krunch-combocopy-2024-10-29185539.png"
  },
  {
    "category": "Everyday Value",
    "title": "Chicken & Chips",
    "description": "2 pieces of Hot and Crispy Fried Chicken+ Fries + Dinner roll+ signature Vietnamese Sauce",
    "price": "Rs 620",
    "imageUrl": "https://www.kfcpakistan.com/images/43a98620-ffaa-11ed-b6b3-6970cc1cd666-chicken-n-chips_variant_0-2023-05-31115706.png"
  },
  {
    "category": "Everyday Value",
    "title": "Krunch Chicken Combo",
    "description": "1 Krunch burger + 1 pc of Hot and Crispy Fried Chicken + 1 Regular drink",
    "price": "Rs 620",
    "imageUrl": "https://www.kfcpakistan.com/images/63fb28b0-9627-11ef-b420-51a55a9d1dbc-krunch-with-combo-2024-10-29185539.png"
  },
  {
    "category": "Everyday Value",
    "title": "3 Pcs Chicken",
    "description": "3 pieces of Hot and Crispy Fried Chicken",
    "price": "Rs 690",
    "imageUrl": "https://www.kfcpakistan.com/images/43aa4970-ffaa-11ed-9c55-3705f003c528-3pc-Chikcen_variant_0-2023-05-31115706.png"
  },

  // Ala carte

  {
    "category": "Ala-Carte & Combos",
    "title": "Zinger Burger",
    "description": "Crispy Zinger fillet, signature mayo, and lettuce sandwiched between a sesame seed bun.",
    "price": 600,
    "imageUrl": "https://www.kfcpakistan.com/images/6249b820-0513-11ee-9e45-cb0ed000d4a6-Zinger_variant_0-2023-06-07091210.png",
  },
  {
    "category": "Ala-Carte & Combos",
    "title": "Zinger Stacker",
    "description": "Double crunch fillet, jalapenos, spicy mayo, lettuce, and cheese with our signature Vietnamese sauce on a corn meal bun.",
    "price": 660,
    "imageUrl": "https://www.kfcpakistan.com/images/33685b40-0461-11ee-911c-497570899609-Stacker_variant_0-2023-06-06115641.png",
  },
  {
    "category": "Ala-Carte & Combos",
    "title": "Kentucky Burger",
    "description": "OG Zinger fillet with beef pepperoni, crispy fried onions, cheese, and smoky BBQ sauce on a herb and black sesame bun.",
    "price": 660,
    "imageUrl": "https://www.kfcpakistan.com/images/332ab600-0461-11ee-8f91-addd12cf7fa1-Kentucky_variant_0-2023-06-06115641.png",
  },
  {
    "category": "Ala-Carte & Combos",
    "title": "Mighty Zinger",
    "description": "Double Zinger fillet with spicy and plain mayo, lettuce, and cheese on a sesame seed bun.",
    "price": 770,
    "imageUrl": "https://www.kfcpakistan.com/images/33685b40-0461-11ee-911c-497570899609-Mighty_variant_0-2023-06-06115641.png",
  },
  {
    "category": "Ala-Carte & Combos",
    "title": "Zinger Combo",
    "description": "Zinger burger, regular fries, and a regular drink.",
    "price": 910,
    "imageUrl": "https://www.kfcpakistan.com/images/63fb28b0-9627-11ef-b420-51a55a9d1dbc-Zinger-combo-2024-10-29185539.png",
  },
  {
    "category": "Ala-Carte & Combos",
    "title": "Zinger Stacker Combo",
    "description": "Zinger Stacker, regular fries, and a regular drink.",
    "price": 950,
    "imageUrl": "https://www.kfcpakistan.com/images/63fb28b0-9627-11ef-be4f-a734b6b6ba4f-stacker-combo-2024-10-29185539.png",
  },
  {
    "category": "Ala-Carte & Combos",
    "title": "Kentucky Burger Combo",
    "description": "Kentucky burger, regular fries, and a regular drink.",
    "price": 950,
    "imageUrl": "https://www.kfcpakistan.com/images/634e6df0-9627-11ef-9ec0-65eb1a09483e-kentucky-combo-1-2024-10-29185538.png",
  },
  {
    "category": "Ala-Carte & Combos",
    "title": "Mighty Zinger Combo",
    "description": "Mighty Zinger, regular fries, and a regular drink.",
    "price": 1050,
    "imageUrl": "https://www.kfcpakistan.com/images/634e6df0-9627-11ef-b12f-312c6a2b6968-Mightycombocopy-2024-10-29185538.png",
  },
// Promotion
  {
    "category": "Promotion",
    "title": "Zinger Got Wings",
    "description": "2 Zinger Burgers + 2 Regular Drinks + Wings Bucket (6 pcs).",
    "price": 1150,
    "imageUrl": "https://www.kfcpakistan.com/images/7e703860-8c0a-11ef-96ca-83eb584d9244-Thumbnail(3)-2024-10-16220337.png",
  },
// Signature box
  {
    "category": "Signature Boxes",
    "title": "Crispy Box",
    "description": "In mood for something crispy? Get 2 pcs Hot & Crispy Chicken + 1 Regular fries + 1 Regular drink + 1 Coleslaw",
    "price": 710,
    "imageUrl": "https://www.kfcpakistan.com/images/63fb28b0-9627-11ef-b420-51a55a9d1dbc-CrispyBox-2024-10-29185539.png",
  },
  {
    "category": "Signature Boxes",
    "title": "Boneless Box",
    "description": "Hassle free boneless experience with 4 Chicken strips + 1 Coleslaw + 1 Regular fries + 1 Regular drink + 1 Dip + 1 Dinner roll",
    "price": 710,
    "imageUrl": "https://www.kfcpakistan.com/images/634e6df0-9627-11ef-948a-393892ee3054-BonelessBox-2024-10-29185538.png",
  },
  {
    "category": "Signature Boxes",
    "title": "Wow Box",
    "description": "Feel good with 1 Signature Zinger + 1 pc Hot & Crispy Chicken + 1 Regular fries + 1 Regular drink + 1 Coleslaw",
    "price": 1050,
    "imageUrl": "https://www.kfcpakistan.com/images/63fb28b0-9627-11ef-b420-51a55a9d1dbc-wow-box-2024-10-29185539.png",
  },
  {
    "category": "Signature Boxes",
    "title": "Crispy Duo Box",
    "description": "Turn up the fun with 5 pcs Hot & Crispy Chicken + 1 Large fries + 2 Regular drinks",
    "price": 1350,
    "imageUrl": "https://www.kfcpakistan.com/images/63fb28b0-9627-11ef-b5b6-331c16c28159-CrispyDuoBox-2024-10-29185539.png",
  },
  {
    "category": "Signature Boxes",
    "title": "Xtreme Duo Box",
    "description": "The irresistible combo of 2 Signature Zingers + 2 pcs Hot & Crispy Chicken + 1 Large fries + 2 Regular drinks",
    "price": 1560,
    "imageUrl": "https://www.kfcpakistan.com/images/63fb28b0-9627-11ef-be4f-a734b6b6ba4f-XtremeDuoBox-2024-10-29185539.png",
  },
//Sharing
  {
    "category": "Sharing",
    "title": "Value Bucket",
    "description": "Our pride and joy: hand-breaded and fried to perfection in house. 9 pcs of Colonel’s Signature Crispy Fried Chicken. It's finger lickin' good. Rs. 50 from Every Bucket Sold Goes to Mitao Bhook Foundation.",
    "price": 2050,
    "imageUrl": "https://www.kfcpakistan.com/images/43a95f10-ffaa-11ed-b673-4121381f04c6-value-Bucket-2023-05-31115706.png",
  },
  {
    "category": "Sharing",
    "title": "Family Festival 1",
    "description": "A feel-good meal for the fam. It includes 4 Krunch burgers + 4 pieces Hot and Crispy Chicken + 2 Dinner Rolls + 1.5 Liter drink.",
    "price": 2190,
    "imageUrl": "https://www.kfcpakistan.com/images/63fb28b0-9627-11ef-b5b6-331c16c28159-family-Festivle-1-2024-10-29185539.png",
  },
  {
    "category": "Sharing",
    "title": "Family Festival 2",
    "description": "A hearty meal for the fam. It includes 2 Zinger burgers + 2 Krunch burgers + 4 pieces Hot and Crispy Chicken + 2 Dinner rolls + 1.5 Liter drink.",
    "price": 2390,
    "imageUrl": "https://www.kfcpakistan.com/images/63fb28b0-9627-11ef-b835-bd990eec9c91-Family-Festivle-2-2024-10-29185539.png",
  },
  {
    "category": "Sharing",
    "title": "Family Festival 3",
    "description": "An ultimate meal for the fam. It includes 4 Zinger burgers + 4 pieces Hot and Crispy Chicken + 2 Dinner rolls + 1.5 Liter drink.",
    "price": 2590,
    "imageUrl": "https://www.kfcpakistan.com/images/634e6df0-9627-11ef-b12f-312c6a2b6968-family-Festivle-3-2024-10-29185538.png",
  },
  //Snacks & Beverages
  {
    "category": "Snacks & Beverages",
    "title": "Dinner Roll",
    "description": "Soft and fluffy, it complements any meal perfectly",
    "price": "Rs 50",
    "imageUrl": "https://www.kfcpakistan.com/images/62153aa0-0513-11ee-8eee-c7aabf77bad4-Dinner-Roll-copy_variant_0-2023-06-07091210.png"
  },
  {
    "category": "Snacks & Beverages",
    "title": "Mayo Dip",
    "description": "Creamy mayo for your dipping needs",
    "price": "Rs 50",
    "imageUrl": "https://www.kfcpakistan.com/images/54939910-c4c3-11ee-9709-a3e2f7c40488-Dip-1_variant_0-2024-02-06074251.png"
  },
  {
    "category": "Snacks & Beverages",
    "title": "Vietnamese Dip",
    "description": "Our spicy and sour signature sauce. Pair it with our fried chicken and fries for the win",
    "price": "Rs 50",
    "imageUrl": "https://www.kfcpakistan.com/images/54c3a9c0-c4c3-11ee-9105-e90f4df78c69-Dip-2_variant_0-2024-02-06074251.png"
  },
  {
    "category": "Snacks & Beverages",
    "title": "Mineral Water 500ml",
    "description": "Stay hydrated with our refreshing and pure mineral water in a convenient 500ml bottle",
    "price": "Rs 90",
    "imageUrl": "https://www.kfcpakistan.com/images/61ea8120-0513-11ee-b037-a334837c64cb-Water_variant_0-2023-06-07091210.png"
  },
  {
    "category": "Snacks & Beverages",
    "title": "Coleslaw",
    "description": "Sliced cabbage and carrots tossed in mayo",
    "price": "Rs 150",
    "imageUrl": "https://www.kfcpakistan.com/images/43a98620-ffaa-11ed-b6b3-6970cc1cd666-Coleslaw_variant_0-2023-05-31115706.png"
  },
  {
    "category": "Snacks & Beverages",
    "title": "Pepsi Regular",
    "description": "Quench your thirst with the classic taste of Pepsi in a regular-sized bottle 345ml",
    "price": "Rs 180",
    "imageUrl": "https://www.kfcpakistan.com/images/fea54530-3eed-11ef-b424-552aa36b144a-Pepsi-345ml_variant_0-2024-07-10185537.png"
  },
  {
    "category": "Snacks & Beverages",
    "title": "7UP Regular",
    "description": "Experience the crisp and refreshing taste of 7UP in a regular-sized bottle",
    "price": "Rs 180",
    "imageUrl": "https://www.kfcpakistan.com/images/6249b820-0513-11ee-9e45-cb0ed000d4a6-7up_variant_0-2023-06-07091210.png"
  },
  // Midnight
  {
    "category": "Midnight (Start at 12 am)",
    "title": "Midnight Deal 1",
    "description": "1 Zinger burger + 1 regular drink",
    "price": "Rs 520",
    "imageUrl": "https://www.kfcpakistan.com/images/634e6df0-9627-11ef-9743-9dc2917109de-MidnightDeal1-2024-10-29185538.png",
    "altText": "Midnight deal - zinger burger with regular drink"
  },
  {
    "category": "Midnight (Start at 12 am)",
    "title": "Midnight Deal 2",
    "description": "2 Krunch burgers + 2 regular drinks",
    "price": "Rs 610",
    "imageUrl": "https://www.kfcpakistan.com/images/634e6df0-9627-11ef-948a-393892ee3054-MidnightDeal2-2024-10-29185538.png",
    "altText": "Midnight deal 2 - krunch burger with drink"
  },
  {
    "category": "Midnight (Start at 12 am)",
    "title": "Midnight Deal 3",
    "description": "Mighty Zinger + Regular drink",
    "price": "Rs 710",
    "imageUrl": "https://www.kfcpakistan.com/images/634e6df0-9627-11ef-948a-393892ee3054-MidnightDeal3-2024-10-29185538.png",
    "altText": "Midnight deal 3 - Mighty zinger with drink"
  },
];*/
//Categories
/*
final List<String> categories = [
  "All",
  "Everyday Value",
  "Ala-Carte & Combos",
  "Promotion",
  "Signature Boxes",
  "Sharing",
  "Snacks & Beverages",
  "Midnight (Start at 12 am)"

];
*/
