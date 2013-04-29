tagFaces uses [picasa3meta](http://vosbergw.github.com/picasa3meta/docs/index.html)

It has only been tested with Ubuntu 12.10.

tagFaces will generate copies of images in your Picasa library with a numbered red box drawn around
each face Picasa has detected. It will also generate an additional jpg for each detected face that
just contains that face. The face images will be numbered and also labeled with the imagedata_personalbumid
number and the name from the albumdata_name table.

As hardcoded, these images will all be placed in /tmp. The full image will be named tagFaces.jpg and the
others will be tagFacesXX.jpg. Once one image has been processed tagFaces will spawn Eye of Gnome (/usr/bin/eog)
and wait for you to exit before moving on to the next image. The /tmp/tagFaces... files are overwritten for
each image. You should be able to modify the source to spawn whichever image viewer you prefer.

For each image, tagFaces will also output the following information for each image:

```
list of faces for 17932:IMG_7720.JPG is  [18027, 18028]

	         path = /full/path/to/IMG_7720.JPG
	  facequality = 0xf729
	     facerect = 0x46be6de851417ebe
	 facerectdata = conf(0.633),pan(13.766),leye(0.291,0.461),reye(0.303,0.461),mouth(0.299,0.479)
	personalbumid = 0
	         name = Recently Updated

	         path = /Volumes/myPassport/wayne/Pictures/Heidelberg/IMG_7720.JPG
	  facequality = 0x6a
	     facerect = 0x96be6cf79e4678fe
	 facerectdata = conf(0.001),pan(-55.000),leye(0.600,0.449),reye(0.608,0.448),mouth(0.604,0.467)
	personalbumid = 0
	         name = Recently Updated


	         ************************************************************
	         removing /tmp/tagFaces*.jpg
	         size = 3264,2448
	        faces = [ 0x46be6de851417ebe : [0.2763408865491722, 0.4293278400854505, 0.31740291447318225, 0.4950942244602121] / [901, 1050, 1036, 1211] ; 0x96be6cf79e4678fe : [0.5888456549935149, 0.42565041580834667, 0.6182650492103456, 0.47263294422827495] / [1921, 1041, 2018, 1157] ; ]
	      face  1 = [901, 1050, 1036, 1211] 0:Recently Updated
	      face  2 = [1921, 1041, 2018, 1157] 0:Recently Updated

```

Note, id 0, name 'Recently Updated' is what Picasa tags faces it does not recognize.

Like [metaSave](http://vosbergw.github.com/metasave/), you can use --tweak if your images are no longer in the same
top level directory. If you have rearranged the folders so that they do not match the thumbindex.db file any longer
you are going to have troubles tho.


```
$ PYTHONPATH=~/lib/picasa3meta
$ export PYTHONPATH
$ tagFaces --help

usage: tagFaces [-h] [--path PATH] [--tweak TWEAK]

Scan all images and display the tagged faces.

optional arguments:
  -h, --help     show this help message and exit
  --path PATH    Path to the Picasa database files. If left off, search $HOME
                 for directory Picasa3 containing directories db3 and contacts
  --tweak TWEAK  Adjust the path names used when searching thumbindex.db. What
                 is stored in thumbindex.db is the full path relative to the
                 system it was created on. If you have copied the photo tree
                 and Picasa3 files to another system or have them remotely
                 mounted with a different path you can use --tweak to adjust
                 the path. example: --tweak
                 '/my/path/Pictures':'/thumbindex/path/Pictures'


```
