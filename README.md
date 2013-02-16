photo-gallery
=============

web photo gallery.

It uses "Galleria" library with jquery mobile.  

Requirement
-----------
- Galleria
- Imagemagick (for convert command)


Getting Start with
------------------
### photo gallery ###

	$ cd <web root directory>
	$ git clone https://github.com/motokazu/photo-gallery.git

### create gallery ###
First, setup galleria library. See Galleria site (http://galleria.io/).  

	## directory ##
	/ <web root directory>
	 + photo/*.JPG  (photo gallery directory)
	 + galleria/galleria-1.2.9.min.js 
	 + photo-gallery/gen_gallery.sh 

	$ cd <web root directory>/photo
	$ ../photo-gallery/gen_gallery.sh

### access from web ###

	Open photo directory from browser.
	

Link
---------
- Galleria : http://galleria.io/  
- jquery mobile : http://jquerymobile.com/
