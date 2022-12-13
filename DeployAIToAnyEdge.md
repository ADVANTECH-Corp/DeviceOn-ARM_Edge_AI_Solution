# Deploy the AI app to edge devices
Through the IoT device platform called `DeviceOn` to provide OTA deployment to help AI developers or system opterators realize batch provision inference apps to edge devices. DeviceOn is the best platform to manage not only applications but also contaienrs. In this section, it aims to focus on how to deploy your app to edge devices and furhter remotely controll your app and devices through DeviceOn.

## Prerequisites
- A workable [DeviceOn server](https://eiot.blob.core.windows.net/deviceon/DeviceOn_Server.zip) must be installed and running without problems. You could refer to the [documentation](https://docs.wise-paas.advantech.com/en/Guides_and_API_References/ApplicationServices/1564727799415968385/1589506780729736622/v1.0.0) of DeviceOn to set up your own server.
- [A 90-day trial key](https://www.youtube.com/watch?v=tjZUchu0v2I&t=64s) for DeviceOn server activation.
- AIR-020 with Linux [Ubuntu 18.04](https://campaign.advantech.online/en/embedded_software/index.html)/[JetPack 4.5.1(or later)](http://ess-wiki.advantech.com.tw/view/IoTGateway/BSP/Linux/OS_Support_List_Jetpack_4.5.1_L4T_R32.5.1) ready.

## Connect AIR-020 to DeviceOn server
In this repo, we used DeviceOn to simplify and accelerate the whole pipeline of edge AI development and deployment.

#### 1. Install WISE-Agent in your AI device
* Install [WISE-Agent](https://eiot.blob.core.windows.net/deviceon/WISE-Agent.zip) with the file of `wise-agent-Ubuntu_18.04-jetson-1.4.45.0.run` (or later) therein for Unbuntu 18.04 that we implemented in this repo.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_01.png">
</p>

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_02.png">
</p>

#### 2. Login your DeviceOn server portal to get connection info
* Open your `DeviceOn` portal with a web brwoser.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_03.png">
</p>

* Click the right-top icon `Add Device` for device connection and then you can see the info of both `Credential URL` and `IoT Key`. Both of them are necessary for finishing your WISE-Agent setup later.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_04.png">
</p>

> Please note that keep or save Credential URL and IoT Key for setting up WISE-Agnet.

#### 3. Connect your device with WISE-Agent to the DeviceOn server
* Change your directory to `/usr/local/AgentService` and run sudo `./setup.sh` to answer connection information, such as credential URL, IoTKey, Device Name and etc.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_05.png">
</p>

> Remarks
>  * Zero-touch onboard is a zero-configuration and quick connection mode for a special purpose. The default is disabled (n).
>  * Enter Credential URL and IoT Key that information could retrieve from the DeviceOn portal.
>  * Assign device to User Account: You can bind the target device into a Default group in your account on the portal automatically.
>  * Enable TLS: Turn ON/OFF the TLS/SSL mode.
>  * Input Device Name: Give your device name and show it on the portal.
>  * Input AMT ID and password: If your device support Intel AMT, please enter AMT ID and Password to enable these functions.
>  * Select KVM Mode [0:default, 1:Custom VNC, 2:disable]: User can use our default VNC to support the Remote Desktop function by entering 0 and give a listen port if you don’t want to use the default port. Second, select Custom Mode, if they already have a VNC server by entering 1 and provide the listen port and password. To disable the KVM function by entering 2.

After filling necessary information, the device is connected to DeviceOn server and accessible to all accounts.

## Package the script files and then push the package into DeviceOn

* Click `Repository` in your DeviceOn server.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_09.png">
</p>

* Then click `Add App` at top of the current page.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_10.png">
</p>

* In the `App Information` page, fill in necessary info such as `App Name`, and then press `Next`.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_11.png">
</p>

* In the `Upload Your App` page, fill in the `Operating System` blank to select `Ubuntu 18 (aarch64)` for `Arm, Jetson, Nvidia`|AIR-020.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_12.png">
</p>

* Then fill in other blanks in the same page, and further click `Select Directory`.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_13.png">
</p>

* Choose the local folder where the script files are located to upload.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_14.png">
</p>

* For `Install Script`, select `Deploy.sh` in the packaged script files, and then click `Next`.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_15.png">
</p>

* In the `Confirm` page, click the `Confirm` button at the bottom right and then all the script files in the specified directory will be uploaded and encapsulated.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_16.png">
</p>

* To this stage, you can see that the newly packaged `edge-impulse-linux` app is available in DeviceOn `Repositories`.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_17.png">
</p>

## Deploy AI application package to edges through DeviceOn
* Click `My devices` within `Application` in DeviceOn navigation menu and then here select the device `air020`.
* And further click the `Device Details` icon at right.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_18.png">
</p>

* In the `Device Details` page of `air020` here, click `Suggested for the device` for new application installation, and then find and click the `edge-impulse-linux` app at the bottom that was uploaded earlier.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_19.png">
</p>

* Make sure a USB webcam to be connected to `air020` in advance because here the AI application to be deployed will use it to capture images for inference. 
* Then click `Install` in the `App's Information` page to deploy the `edge-impulse-linux` app to `air020`.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_20.png">
</p>

* A `Information` dialog will pop up to inform successful deployment.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_21.png">
</p>

## Check if the deployed app is running as expected
* Open a terminal in `air020` and execute the following command.

```sh
top
```

* Then look into the `COMMAND` column, displayed `node` and `gst-launch-1.0` means that the `edge-impulse-linux` app is running inference in the OS background.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_22.png">
</p>

> NOTE: if no USB webcam is connected to `air020`, here the `edge-impulse-linux` app will fail to execute.

* Next click `Connection Information` in the top toolbar to get the `IP Address` of `air020`.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_23.png">
</p>

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_24.png">
</p>

* Further add a (default) port `4912` after the queried `IP Address`, and then paste it in the URL blank of a web browser, for example: `xxx.xxx.xxx.xxx:4912`.

```sh
<IP Address>:4912
```

* As a result, we can see and check real-time inference results through a webpage.

<p align="center">
  <img width="600" src="image\Deploy_AI_to_any_edge_25.png">
</p>

Finally, we have completed AI application deployment with the aids of DeviceOn and even remotely control the deployed application actions.
