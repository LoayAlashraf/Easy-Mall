class Product {
  final int id, price;
  final String title, subTitle, description, image;

  Product(
      {required this.id,
        required this.price,
        required this.title,
        required this.subTitle,
        required this.description,
        required this.image});
}

// list of products
List<Product> products = [
  Product(
    id: 1,
    price: 59,
    title: "سماعات",
    subTitle: "جودة صوت عالية",
    image: "assets/images/appstore00.png",
    description:
    "وفر سماعة رأس داخل الأذن مع  صوتًا طبيعيًا واضحًا وباصًا محسنًا للغاية.يعمل عزل الضوضاء داخل التصميم على منع الضوضاء المحيطة لمساعدتك على التركيز على متعة الاستماع ",
  ),
  Product(
    id: 2,
    price: 1099,
    title: "جهاز موبايل",
    subTitle: "وأصبح للموبايل قوة",
    image: "assets/images/appstoremobile.png",
    description:
    "شاشة رائعة، سهولة فائقة في التمرير استمتع بطريقة العرض على الشاشة Infinity-O كبيرة الحجم البالغة 6.7 بوصة. واستمتع بالتفاصيل النابضة بالحياة التي تتميز بها الشاشة FHD+ Super AMOLED، حيث تصل دقتها إلى 800 شمعة لكل متر مربع1 من أجل توفير الوضوح العالي حتى في ضوء النهار الساطع.",
  ),
  Product(
      id: 3,
      price: 39,
      title: "نظارات ثلاثية الأبعاد",
      subTitle: "لنقلك للعالم الافتراضي",
      image: "assets/images/3d.png",
      description:
      "تمتع بمشاهدة أفلام وتشغيل الألعاب 3D حيث يدعم iOS والآندرويد"
  ),
  Product(
    id: 4,
    price: 56,
    title: "  سماعات لاسلكية",
    subTitle: "لساعات استماع طويلة",
    image: "assets/images/headset.png",
    description:
    "SODO SD - 1004بلوتوث AUXوصلة Tf كارتالبطاريه 400 AH٦ ساعات عمل ميكروفون داخلياللون اسود.",
  ),
  Product(
    id: 5,
    price: 68,
    title: "مسجل صوت",
    subTitle: "سجل اللحظات المهمة حولك",
    image: "assets/images/speaker.png",
    description:
    "Remax RP1 OLED Digital Voice Recorder – 8GBDual microphone and noise reduction chip on this digital voice recorder from Remax RP1 series allow you to record clear sound during important meetings. The integrated OLED display has high contrast, wide viewing angle, and quick response. You can use the Remax RP1 also as a music player and enjoy your favorite tunes.",
  ),
  Product(
      id: 6,
      price: 39,
      title: "كاميرا مراقبة",
      subTitle: "بجودة ودقة صورة عالية",
      image: "assets/images/camera.png",
      description:"تُعرف الكاميرات الموضوعة لنقل الصور والفيديوهات ورصدها من مسافات بعيدة أو قصيرة بكاميرا المراقبة، وهي تستخدم للحفاظ على سلامة المباني والمنشآت من الداخل والخارج وحمايتها من السرقة، أو لمراقبة المنزل من الداخل خاصةً عند وجود أطفال، وفي حالة الوالدين العاملين."



  ),
];