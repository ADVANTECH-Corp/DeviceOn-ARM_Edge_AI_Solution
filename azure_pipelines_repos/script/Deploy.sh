#!/bin/bash



systemctl stop EI_demo
edge-impulse-linux-runner --api-key ei_f8b2f65909cb450851af3015ac3eb3150d241d015889ce8c58a8e79be055d7b9 --download /home/modelfile_0456.eim 


cp -f ./EI_demo.service /etc/systemd/system/
cp -f ./EI_run.sh /opt/
chmod 644 /etc/systemd/system/EI_demo.service
chmod 777 /opt/EI_run.sh
systemctl daemon-reload
systemctl enable EI_demo
systemctl start EI_demo
