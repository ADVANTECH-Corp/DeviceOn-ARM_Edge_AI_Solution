# Wrap an app around the model
After we completed model training in `Edge Impulse`, here we further explained how to run its AI inference on [AIR-020](https://www.advantech.com/en/products/65f20c25-f6ef-4ab5-be3c-b7dfa7a833b3/air-020/mod_fcf216c8-3495-4809-b815-61dc008d53a4) with an example.

## Install Edge Impulse Linux SDK on AIR-020
* Use the following command to install `Edge Impulse Linux SDK` on AIR-020 which referring to [Edge Impulse technical doc](https://docs.edgeimpulse.com/docs/development-platforms/officially-supported-cpu-gpu-targets/nvidia-jetson-nano).

```sh
wget -q -O - https://cdn.edgeimpulse.com/firmware/linux/jetson.sh | bash
```

## Get the API Key of an Edge Impulse project
* Click `Keys` at top of the project `Dashboard` page.

<p align="center">
  <img width="600" src="image\Encapsulate_a_portable_AI_application_01.png">
</p>

* Keep the `API KEY` related to a created Edge Impulse project.
> Such information will be used in one or more applications to directly access the project without entering a password. Please manage it well.

<p align="center">
  <img width="600" src="image\Encapsulate_a_portable_AI_application_02.png">
</p>

## Prepare scripts for model downloading and inference launching
> Here are necessary to write three scripts in total.
  
* The first script to be introduced is `EI_run.sh` which mainly describes instructions for running inference with an Edge Impulse model file.

```sh
#!/bin/bash
rm -f ~/EI_ABC.fifo
mkfifo ~/EI_ABC.fifo
chmod 666 ~/EI_ABC.fifo
exec 4<> ~/EI_ABC.fifo
wait
cp /home/modelfile_0456.eim ~/my_model.eim
source /opt/EI_DEMO/bin/activate
python3 /opt/linux-sdk-python/examples/image/classify.py ~/my_model.eim 
```  
> Replace `<API Key>` with the `API Key` of the Edge Impulse project mentioned above.

* The second script is `EI_demo.service` which mainly makes the inference app able to be automatically launched after system reboots for every time.

```sh
[Unit]
Description=EI_demo
After=graphical-session.target multi-user.target website.service

[Service]
Environment=DISPLAY=:0
Environment=XAUTHORITY=/run/user/1000/gdm/Xauthority
#Environment=XAUTHORITY=/root/.Xauthority
Type=simple
ExecStartPre=-/bin/sleep 20
ExecStart=/opt/EI_run.sh
Restart=always
#RestartSec=20s
Timeout=infinity
#WorkingDirectory=/home/a

[Install]
WantedBy=multi-user.target
```
 
* The third(/last) script is `Deploy.sh` which mainly describes the overall pipeline for edge app deployment. Here it starts with downloading and updating the AI model, and then executes two scripts of `EI_run.sh` and `EI_demo.service` to complete the pipeline.
  
```sh
systemctl stop EI_demo
edge-impulse-linux-runner --api-key <API Key> --download /home/modelfile_0456.eim 
cp -f ./EI_demo.service /etc/systemd/system/
cp -f ./EI_run.sh /opt/
chmod 644 /etc/systemd/system/EI_demo.service
chmod 777 /opt/EI_run.sh
systemctl daemon-reload
systemctl enable EI_demo
systemctl start EI_demo
```

> Replace `<API Key>` with the `API Key` of the Edge Impulse project mentioned above.

> If the Script file is created in Windows, it needs to be changed to Unix format.
<p align="center">
  <img width="600" src="image\Encapsulate_a_portable_AI_application_04.png">
</p>

It's workable for you to execute the scripts locally in the same directory on `AIR-020`. In addition, in the following sections, it will introduce how to remotely deploy the scripts to `AIR-020` through `DeviceOn`.
