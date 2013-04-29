
# use 'sudo make install' to install tagFaces in /usr/local/bin

DEST=/usr/local/bin

install: ${DEST}/tagFaces

/usr/local/bin/tagFaces: tagFaces
	install tagFaces ${DEST}
