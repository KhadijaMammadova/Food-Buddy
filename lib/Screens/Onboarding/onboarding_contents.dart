
class OnboardingContents {
  final String title ;
  final String image ;
  final String desc ;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
      title: "Yalnız yemek yemekten sıkıldın mı?",
      image: "assets/images/image1.png",
      desc: "Food Buddy yemek yerken sana eşlik edecek birilerini bulacağın harika bir uygulama.",
  ),
  OnboardingContents(
      title: "Hadi sen de Food Buddy ile foodbuddy'ni  bul.",
      image: "assets/images/image3.png",
      desc: "Gideceğin yeri seç, senin gibi oraya yalnız gidecek insanlarla tanış.",
  ),
  OnboardingContents(
      title: "Onlarca restoran ve yeni arkadaşların burada.",
      image: "assets/images/excited.png",
      desc: "Bu deneyimin bir parçası olmak için hemen başla.",
  ),
];