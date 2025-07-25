import '../../features/home/models/category.dart';
import '../../features/home/models/formula.dart';

final List<Category> categories = [
  Category(
    id: 'triangles',
    name: 'Üçgenler',
    iconPath: 'assets/icons/triangle.svg',
    subcategories: [
      Category(
        id: 'right_triangle',
        name: 'Dik Üçgen',
        iconPath: 'assets/icons/right_triangle.svg',
        subcategories: [],
      ),
      Category(
        id: 'equilateral_triangle',
        name: 'Eşkenar Üçgen',
        iconPath: 'assets/icons/equilateral_triangle.svg',
        subcategories: [],
      ),
      Category(
        id: 'isosceles_triangle',
        name: 'İkizkenar Üçgen',
        iconPath: 'assets/icons/isosceles_triangle.svg',
        subcategories: [],
      ),
    ],
  ),
  Category(
    id: 'quadrilaterals',
    name: 'Dörtgenler',
    iconPath: 'assets/icons/quadrilateral.svg',
    subcategories: [
      Category(
        id: 'square',
        name: 'Kare',
        iconPath: 'assets/icons/square.svg',
        subcategories: [],
      ),
      Category(
        id: 'rectangle',
        name: 'Dikdörtgen',
        iconPath: 'assets/icons/rectangle.svg',
        subcategories: [],
      ),
      Category(
        id: 'parallelogram',
        name: 'Paralelkenar',
        iconPath: 'assets/icons/parallelogram.svg',
        subcategories: [],
      ),
      Category(
        id: 'trapezoid',
        name: 'Yamuk',
        iconPath: 'assets/icons/trapezoid.svg',
        subcategories: [],
      ),
      Category(
        id: 'rhombus',
        name: 'Eşkenar Dörtgen',
        iconPath: 'assets/icons/rhombus.svg',
        subcategories: [],
      ),
    ],
  ),
  Category(
    id: 'polygons',
    name: 'Çokgenler',
    iconPath: 'assets/icons/polygon.svg',
    subcategories: [
      Category(
        id: 'pentagon',
        name: 'Beşgen',
        iconPath: 'assets/icons/pentagon.svg',
        subcategories: [],
      ),
      Category(
        id: 'hexagon',
        name: 'Altıgen',
        iconPath: 'assets/icons/hexagon.svg',
        subcategories: [],
      ),
      Category(
        id: 'ngon',
        name: 'n-Kenarlı Çokgen',
        iconPath: 'assets/icons/ngon.svg',
        subcategories: [],
      ),
    ],
  ),
  Category(
    id: 'circle',
    name: 'Çember ve Daire',
    iconPath: 'assets/icons/circle.svg',
    subcategories: [
      Category(
        id: 'circle_basic',
        name: 'Çember',
        iconPath: 'assets/icons/circle_basic.svg',
        subcategories: [],
      ),
      Category(
        id: 'disk',
        name: 'Daire',
        iconPath: 'assets/icons/disk.svg',
        subcategories: [],
      ),
      Category(
        id: 'arc',
        name: 'Yay',
        iconPath: 'assets/icons/arc.svg',
        subcategories: [],
      ),
      Category(
        id: 'chord',
        name: 'Kiriş',
        iconPath: 'assets/icons/chord.svg',
        subcategories: [],
      ),
    ],
  ),
  Category(
    id: 'solids',
    name: 'Katı Cisimler',
    iconPath: 'assets/icons/solid.svg',
    subcategories: [
      Category(
        id: 'cube',
        name: 'Küp',
        iconPath: 'assets/icons/cube.svg',
        subcategories: [],
      ),
      Category(
        id: 'rectangular_prism',
        name: 'Dikdörtgenler Prizması',
        iconPath: 'assets/icons/rectangular_prism.svg',
        subcategories: [],
      ),
      Category(
        id: 'cylinder',
        name: 'Silindir',
        iconPath: 'assets/icons/cylinder.svg',
        subcategories: [],
      ),
      Category(
        id: 'cone',
        name: 'Koni',
        iconPath: 'assets/icons/cone.svg',
        subcategories: [],
      ),
      Category(
        id: 'sphere',
        name: 'Küre',
        iconPath: 'assets/icons/sphere.svg',
        subcategories: [],
      ),
    ],
  ),
  Category(
    id: 'analytic',
    name: 'Analitik Geometri',
    iconPath: 'assets/icons/analytic.svg',
    subcategories: [
      Category(
        id: 'line',
        name: 'Doğru',
        iconPath: 'assets/icons/line.svg',
        subcategories: [],
      ),
      Category(
        id: 'circle_analytic',
        name: 'Daire',
        iconPath: 'assets/icons/circle_analytic.svg',
        subcategories: [],
      ),
      Category(
        id: 'parabola',
        name: 'Parabol',
        iconPath: 'assets/icons/parabola.svg',
        subcategories: [],
      ),
      Category(
        id: 'ellipse',
        name: 'Elips',
        iconPath: 'assets/icons/ellipse.svg',
        subcategories: [],
      ),
      Category(
        id: 'hyperbola',
        name: 'Hiperbol',
        iconPath: 'assets/icons/hyperbola.svg',
        subcategories: [],
      ),
    ],
  ),
  Category(
    id: 'calculator',
    name: 'Hesap Makinesi',
    iconPath: 'assets/icons/calculator.svg',
    subcategories: [
      Category(
        id: 'basic_ops',
        name: 'Dört İşlem',
        iconPath: 'assets/icons/basic_ops.svg',
        subcategories: [],
      ),
      Category(
        id: 'percent',
        name: 'Yüzde',
        iconPath: 'assets/icons/percent.svg',
        subcategories: [],
      ),
      Category(
        id: 'sqrt',
        name: 'Karekök',
        iconPath: 'assets/icons/sqrt.svg',
        subcategories: [],
      ),
      Category(
        id: 'power',
        name: 'Üs Alma',
        iconPath: 'assets/icons/power.svg',
        subcategories: [],
      ),
    ],
  ),
];

final List<Formula> formulas = [
  // Üçgenler
  Formula(
    id: 'f1',
    title: 'Dik Üçgen Alanı',
    description: 'Dik üçgende alan, dik kenarların çarpımının yarısıdır.',
    formulaText: r'A = \frac{a \cdot b}{2}',
    imagePath: null,
    categoryId: 'right_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f2',
    title: 'Dik Üçgen Hipotenüs',
    description: 'Dik üçgende hipotenüs: Pisagor teoremi.',
    formulaText: r'c = \sqrt{a^2 + b^2}',
    imagePath: null,
    categoryId: 'right_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f3',
    title: 'Eşkenar Üçgen Alanı',
    description:
        'Eşkenar üçgende alan, kenar uzunluğunun karesiyle kök 3 ün çarpımının dörtte biridir.',
    formulaText: r'A = \frac{a^2 \sqrt{3}}{4}',
    imagePath: null,
    categoryId: 'equilateral_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f4',
    title: 'Eşkenar Üçgen Yüksekliği',
    description: 'Eşkenar üçgende yükseklik.',
    formulaText: r'h = \frac{a \sqrt{3}}{2}',
    imagePath: null,
    categoryId: 'equilateral_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f5',
    title: 'İkizkenar Üçgen Alanı',
    description:
        'İkizkenar üçgende alan, taban ve yükseklik çarpımının yarısıdır.',
    formulaText: r'A = \frac{a \cdot h}{2}',
    imagePath: null,
    categoryId: 'isosceles_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f6',
    title: 'İkizkenar Üçgende Kenar',
    description: 'İkizkenar üçgende eşit kenar uzunluğu.',
    formulaText: r'a = \sqrt{h^2 + \left(\frac{b}{2}\right)^2}',
    imagePath: null,
    categoryId: 'isosceles_triangle',
    isFavorited: false,
  ),
  // Dörtgenler
  Formula(
    id: 'f7',
    title: 'Kare Alanı',
    description: 'Karenin alanı, bir kenarının karesidir.',
    formulaText: r'A = a^2',
    imagePath: null,
    categoryId: 'square',
    isFavorited: false,
  ),
  Formula(
    id: 'f8',
    title: 'Kare Çevresi',
    description: 'Karenin çevresi, dört kenarın toplamıdır.',
    formulaText: r'Ç = 4a',
    imagePath: null,
    categoryId: 'square',
    isFavorited: false,
  ),
  Formula(
    id: 'f9',
    title: 'Dikdörtgen Alanı',
    description: 'Dikdörtgenin alanı, kısa ve uzun kenarın çarpımıdır.',
    formulaText: r'A = a \cdot b',
    imagePath: null,
    categoryId: 'rectangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f10',
    title: 'Dikdörtgen Çevresi',
    description:
        'Dikdörtgenin çevresi, iki kısa ve iki uzun kenarın toplamıdır.',
    formulaText: r'Ç = 2(a + b)',
    imagePath: null,
    categoryId: 'rectangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f11',
    title: 'Paralelkenar Alanı',
    description: 'Paralelkenarın alanı, taban ve yükseklik çarpımıdır.',
    formulaText: r'A = a \cdot h',
    imagePath: null,
    categoryId: 'parallelogram',
    isFavorited: false,
  ),
  Formula(
    id: 'f12',
    title: 'Yamuk Alanı',
    description:
        'Yamuğun alanı, tabanların toplamı ile yükseklik çarpımının yarısıdır.',
    formulaText: r'A = \frac{(a + b) \cdot h}{2}',
    imagePath: null,
    categoryId: 'trapezoid',
    isFavorited: false,
  ),
  Formula(
    id: 'f13',
    title: 'Eşkenar Dörtgen Alanı',
    description: 'Eşkenar dörtgende alan, köşegenlerin çarpımının yarısıdır.',
    formulaText: r'A = \frac{e \cdot f}{2}',
    imagePath: null,
    categoryId: 'rhombus',
    isFavorited: false,
  ),
  // Çokgenler
  Formula(
    id: 'f14',
    title: 'Düzenli Beşgen Alanı',
    description: 'Düzenli beşgenin alanı.',
    formulaText: r'A = \frac{5a^2}{4} \cot\left(\frac{\pi}{5}\right)',
    imagePath: null,
    categoryId: 'pentagon',
    isFavorited: false,
  ),
  Formula(
    id: 'f15',
    title: 'Düzenli Altıgen Alanı',
    description: 'Düzenli altıgenin alanı.',
    formulaText: r'A = \frac{3\sqrt{3}}{2} a^2',
    imagePath: null,
    categoryId: 'hexagon',
    isFavorited: false,
  ),
  Formula(
    id: 'f16',
    title: 'Düzenli n-Kenarlı Çokgen Alanı',
    description: 'Düzenli n-kenarlı çokgenin alanı.',
    formulaText: r'A = \frac{n a^2}{4} \cot\left(\frac{\pi}{n}\right)',
    imagePath: null,
    categoryId: 'ngon',
    isFavorited: false,
  ),
  // Çember ve Daire
  Formula(
    id: 'f17',
    title: 'Çember Uzunluğu',
    description: 'Çemberin çevresi.',
    formulaText: r'C = 2\pi r',
    imagePath: null,
    categoryId: 'circle_basic',
    isFavorited: false,
  ),
  Formula(
    id: 'f18',
    title: 'Daire Alanı',
    description: 'Dairenin alanı.',
    formulaText: r'A = \pi r^2',
    imagePath: null,
    categoryId: 'disk',
    isFavorited: false,
  ),
  Formula(
    id: 'f19',
    title: 'Yay Uzunluğu',
    description: 'Çemberde yay uzunluğu.',
    formulaText: r'L = r \theta',
    imagePath: null,
    categoryId: 'arc',
    isFavorited: false,
  ),
  Formula(
    id: 'f20',
    title: 'Kiriş Uzunluğu',
    description: 'Çemberde kiriş uzunluğu.',
    formulaText: r'c = 2r \sin\left(\frac{\theta}{2}\right)',
    imagePath: null,
    categoryId: 'chord',
    isFavorited: false,
  ),
  Formula(
    id: 'f56',
    title: 'Daire Dilimi Alanı',
    description: 'Daire diliminin alanı, merkez açıya göre hesaplanır.',
    formulaText: r'A = \frac{\theta}{360^\circ} \cdot \pi r^2',
    imagePath: null,
    categoryId: 'disk',
    isFavorited: false,
  ),
  Formula(
    id: 'f57',
    title: 'Daire Parçası Alanı',
    description:
        'Daire parçasının alanı, dilim alanından üçgen alanı çıkarılarak bulunur.',
    formulaText: r'A = \frac{r^2}{2} (\theta - \sin\theta)',
    imagePath: null,
    categoryId: 'disk',
    isFavorited: false,
  ),
  // Katı Cisimler
  Formula(
    id: 'f21',
    title: 'Küp Hacmi',
    description: 'Küpün hacmi.',
    formulaText: r'V = a^3',
    imagePath: null,
    categoryId: 'cube',
    isFavorited: false,
  ),
  Formula(
    id: 'f22',
    title: 'Küp Yüzey Alanı',
    description: 'Küpün toplam yüzey alanı.',
    formulaText: r'A = 6a^2',
    imagePath: null,
    categoryId: 'cube',
    isFavorited: false,
  ),
  Formula(
    id: 'f23',
    title: 'Dikdörtgenler Prizması Hacmi',
    description: 'Dikdörtgenler prizmasının hacmi.',
    formulaText: r'V = a b h',
    imagePath: null,
    categoryId: 'rectangular_prism',
    isFavorited: false,
  ),
  Formula(
    id: 'f24',
    title: 'Silindir Hacmi',
    description: 'Silindirin hacmi.',
    formulaText: r'V = \pi r^2 h',
    imagePath: null,
    categoryId: 'cylinder',
    isFavorited: false,
  ),
  Formula(
    id: 'f25',
    title: 'Silindir Yüzey Alanı',
    description: 'Silindirin toplam yüzey alanı.',
    formulaText: r'A = 2\pi r (r + h)',
    imagePath: null,
    categoryId: 'cylinder',
    isFavorited: false,
  ),
  Formula(
    id: 'f26',
    title: 'Koni Hacmi',
    description: 'Koninin hacmi.',
    formulaText: r'V = \frac{1}{3} \pi r^2 h',
    imagePath: null,
    categoryId: 'cone',
    isFavorited: false,
  ),
  Formula(
    id: 'f27',
    title: 'Küre Hacmi',
    description: 'Kürenin hacmi.',
    formulaText: r'V = \frac{4}{3} \pi r^3',
    imagePath: null,
    categoryId: 'sphere',
    isFavorited: false,
  ),
  Formula(
    id: 'f28',
    title: 'Küre Yüzey Alanı',
    description: 'Kürenin yüzey alanı.',
    formulaText: r'A = 4\pi r^2',
    imagePath: null,
    categoryId: 'sphere',
    isFavorited: false,
  ),
  // Analitik Geometri
  Formula(
    id: 'f29',
    title: 'Doğru Denklemi',
    description: 'Doğrunun eğim-kesim formu.',
    formulaText: r'y = mx + n',
    imagePath: null,
    categoryId: 'line',
    isFavorited: false,
  ),
  Formula(
    id: 'f30',
    title: 'Daire Denklemi',
    description: 'Analitik düzlemde daire denklemi.',
    formulaText: r'(x - a)^2 + (y - b)^2 = r^2',
    imagePath: null,
    categoryId: 'circle_analytic',
    isFavorited: false,
  ),
  Formula(
    id: 'f31',
    title: 'Parabol Denklemi',
    description: 'Analitik düzlemde parabol denklemi.',
    formulaText: r'y = ax^2 + bx + c',
    imagePath: null,
    categoryId: 'parabola',
    isFavorited: false,
  ),
  Formula(
    id: 'f32',
    title: 'Elips Denklemi',
    description: 'Analitik düzlemde elips denklemi.',
    formulaText: r'\frac{(x - h)^2}{a^2} + \frac{(y - k)^2}{b^2} = 1',
    imagePath: null,
    categoryId: 'ellipse',
    isFavorited: false,
  ),
  Formula(
    id: 'f33',
    title: 'Hiperbol Denklemi',
    description: 'Analitik düzlemde hiperbol denklemi.',
    formulaText: r'\frac{(x - h)^2}{a^2} - \frac{(y - k)^2}{b^2} = 1',
    imagePath: null,
    categoryId: 'hyperbola',
    isFavorited: false,
  ),
  // Hesap Makinesi
  Formula(
    id: 'f34',
    title: 'Toplama',
    description: 'İki sayının toplamı.',
    formulaText: r'a + b',
    imagePath: null,
    categoryId: 'basic_ops',
    isFavorited: false,
  ),
  Formula(
    id: 'f35',
    title: 'Çıkarma',
    description: 'İki sayının farkı.',
    formulaText: r'a - b',
    imagePath: null,
    categoryId: 'basic_ops',
    isFavorited: false,
  ),
  Formula(
    id: 'f36',
    title: 'Çarpma',
    description: 'İki sayının çarpımı.',
    formulaText: r'a \times b',
    imagePath: null,
    categoryId: 'basic_ops',
    isFavorited: false,
  ),
  Formula(
    id: 'f37',
    title: 'Bölme',
    description: 'İki sayının bölümü.',
    formulaText: r'\frac{a}{b}',
    imagePath: null,
    categoryId: 'basic_ops',
    isFavorited: false,
  ),
  Formula(
    id: 'f38',
    title: 'Yüzde Hesaplama',
    description: 'Bir sayının yüzdesi.',
    formulaText: r'\frac{a \cdot b}{100}',
    imagePath: null,
    categoryId: 'percent',
    isFavorited: false,
  ),
  Formula(
    id: 'f39',
    title: 'Karekök',
    description: 'Bir sayının karekökü.',
    formulaText: r'\sqrt{a}',
    imagePath: null,
    categoryId: 'sqrt',
    isFavorited: false,
  ),
  Formula(
    id: 'f40',
    title: 'Üs Alma',
    description: 'Bir sayının üssü.',
    formulaText: r'a^b',
    imagePath: null,
    categoryId: 'power',
    isFavorited: false,
  ),
  // Üçgenler (Dik Üçgen, Eşkenar Üçgen, İkizkenar Üçgen) için ek formüller
  Formula(
    id: 'f41',
    title: 'Dik Üçgende Sinüs',
    description:
        'Dik üçgende bir açının sinüsü, karşı dik kenarın hipotenüse oranıdır.',
    formulaText: r'\sin(\theta) = \frac{a}{c}',
    imagePath: null,
    categoryId: 'right_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f42',
    title: 'Dik Üçgende Kosinüs',
    description:
        'Dik üçgende bir açının kosinüsü, komşu dik kenarın hipotenüse oranıdır.',
    formulaText: r'\cos(\theta) = \frac{b}{c}',
    imagePath: null,
    categoryId: 'right_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f43',
    title: 'Dik Üçgende Tanjant',
    description:
        'Dik üçgende bir açının tanjantı, karşı dik kenarın komşu dik kenara oranıdır.',
    formulaText: r'\tan(\theta) = \frac{a}{b}',
    imagePath: null,
    categoryId: 'right_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f44',
    title: 'Dik Üçgende Öklid Bağıntısı',
    description:
        'Dik üçgende yükseklik ile kenar projeksiyonları arasındaki ilişki.',
    formulaText: r'h^2 = p \cdot k',
    imagePath: null,
    categoryId: 'right_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f45',
    title: 'Eşkenar Üçgende İç Açı',
    description: 'Eşkenar üçgende her bir iç açı 60°’dir.',
    formulaText: r'\alpha = 60^\circ',
    imagePath: null,
    categoryId: 'equilateral_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f46',
    title: 'Eşkenar Üçgende Çevre',
    description: 'Eşkenar üçgende çevre, üç kenarın toplamıdır.',
    formulaText: r'Ç = 3a',
    imagePath: null,
    categoryId: 'equilateral_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f47',
    title: 'İkizkenar Üçgende Taban Açısı',
    description: 'İkizkenar üçgende taban açıları birbirine eşittir.',
    formulaText: r'\alpha = \beta',
    imagePath: null,
    categoryId: 'isosceles_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f48',
    title: 'İkizkenar Üçgende Çevre',
    description:
        'İkizkenar üçgende çevre, iki eşit kenar ve bir taban uzunluğunun toplamıdır.',
    formulaText: r'Ç = 2a + b',
    imagePath: null,
    categoryId: 'isosceles_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f49',
    title: 'Dik Üçgen Çevresi',
    description: 'Dik üçgende çevre, üç kenarın toplamıdır.',
    formulaText: r'Ç = a + b + c',
    imagePath: null,
    categoryId: 'right_triangle',
    isFavorited: false,
  ),
  Formula(
    id: 'f50',
    title: 'Paralelkenar Çevresi',
    description:
        'Paralelkenarın çevresi, iki kısa ve iki uzun kenarın toplamıdır.',
    formulaText: r'Ç = 2(a + b)',
    imagePath: null,
    categoryId: 'parallelogram',
    isFavorited: false,
  ),
  Formula(
    id: 'f51',
    title: 'Yamuk Çevresi',
    description: 'Yamuğun çevresi, dört kenarın toplamıdır.',
    formulaText: r'Ç = a + b + c + d',
    imagePath: null,
    categoryId: 'trapezoid',
    isFavorited: false,
  ),
  Formula(
    id: 'f52',
    title: 'Eşkenar Dörtgen Çevresi',
    description: 'Eşkenar dörtgende çevre, dört kenarın toplamıdır.',
    formulaText: r'Ç = 4a',
    imagePath: null,
    categoryId: 'rhombus',
    isFavorited: false,
  ),
  Formula(
    id: 'f53',
    title: 'Düzenli Beşgen Çevresi',
    description: 'Düzenli beşgenin çevresi, beş kenarın toplamıdır.',
    formulaText: r'Ç = 5a',
    imagePath: null,
    categoryId: 'pentagon',
    isFavorited: false,
  ),
  Formula(
    id: 'f54',
    title: 'Düzenli Altıgen Çevresi',
    description: 'Düzenli altıgenin çevresi, altı kenarın toplamıdır.',
    formulaText: r'Ç = 6a',
    imagePath: null,
    categoryId: 'hexagon',
    isFavorited: false,
  ),
  Formula(
    id: 'f55',
    title: 'Düzenli n-Kenarlı Çokgen Çevresi',
    description: 'Düzenli n-kenarlı çokgenin çevresi, n kenarın toplamıdır.',
    formulaText: r'Ç = n a',
    imagePath: null,
    categoryId: 'ngon',
    isFavorited: false,
  ),
  Formula(
    id: 'f58',
    title: 'Çemberde Merkez Açı',
    description:
        'Çemberde merkez açı, yay uzunluğunun yarıçapa oranı ile bulunur.',
    formulaText: r'\theta = \frac{L}{r}',
    imagePath: null,
    categoryId: 'circle_basic',
    isFavorited: false,
  ),
  Formula(
    id: 'f59',
    title: 'Çemberde Teğet Uzunluğu',
    description: 'Bir noktadan çembere çizilen teğetin uzunluğu.',
    formulaText: r't = \sqrt{d^2 - r^2}',
    imagePath: null,
    categoryId: 'circle_basic',
    isFavorited: false,
  ),
  Formula(
    id: 'f60',
    title: 'Çemberde Kesen Uzunluğu',
    description:
        'Çemberde bir dış noktadan geçen iki kesenin uzunlukları çarpımı sabittir.',
    formulaText: r'PA \cdot PB = PC \cdot PD',
    imagePath: null,
    categoryId: 'circle_basic',
    isFavorited: false,
  ),
  Formula(
    id: 'f61',
    title: 'Dikdörtgenler Prizması Yüzey Alanı',
    description: 'Dikdörtgenler prizmasının toplam yüzey alanı.',
    formulaText: r'A = 2(ab + ac + bc)',
    imagePath: null,
    categoryId: 'rectangular_prism',
    isFavorited: false,
  ),
  Formula(
    id: 'f62',
    title: 'Koni Yüzey Alanı',
    description: 'Koninin toplam yüzey alanı.',
    formulaText: r'A = \pi r (r + l)',
    imagePath: null,
    categoryId: 'cone',
    isFavorited: false,
  ),
  Formula(
    id: 'f63',
    title: 'İki Nokta Arası Mesafe',
    description: 'Analitik düzlemde iki nokta arasındaki mesafe.',
    formulaText: r'd = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}',
    imagePath: null,
    categoryId: 'analytic',
    isFavorited: false,
  ),
  Formula(
    id: 'f64',
    title: 'Nokta-Doğru Arası Mesafe',
    description: 'Bir noktanın bir doğruya olan dik uzaklığı.',
    formulaText: r'd = \frac{|ax_1 + by_1 + c|}{\sqrt{a^2 + b^2}}',
    imagePath: null,
    categoryId: 'analytic',
    isFavorited: false,
  ),
  Formula(
    id: 'f65',
    title: 'Eğim',
    description: 'Bir doğrunun eğimi.',
    formulaText: r'm = \frac{y_2 - y_1}{x_2 - x_1}',
    imagePath: null,
    categoryId: 'analytic',
    isFavorited: false,
  ),
  Formula(
    id: 'f66',
    title: 'Orta Nokta',
    description: 'İki nokta arasındaki orta noktanın koordinatları.',
    formulaText: r'M = \left(\frac{x_1 + x_2}{2}, \frac{y_1 + y_2}{2}\right)',
    imagePath: null,
    categoryId: 'analytic',
    isFavorited: false,
  ),
  Formula(
    id: 'f67',
    title: 'İki Doğru Arası Mesafe',
    description: 'Birbirine paralel iki doğru arasındaki mesafe.',
    formulaText: r'd = \frac{|c_2 - c_1|}{\sqrt{a^2 + b^2}}',
    imagePath: null,
    categoryId: 'analytic',
    isFavorited: false,
  ),
];
