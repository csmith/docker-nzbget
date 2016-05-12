#! /bin/sh

set -e

if [ ! -f /config/nzbget.conf ]; then
   cp /nzbget/webui/nzbget.conf.template /config/nzbget.conf
   sed 's:^MainDir=.*:MainDir=/maindir:' -i /config/nzbget.conf
   sed 's:^DestDir=.*:DestDir=/destination:' -i /config/nzbget.conf
fi

/nzbget/nzbget --configfile /config/nzbget.conf -s -o OutputMode=log

