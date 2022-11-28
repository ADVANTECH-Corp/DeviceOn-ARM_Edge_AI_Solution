# Encapsulate a portable AI application

在我們完成了Edge Impulse平台上的模型訓練後，我們接下來可以將專案連結到DeviceOn，並透過DeviceOn遠端通知AIR-020(AI Edge)，來進行推理或者更新模型。

After we have completed the model training on the Edge Impulse platform, we can then connect the project to DeviceOn and notify AIR-020 (AI Edge) remotely through DeviceOn to perform inference or update the model.

## AIR-020安裝Edge Impulse Linux SDK

* 在AIR-020上使用以下命令安裝好`Edge Impulse Linux SDK`，可參考[官方安裝文件](https://docs.edgeimpulse.com/docs/development-platforms/officially-supported-cpu-gpu-targets/nvidia-jetson-nano)。 
Use the following command to install `Edge Impulse Linux SDK` on AIR-020, please refer to [official installation file](https://docs.edgeimpulse.com/docs/development-platforms/officially-supported-cpu-gpu-targets /nvidia-jetson-nano).

```sh
wget -q -O - https://cdn.edgeimpulse.com/firmware/linux/jetson.sh | bash
```


## 取得水果專案的API Keys
## Get the API Keys of the fruit project

* 首先在我們的水果專案首頁，點擊上方`Keys`的選項。
* First of all, on the homepage of our fruit project, click the option of `Keys` above.

<p align="center">
  <img width="600" src="image\Encapsulate_a_portable_AI_application_01.png">
</p>

* 首先取得Edge Impulse平台上，我們先前創立水果專案關聯的`API Keys`。
* First obtain the `API Keys` associated with the fruit project we previously created on the Edge Impulse platform.
* 將反白選擇的Key複製到記事本備用。
* Copy the highlighted key to Notepad for backup.
* Keys可以讓我們的線下硬體直接連接專案，可以略過輸入帳號密碼的程序，請好好保管。
* Keys can let our offline hardware directly connect to the project, you can skip the process of entering the account password, please keep it well.

<p align="center">
  <img width="600" src="image\Encapsulate_a_portable_AI_application_02.png">
</p>

## 編寫`AIR-020`下載`Edge Impulse`模型或重開機自動推理的示範腳本
## Write a demonstration script for `AIR-020` to download the `Edge Impulse` model or restart automatic inference

* 我們一共需要編寫三隻腳本。
* We need to write three scripts in total.
* 第一隻腳本取名`EI_stop_DL_run.sh`，請將下面內容貼入並存檔。
* The name of the first script is `EI_stop_DL_run.sh`, please paste the following content and save it.

```sh
#!/bin/bash
rm -f ~/EI_ABC.fifo
mkfifo ~/EI_ABC.fifo
chmod 666 ~/EI_ABC.fifo
exec 4<> ~/EI_ABC.fifo
wait
cp /home/modelfile_0456.eim ~/my_model.eim
edge-impulse-linux-runner --api-key <API Keys> --verbose --model-file ~/my_model.eim 2>&1 | tee >&4
```

* 第二隻腳本取名`EI_demo.service`，請將下面內容貼入並存檔。
* The second script is named `EI_demo.service`, please paste the following content and save it.

```sh
[Unit]
Description=EI_demo

[Service]
Environment=DISPLAY=:0
Environment="XAUTHORITY=/path/to/xauthority"
Type=idle
ExecStart=/opt/EI_stop_DL_run.sh
Restart=always

[Install]
WantedBy=multi-user.target
```

* 第三隻腳本取名`Deploy.sh`，請將下面內容貼入並存檔。
* The third script is named `Deploy.sh`, please paste the following content and save it.

```sh
#!/bin/bash
systemctl stop EI_demo
edge-impulse-linux-runner --api-key <API Keys> --download /home/modelfile_0456.eim 
cp -f ./EI_demo.service /etc/systemd/system/
cp -f ./EI_stop_DL_run.sh /opt/
chmod 644 /etc/systemd/system/EI_demo.service
chmod 777 /opt/EI_stop_DL_run.sh
systemctl daemon-reload
systemctl enable EI_demo
systemctl start EI_demo
```
* 第一隻腳本:`EI_stop_DL_run.sh`，主要將Edge Impulse推理的指令寫入，讓`AIR-020`可以自動執行推理。
* The first script: `EI_stop_DL_run.sh`, mainly writes the instructions of Edge Impulse inference, so that `AIR-020` can automatically perform inference.

* 第二隻腳本:`EI_demo.service`，主要設定系統重開機後，可以自動繼續推理。
* The second script: `EI_demo.service`, which mainly sets the inference to continue automatically after the system is restarted.

* 第三隻腳本:`Deploy.sh`，主要設定若使用`DeviceOn`佈署到`AIR-020`，可以自動下載更新模型之外；並且可以呼叫`EI_stop_DL_run.sh`與`EI_demo.service`兩隻腳本。
* The third script: `Deploy.sh`, the main setting is to use `DeviceOn` to deploy to `AIR-020`, it can automatically download and update the model; and can call `EI_stop_DL_run.sh` and `EI_demo.service` two scripts.

以上就完成自動化腳本的撰寫，可以自行嘗試在`AIR-020`的同一個目錄下，本機執行腳本進行測試；另外在後面的章節，也會提到腳本如何透過`DeviceOn`遠端佈署到`AIR-020`。

The above completes the writing of the automated script. You can try to execute the script locally in the same directory of `AIR-020` for testing; in addition, in the following chapters, it will also be mentioned how to deploy the script remotely through `DeviceOn` to `AIR-020`.
