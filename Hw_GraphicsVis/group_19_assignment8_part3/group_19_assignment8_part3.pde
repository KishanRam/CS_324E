import java.util.regex.*;
BBCRSS f1,f2,f3,f4,f5;
String feed1,feed2;

void setup(){
  f1 = new BBCRSS("http://feeds.bbci.co.uk/news/rss.xml?edition=uk");
  f2 = new BBCRSS("http://feeds.bbci.co.uk/news/world/rss.xml?edition=uk");
  f3 = new BBCRSS("http://feeds.bbci.co.uk/news/business/rss.xml?edition=uk");
  f4 = new BBCRSS("http://feeds.bbci.co.uk/news/politics/rss.xml?edition=uk");
  f5 = new BBCRSS("http://feeds.bbci.co.uk/news/entertainment_and_arts/rss.xml?edition=uk");
 
  //println(f1.getLinks());
}

class BBCRSS{
  
  String feed;
  XML rss, root;
  XML[] items;
  String feedName, datePublished;
  ArrayList<String> titles = new ArrayList<String>();
  ArrayList<String> descriptions  = new ArrayList<String>();
  ArrayList<String> links = new ArrayList<String>();
  
  BBCRSS(String feed){
   this.feed = feed;
   rss = loadXML(feed); //Load in RSS Feed
   root = rss.getChild(1); //Get Root of Feed
   feedName = root.getChild(1).getContent(); //Feed name is 1st child of BBC Feed
   datePublished = root.getChild(11).getContent(); //Feed Publish Date is 11th child of BBC Feed
   
   //Items has all news peices 
   items = root.getChildren("item");
   int count = items.length;
   for (int i = 0; i < count; i ++){
     String temptitle = items[i].getChild("title").getContent(); //Add titles to array list
     titles.add(temptitle);
     String tempdesc = items[i].getChild("description").getContent(); //Add descriptions to array list
     descriptions.add(tempdesc);
     String templink = items[i].getChild("link").getContent(); //Add links to array list
     links.add(templink);
   }
   
   //Classify each link into categories
   //Categories are stored as numbers in array. The numbers correspond to:
   //1 - World News; 2 - UK; 3 - Entertainment; 4 - Technology; 5 - Sports; 6 - Health; 7 - Blogs
   //8 - Misc
   int[] categories = new int[links.size()];
   
   for (int j = 0; j < links.size(); j ++){
     
     //Get every link to categorize
     String ltemp = links.get(j);
     
     //Regex expressions for each category
     String world = "/news/world";
     String uk = "/news/uk";
     String ent = "/news/entertainment";
     String tech = "/news/technology";
     String sports = "/sport/";
     String health = "/news/health";
     String blogs = "/news/blogs";
     
     //Check if matches exist for each regex type per link
     String[] w = match(ltemp,world);
     String[] u = match(ltemp,uk);
     String[] e = match(ltemp,ent);
     String[] t = match(ltemp,tech);
     String[] s = match(ltemp,sports);
     String[] h = match(ltemp,health);
     String[] b = match(ltemp,blogs);
     
     //Assign numbers per link based on categories above
     if (w != null){
       categories[j] = 1; 
     } else if (u != null){
       categories[j] = 2;
     } else if (e != null){
       categories[j] = 3;
     } else if (t != null){
       categories[j] = 4;
     } else if (s != null){
       categories[j] = 5;
     } else if (h != null){
       categories[j] = 6;
     } else if (b != null){
       categories[j] = 7;
     } else {
       categories[j] = 8;
     }
   }   
  }
  
  String getFeedName(){
    return feedName; 
  }
  
  String getDate(){
    return datePublished; 
  }
  
  ArrayList<String> getTitles(){
    return titles; 
  }
  
  ArrayList<String> getDescriptions(){
    return descriptions; 
  }
  
  ArrayList<String> getLinks(){
    return links; 
  }
  
}