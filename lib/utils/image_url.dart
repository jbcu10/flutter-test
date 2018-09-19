
  class ImageUrl{

static String translate(String url){
       return url.contains('http')?url:'https://enturaz.com/${url}';
  }
}