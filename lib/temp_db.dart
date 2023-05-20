class FoodApi {
  static final List<String> restoName = [
    'Kedai Gua',
    'Warung Bali',
    'Dapur Tante'
  ];
  static final List<List<String>> foodImgPath = [
    [
      'https://upload.wikimedia.org/wikipedia/commons/2/24/Ayam_geprek.png',
      'https://aromarasa.com/wp-content/uploads/2021/07/resep-kentang-goreng-crispy-ala-mcd-sederhana.jpg',
      'https://cbtl-images.s3.us-west-1.amazonaws.com/Production/Drupal/s3fs-public/styles/cafe_menu_item/public/cafe-menu/Mango%20Ice%20Blended%20drink.jpg?itok=w5Y1qx6A'
    ],
    [
      'https://cdn-2.tstatic.net/kaltim/foto/bank/images/resep-ayam-bakar-tulang-lunak-enak.jpg',
      'https://img.okezone.com/content/2022/07/13/298/2628977/kalori-nasi-uduk-menu-sarapan-favorit-orang-indonesia-bikin-gemuk-YUzqTbTieA.jpeg',
      'https://static.sehatq.com/content/review/image/1661766520.jpeg',
    ],
    [
      'https://asset.kompas.com/crops/AOxjgbVCl_OySCVMPBlH0FaBMWI=/106x50:906x583/780x390/data/photo/2022/06/04/629ac9495413f.jpg',
      'https://img-global.cpcdn.com/recipes/0708ba41c3f11703/1200x630cq70/photo.jpg',
      'https://sgp1.digitaloceanspaces.com/tz-mag-id/wp-content/uploads/2020/09/121209091717/4-Batagor-Ihsan.jpg',
    ]
  ];

  static final List<List<List<String>>> restoData = [
    [
      ['Ayam Geprek', '12000'],
      ['Kentang Goreng', '10000'],
      ['Mango Ice Blend', '12000']
    ],
    [
      ['Ayam Bakar', '15000'],
      ['Nasi Uduk', '12000'],
      ['Ayam Goreng', '13000']
    ],
    [
      ['Chicken Katsu', '12000'],
      ['Roti Bakar', '10000'],
      ['Batagor', '10000']
    ]
  ];

  static List<String> getFoodSuggestion(String query) {
    return FoodApi.restoData.map((e) => e[0][0]).where((element) {
      final queryLower = query.toLowerCase();
      final nameLower = query.toLowerCase();

      return nameLower.contains(queryLower);
    }).toList();
  }
}
