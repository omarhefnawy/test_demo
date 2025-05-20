class DiscountedPrice{
  static double calcDiscountedPrice(double originalPrice,double discountPercentages)
  {
    if(discountPercentages<0){
      throw Exception("percentages od discount can not be less than zero");
    }
    return originalPrice-(originalPrice*discountPercentages/100);
  }
}