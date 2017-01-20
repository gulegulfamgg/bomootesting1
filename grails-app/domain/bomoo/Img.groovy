package bomoo


class Img {

	byte[] imageData
  	String imageType

  static constraints = {
	    imageData(nullable:true, maxSize: 2000000 )
	    imageType(nullable:true)
	
	}
}
