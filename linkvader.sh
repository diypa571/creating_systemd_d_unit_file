#Diyar Parwana
#Linux
function LinkopingVader() {
filen="weather.txt"
logInternet="/var/log/linkvader/anslutning.log"
anvandare=$USER
now="$(date +'%Y/%d/%m %H:%M')"

case "$(curl -s --max-time 2 -I http://google.com |  sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
  [23])  echo "$now" "Linkvader: Internet ansultning är ok " >> "${logInternet}"   ;;
   *) echo "$now" "Linkvader: Internet ansultning är inte ok" >> "${logInternet}" ;;
esac

cd ~/
echo "*******Test Väder Prognoser*****" > "${filen}"
echo "Datum&Tid:" "$now" >> "${filen}"
curl https://wttr.in/Linkoping?0tqp?T  >> "${filen}"
#cd ~/
#cat weather.txt
}


LinkopingVader
