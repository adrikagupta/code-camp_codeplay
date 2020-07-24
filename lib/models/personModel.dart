class PersonDetail{
 String icon;
 String id;
 String name;
 String rating;
 String vicinity;

 String formattedAddress;
 String internationalPhoneNumber;
 List<String> weekdayText;
 String url;

 PersonDetail(this.id,this.name,this.icon,this.rating,this.vicinity,[this.formattedAddress,this.internationalPhoneNumber,this.weekdayText]);

}