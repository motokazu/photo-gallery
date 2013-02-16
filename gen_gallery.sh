#!/bin/sh

LIST_FILE=./gallery_files.js
THUMBDIR=./thumbs

FIHISH_FLAG=./.gallery_ready

if [ -f "${FINISH_FLAG}" ] ; then
  echo "Gallery is already readied."
  echo "If you would like to generate gallery file list, run command \"rm ${FINISH_FLAG}\"."
  exit 0
fi

mkdir -p ${THUMBDIR}

# generate file list
date
echo "Start generating list file."
echo "var gallery_files = [" > ${LIST_FILE}

for f in `ls`
do
  # generate thumbnail
  count=0
  if [ ! -f "${THUMBDIR}/${f}" ] ; then
    echo -n "[${count}] Convert image ${f} to ${THUMBDIR}/${f}(thumbnail) ... : "
    if convert -resize 200x -unsharp 2x1.4+0.5+0 -quality 70 ${f} ${THUMBDIR}/${f} ; then
      echo " Completely Generated."
    else
      echo " Failed."
    fi
    count=`expr ${count} + 1`
  fi
  
  echo "{ image: \"${f}\", thumb: \"${THUMBDIR}/${f}\" }," >> ${LIST_FILE}
done

echo "];" >> ${LIST_FILE}

echo "Stop generating."

# build index.html
cat > index.html << 'EOF'
<!doctype html>
<html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    <script src="../galleria/galleria-1.2.9.min.js"></script>
    <style>
        #galleria{ width: 800px; height: 600px; background: #000 }
   </style>
</head>
<body>
  <div id="galleria"></div>
  <script src="gallery_files.js"></script>
  <script>
$(function(){
   Galleria.loadTheme('../galleria/themes/classic/galleria.classic.min.js');
   Galleria.run('#galleria', {
     dataSource: gallery_files
   });
});
  </script>
</body>
</html>
EOF

echo "copied index.html to here."

# Finish flag
touch ${FINISH_FLAG}

echo "End of script."
date
