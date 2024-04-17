URL="http://www.google.com.pe/search?ie=ISO-8859-1&hl=es-419&source=hp&q=katze&btnG=Buscar+con+Google&gbv=1"
AGENT="w3m/0.5.3"
ACCEPT="Accept: text/html, text/*;q=0.5, image/*"
TARGET="/cygdrive/d/tmp/curl/google.html"
curl -A $AGENT -H $ACCEPT -L $URL > $TARGET

URL="http://www.bing.com/search?q=katze"
AGENT="w3m/0.5.3"
ACCEPT="Accept: text/html, text/*;q=0.5, image/*"
TARGET=bing.html
curl -A $AGENT -H $ACCEPT -L $URL > $TARGET
