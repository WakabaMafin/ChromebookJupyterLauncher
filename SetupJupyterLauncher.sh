#! /bin/bash

echo making Jupyter launcher on your chromebook launcher...

# constants
YOUR_JUPYTER_LAUNCHER=/usr/share/applications/jupyter_launcher.desktop
TMP=./JUPYTER_LAUNCHER_TMPFILE.tmp
YOUR_JUPYTER=`which jupyter`
YOUR_HOST_IP=`hostname -I`

# .desktop file
touch ${TMP}
echo [Desktop Entry] > ${TMP}
echo Name=MyJupyterLab >> ${TMP}
echo -e "Exec=sh -c \"${YOUR_JUPYTER} lab --ip ${YOUR_HOST_IP}\"" >> ${TMP}
echo Type=Application >> ${TMP}
echo Categories=Application >> ${TMP}
## case user set the full path of picture
if [ $# -eq 1 ]; then
YOUR_JUPYTER_ICON=${1}
echo Icon=${YOUR_JUPYTER_ICON} >> ${TMP}
fi
echo "Terminal=true;" >> ${TMP}

# change the permissions and the owner
sudo chmod 644 ${TMP}
sudo chown root:root ${TMP}

sudo mv ${TMP} ${YOUR_JUPYTER_LAUNCHER}

echo All Done! See your launcher!
