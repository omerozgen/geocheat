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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formula.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(formula.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            if (isDikUcgenAlan) ...[
              Center(child: DikUcgenAlanPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isKareAlan) ...[
              Center(child: KareAlanPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDikdortgenAlan) ...[
              Center(child: DikdortgenAlanPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isParalelkenarAlan) ...[
              Center(child: ParalelkenarAlanPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isYamukAlan) ...[
              Center(child: YamukAlanPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isEskenarDortgenAlan) ...[
              Center(child: EskenarDortgenAlanPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isBesgenAlan) ...[
              Center(child: BesgenAlanPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isAltigenAlan) ...[
              Center(child: AltigenAlanPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isNgonAlan) ...[
              Center(child: NgonAlanPainter(size: 180, n: 7)),
              const SizedBox(height: 16),
            ],
            if (isDaireAlan) ...[
              Center(child: DaireAlanPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isCemberUzunlugu) ...[
              Center(child: CemberUzunluguPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isYayUzunlugu) ...[
              Center(child: YayUzunluguPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isKirisUzunlugu) ...[
              Center(child: KirisUzunluguPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isKupHacmi) ...[
              Center(child: KupHacimPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDikdortgenlerPrizmasiHacmi) ...[
              Center(child: DikdortgenlerPrizmasiHacimPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isSilindirHacmi) ...[
              Center(child: SilindirHacimPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isKoniHacmi) ...[
              Center(child: KoniHacimPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isKureHacmi) ...[
              Center(child: KureHacimPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDikPiramitHacmi) ...[
              Center(child: DikPiramitHacimPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isPrizmaHacmi) ...[
              Center(child: PrizmaHacimPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDikDaireDilimiHacmi) ...[
              Center(child: DikDaireDilimiHacimPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDikUcgenHipotenus) ...[
              Center(child: DikUcgenHipotenusPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isEskenarUcgenYukseklik) ...[
              Center(child: EskenarUcgenYukseklikPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isIkizkenarUcgenKenar) ...[
              Center(child: IkizkenarUcgenKenarPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDikUcgenOklid) ...[
              Center(child: DikUcgenOklidPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isEskenarUcgenIcAci) ...[
              Center(child: EskenarUcgenAciPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isEskenarUcgenCevre) ...[
              Center(child: EskenarUcgenCevresiPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isIkizkenarUcgenTabanAci) ...[
              Center(child: IkizkenarUcgenTabanAciPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isIkizkenarUcgenCevre) ...[
              Center(child: IkizkenarUcgenCevresiPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDikUcgenSinus) ...[
              Center(child: DikUcgenSinusPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDikUcgenKosinus) ...[
              Center(child: DikUcgenKosinusPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDikUcgenTanjant) ...[
              Center(child: DikUcgenTanjantPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isEskenarUcgenAlan) ...[
              Center(child: EskenarUcgenAlanPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isIkizkenarUcgenAlan) ...[
              Center(child: IkizkenarUcgenAlanPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isKareCevre) ...[
              Center(child: KareCevresiPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDikdortgenCevre) ...[
              Center(child: DikdortgenCevresiPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isKupYuzeyAlani) ...[
              Center(child: KupYuzeyAlaniPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isSilindirYuzeyAlani) ...[
              Center(child: SilindirYuzeyAlaniPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isKureYuzeyAlani) ...[
              Center(child: KureYuzeyAlaniPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDogruDenklemi) ...[
              Center(child: DogruDenklemiPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isDaireDenklemi) ...[
              Center(child: DaireDenklemiPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isParabolDenklemi) ...[
              Center(child: ParabolDenklemiPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isElipsDenklemi) ...[
              Center(child: ElipsDenklemiPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            if (isHiperbolDenklemi) ...[
              Center(child: HiperbolDenklemiPainter(size: 180)),
              const SizedBox(height: 16),
            ],
            Math.tex(
              formula.formulaText,
              textStyle: const TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 24),
            // TODO: Görsel ekleme burada olacak
          ],
        ),
      ),
    );
  }
}
