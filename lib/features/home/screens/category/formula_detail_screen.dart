import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/formula.dart';
import '../../viewmodels/favorites_viewmodel.dart';
import '../../widgets/dik_ucgen_alan_painter.dart';
import '../../widgets/kare_alan_painter.dart';
import '../../widgets/dikdortgen_alan_painter.dart';
import '../../widgets/paralelkenar_alan_painter.dart';
import '../../widgets/yamuk_alan_painter.dart';
import '../../widgets/eskenar_dortgen_alan_painter.dart';
import '../../widgets/besgen_alan_painter.dart';
import '../../widgets/altigen_alan_painter.dart';
import '../../widgets/ngon_alan_painter.dart';
import '../../widgets/daire_alan_painter.dart';
import '../../widgets/cember_uzunlugu_painter.dart';
import '../../widgets/yay_uzunlugu_painter.dart';
import '../../widgets/kiris_uzunlugu_painter.dart';
import '../../widgets/kup_hacim_painter.dart';
import '../../widgets/dikdortgenler_prizmasi_hacim_painter.dart';
import '../../widgets/silindir_hacim_painter.dart';
import '../../widgets/koni_hacim_painter.dart';
import '../../widgets/kure_hacim_painter.dart';
import '../../widgets/dik_piramit_hacim_painter.dart';
import '../../widgets/prizma_hacim_painter.dart';
import '../../widgets/dik_daire_dilimi_hacim_painter.dart';
import '../../widgets/dik_ucgen_hipotenus_painter.dart';
import '../../widgets/eskenar_ucgen_yukseklik_painter.dart';
import '../../widgets/ikizkenar_ucgen_kenar_painter.dart';
import '../../widgets/dik_ucgen_oklid_painter.dart';
import '../../widgets/eskenar_ucgen_aci_painter.dart';
import '../../widgets/eskenar_ucgen_cevresi_painter.dart';
import '../../widgets/ikizkenar_ucgen_taban_aci_painter.dart';
import '../../widgets/ikizkenar_ucgen_cevresi_painter.dart';
import '../../widgets/dik_ucgen_sinus_painter.dart';
import '../../widgets/dik_ucgen_kosinus_painter.dart';
import '../../widgets/dik_ucgen_tanjant_painter.dart';
import '../../widgets/eskenar_ucgen_alan_painter.dart';
import '../../widgets/ikizkenar_ucgen_alan_painter.dart';
import '../../widgets/kare_cevresi_painter.dart';
import '../../widgets/dikdortgen_cevresi_painter.dart';
import '../../widgets/kup_yuzey_alani_painter.dart';
import '../../widgets/silindir_yuzey_alani_painter.dart';
import '../../widgets/kure_yuzey_alani_painter.dart';
import '../../widgets/dogru_denklemi_painter.dart';
import '../../widgets/daire_denklemi_painter.dart';
import '../../widgets/parabol_denklemi_painter.dart';
import '../../widgets/elips_denklemi_painter.dart';
import '../../widgets/hiperbol_denklemi_painter.dart';

class FormulaDetailScreen extends ConsumerWidget {
  final Formula formula;
  const FormulaDetailScreen({super.key, required this.formula});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final isFavorited = favorites.contains(formula.id);
    final isDikUcgenAlan =
        formula.title.toLowerCase().contains('dik üçgen alanı') ||
        formula.description.toLowerCase().contains('dik üçgen alanı');
    final isKareAlan =
        formula.title.toLowerCase().contains('kare alanı') ||
        formula.description.toLowerCase().contains('kare alanı');
    final isDikdortgenAlan =
        formula.title.toLowerCase().contains('dikdörtgen alanı') ||
        formula.description.toLowerCase().contains('dikdörtgen alanı');
    final isParalelkenarAlan =
        formula.title.toLowerCase().contains('paralelkenar alanı') ||
        formula.description.toLowerCase().contains('paralelkenar alanı');
    final isYamukAlan =
        formula.title.toLowerCase().contains('yamuk alanı') ||
        formula.description.toLowerCase().contains('yamuk alanı');
    final isEskenarDortgenAlan =
        formula.title.toLowerCase().contains('eşkenar dörtgen alanı') ||
        formula.description.toLowerCase().contains('eşkenar dörtgen alanı');
    final isBesgenAlan =
        formula.title.toLowerCase().contains('beşgen alanı') ||
        formula.description.toLowerCase().contains('beşgen alanı');
    final isAltigenAlan =
        formula.title.toLowerCase().contains('altıgen alanı') ||
        formula.description.toLowerCase().contains('altıgen alanı');
    final isNgonAlan =
        formula.title.toLowerCase().contains('n-kenarlı çokgen alanı') ||
        formula.description.toLowerCase().contains('n-kenarlı çokgen alanı');
    final isDaireAlan =
        formula.title.toLowerCase().contains('daire alanı') ||
        formula.description.toLowerCase().contains('daire alanı');
    final isCemberUzunlugu =
        formula.title.toLowerCase().contains('çember uzunluğu') ||
        formula.description.toLowerCase().contains('çember uzunluğu');
    final isYayUzunlugu =
        formula.title.toLowerCase().contains('yay uzunluğu') ||
        formula.description.toLowerCase().contains('yay uzunluğu');
    final isKirisUzunlugu =
        formula.title.toLowerCase().contains('kiriş uzunluğu') ||
        formula.description.toLowerCase().contains('kiriş uzunluğu');
    final isKupHacmi =
        formula.title.toLowerCase().contains('küp hacmi') ||
        formula.description.toLowerCase().contains('küp hacmi');
    final isDikdortgenlerPrizmasiHacmi =
        formula.title.toLowerCase().contains('dikdörtgenler prizması hacmi') ||
        formula.description.toLowerCase().contains(
          'dikdörtgenler prizması hacmi',
        );
    final isSilindirHacmi =
        formula.title.toLowerCase().contains('silindir hacmi') ||
        formula.description.toLowerCase().contains('silindir hacmi');
    final isKoniHacmi =
        formula.title.toLowerCase().contains('koni hacmi') ||
        formula.description.toLowerCase().contains('koni hacmi');
    final isKureHacmi =
        formula.title.toLowerCase().contains('küre hacmi') ||
        formula.description.toLowerCase().contains('küre hacmi');
    final isDikPiramitHacmi =
        formula.title.toLowerCase().contains('dik piramit hacmi') ||
        formula.description.toLowerCase().contains('dik piramit hacmi');
    final isPrizmaHacmi =
        formula.title.toLowerCase().contains('prizma hacmi') ||
        formula.description.toLowerCase().contains('prizma hacmi');
    final isDikDaireDilimiHacmi =
        formula.title.toLowerCase().contains('dik daire dilimi hacmi') ||
        formula.description.toLowerCase().contains('dik daire dilimi hacmi');
    final isDikUcgenHipotenus =
        formula.title.toLowerCase().contains('dik üçgen hipotenüs') ||
        formula.description.toLowerCase().contains('dik üçgen hipotenüs');
    final isEskenarUcgenYukseklik =
        formula.title.toLowerCase().contains('eşkenar üçgen yüksekliği') ||
        formula.description.toLowerCase().contains('eşkenar üçgen yüksekliği');
    final isIkizkenarUcgenKenar =
        formula.title.toLowerCase().contains('ikizkenar üçgende kenar') ||
        formula.description.toLowerCase().contains('ikizkenar üçgende kenar');
    final isDikUcgenOklid =
        formula.title.toLowerCase().contains('dik üçgende öklid bağıntısı') ||
        formula.description.toLowerCase().contains(
          'dik üçgende öklid bağıntısı',
        );
    final isEskenarUcgenIcAci =
        formula.title.toLowerCase().contains('eşkenar üçgende iç açı') ||
        formula.description.toLowerCase().contains('eşkenar üçgende iç açı');
    final isEskenarUcgenCevre =
        formula.title.toLowerCase().contains('eşkenar üçgende çevre') ||
        formula.description.toLowerCase().contains('eşkenar üçgende çevre');
    final isIkizkenarUcgenTabanAci =
        formula.title.toLowerCase().contains('ikizkenar üçgende taban açısı') ||
        formula.description.toLowerCase().contains(
          'ikizkenar üçgende taban açısı',
        );
    final isIkizkenarUcgenCevre =
        formula.title.toLowerCase().contains('ikizkenar üçgende çevre') ||
        formula.description.toLowerCase().contains('ikizkenar üçgende çevre');
    final isDikUcgenSinus =
        formula.title.toLowerCase().contains('dik üçgende sinüs') ||
        formula.description.toLowerCase().contains('dik üçgende sinüs');
    final isDikUcgenKosinus =
        formula.title.toLowerCase().contains('dik üçgende kosinüs') ||
        formula.description.toLowerCase().contains('dik üçgende kosinüs');
    final isDikUcgenTanjant =
        formula.title.toLowerCase().contains('dik üçgende tanjant') ||
        formula.description.toLowerCase().contains('dik üçgende tanjant');
    final isEskenarUcgenAlan =
        formula.title.toLowerCase().contains('eşkenar üçgen alanı') ||
        formula.description.toLowerCase().contains('eşkenar üçgen alanı');
    final isIkizkenarUcgenAlan =
        formula.title.toLowerCase().contains('ikizkenar üçgen alanı') ||
        formula.description.toLowerCase().contains('ikizkenar üçgen alanı');
    final isKareCevre =
        formula.title.toLowerCase().contains('kare çevresi') ||
        formula.description.toLowerCase().contains('kare çevresi');
    final isDikdortgenCevre =
        formula.title.toLowerCase().contains('dikdörtgen çevresi') ||
        formula.description.toLowerCase().contains('dikdörtgen çevresi');
    final isKupYuzeyAlani =
        formula.title.toLowerCase().contains('küp yüzey alanı') ||
        formula.description.toLowerCase().contains('küp yüzey alanı');
    final isSilindirYuzeyAlani =
        formula.title.toLowerCase().contains('silindir yüzey alanı') ||
        formula.description.toLowerCase().contains('silindir yüzey alanı');
    final isKureYuzeyAlani =
        formula.title.toLowerCase().contains('küre yüzey alanı') ||
        formula.description.toLowerCase().contains('küre yüzey alanı');
    final isDogruDenklemi =
        formula.title.toLowerCase().contains('doğru denklemi') ||
        formula.description.toLowerCase().contains('doğru denklemi');
    final isDaireDenklemi =
        formula.title.toLowerCase().contains('daire denklemi') ||
        formula.description.toLowerCase().contains('daire denklemi');
    final isParabolDenklemi =
        formula.title.toLowerCase().contains('parabol denklemi') ||
        formula.description.toLowerCase().contains('parabol denklemi');
    final isElipsDenklemi =
        formula.title.toLowerCase().contains('elips denklemi') ||
        formula.description.toLowerCase().contains('elips denklemi');
    final isHiperbolDenklemi =
        formula.title.toLowerCase().contains('hiperbol denklemi') ||
        formula.description.toLowerCase().contains('hiperbol denklemi');
    return Scaffold(
      appBar: AppBar(
        title: Text(formula.title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.red : null,
            ),
            onPressed: () async {
              ref.read(favoritesProvider.notifier).toggleFavorite(formula.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF6F8FB), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formula.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        formula.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                if (isDikUcgenAlan) ...[
                  _FormulaVisualCard(child: DikUcgenAlanPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isKareAlan) ...[
                  _FormulaVisualCard(child: KareAlanPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isDikdortgenAlan) ...[
                  _FormulaVisualCard(child: DikdortgenAlanPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isParalelkenarAlan) ...[
                  _FormulaVisualCard(child: ParalelkenarAlanPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isYamukAlan) ...[
                  _FormulaVisualCard(child: YamukAlanPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isEskenarDortgenAlan) ...[
                  _FormulaVisualCard(
                    child: EskenarDortgenAlanPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isBesgenAlan) ...[
                  _FormulaVisualCard(child: BesgenAlanPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isAltigenAlan) ...[
                  _FormulaVisualCard(child: AltigenAlanPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isNgonAlan) ...[
                  _FormulaVisualCard(child: NgonAlanPainter(size: 180, n: 7)),
                  const SizedBox(height: 16),
                ],
                if (isDaireAlan) ...[
                  _FormulaVisualCard(child: DaireAlanPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isCemberUzunlugu) ...[
                  _FormulaVisualCard(child: CemberUzunluguPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isYayUzunlugu) ...[
                  _FormulaVisualCard(child: YayUzunluguPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isKirisUzunlugu) ...[
                  _FormulaVisualCard(child: KirisUzunluguPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isKupHacmi) ...[
                  _FormulaVisualCard(child: KupHacimPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isDikdortgenlerPrizmasiHacmi) ...[
                  _FormulaVisualCard(
                    child: DikdortgenlerPrizmasiHacimPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isSilindirHacmi) ...[
                  _FormulaVisualCard(child: SilindirHacimPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isKoniHacmi) ...[
                  _FormulaVisualCard(child: KoniHacimPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isKureHacmi) ...[
                  _FormulaVisualCard(child: KureHacimPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isDikPiramitHacmi) ...[
                  _FormulaVisualCard(child: DikPiramitHacimPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isPrizmaHacmi) ...[
                  _FormulaVisualCard(child: PrizmaHacimPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isDikDaireDilimiHacmi) ...[
                  _FormulaVisualCard(
                    child: DikDaireDilimiHacimPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isDikUcgenHipotenus) ...[
                  _FormulaVisualCard(
                    child: DikUcgenHipotenusPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isEskenarUcgenYukseklik) ...[
                  _FormulaVisualCard(
                    child: EskenarUcgenYukseklikPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isIkizkenarUcgenKenar) ...[
                  _FormulaVisualCard(
                    child: IkizkenarUcgenKenarPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isDikUcgenOklid) ...[
                  _FormulaVisualCard(child: DikUcgenOklidPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isEskenarUcgenIcAci) ...[
                  _FormulaVisualCard(child: EskenarUcgenAciPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isEskenarUcgenCevre) ...[
                  _FormulaVisualCard(
                    child: EskenarUcgenCevresiPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isIkizkenarUcgenTabanAci) ...[
                  _FormulaVisualCard(
                    child: IkizkenarUcgenTabanAciPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isIkizkenarUcgenCevre) ...[
                  _FormulaVisualCard(
                    child: IkizkenarUcgenCevresiPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isDikUcgenSinus) ...[
                  _FormulaVisualCard(child: DikUcgenSinusPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isDikUcgenKosinus) ...[
                  _FormulaVisualCard(child: DikUcgenKosinusPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isDikUcgenTanjant) ...[
                  _FormulaVisualCard(child: DikUcgenTanjantPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isEskenarUcgenAlan) ...[
                  _FormulaVisualCard(child: EskenarUcgenAlanPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isIkizkenarUcgenAlan) ...[
                  _FormulaVisualCard(
                    child: IkizkenarUcgenAlanPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isKareCevre) ...[
                  _FormulaVisualCard(child: KareCevresiPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isDikdortgenCevre) ...[
                  _FormulaVisualCard(
                    child: DikdortgenCevresiPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isKupYuzeyAlani) ...[
                  _FormulaVisualCard(child: KupYuzeyAlaniPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isSilindirYuzeyAlani) ...[
                  _FormulaVisualCard(
                    child: SilindirYuzeyAlaniPainter(size: 180),
                  ),
                  const SizedBox(height: 16),
                ],
                if (isKureYuzeyAlani) ...[
                  _FormulaVisualCard(child: KureYuzeyAlaniPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isDogruDenklemi) ...[
                  _FormulaVisualCard(child: DogruDenklemiPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isDaireDenklemi) ...[
                  _FormulaVisualCard(child: DaireDenklemiPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isParabolDenklemi) ...[
                  _FormulaVisualCard(child: ParabolDenklemiPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isElipsDenklemi) ...[
                  _FormulaVisualCard(child: ElipsDenklemiPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                if (isHiperbolDenklemi) ...[
                  _FormulaVisualCard(child: HiperbolDenklemiPainter(size: 180)),
                  const SizedBox(height: 16),
                ],
                // LaTeX formül kutusu
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Math.tex(
                    formula.formulaText,
                    textStyle: const TextStyle(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormulaVisualCard extends StatelessWidget {
  final Widget child;
  const _FormulaVisualCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: child,
      ),
    );
  }
}
