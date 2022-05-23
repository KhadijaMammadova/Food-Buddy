
class OnboardingContents {
  final String title ;
  final String image ;
  final String desc ;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
      title: "Yalnız yemek yemekten sıkıldın mı ?",
      image: "assets/images/image1.png",
      desc: "FoodBuddy yemek yerken sana eşlik edecek birilerini bulacağın harika bir uygulama.",
  ),
  OnboardingContents(
      title: "Nasıl mı?",
      image: "assets/images/image2.png",
      desc: "Gideceğin yeri seç .Senin gibi oraya yalnız gidecek insanlarla tanış.",
  ),
  OnboardingContents(
      title: "Hadi sen de FoodBuddy ile foodbuddy'ni  bul.",
      image: "assets/images/image3.png",
      desc: "Başlamak için tıkla.",
  ),
];