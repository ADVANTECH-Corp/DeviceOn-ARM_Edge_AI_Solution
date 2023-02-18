# OPS | Collect data for analytics

Here will introduce a process to obtain an original image before inferencing and then send it to Edge Impulse studio to increase data for next retraining. Moreover it also collect inference results and reserve them in DeviceOn for further analysis later.

## Turn on upload synchronization settings in DeviceOn server web UI

* Click `System` in the `Settings` menu on the left.
* In the upper right options, click `System Settings` and then select `Devic File Synchonization` from the drop-down menu of `Item`.
* The default value of `Sync Interval(minute)` is `10` minutes as a period for synchronous uploading.

>NOTE: If you do not see the above menu, please contact your `Device` administrators to modify your account access permission.

<p align="center">
  <img width="600" src="image\Collect_data_for_analytics_01.png">
</p>

* Next click `List` in the `Device` menu on the left.
* Click the `MORE` icon on the right side of the device `air020`.

<p align="center">
  <img width="600" src="image\Collect_data_for_analytics_02.png">
</p>

* Check if 'Devic File Synchonization' is enabled and then click `Confirm` to complete the setup.

<p align="center">
  <img width="600" src="image\Collect_data_for_analytics_03.png">
</p>

* Back to the edge device (AIR-020), let's create directories for saving captured images and inference results.

```sh
cd /opt/linux-sdk-python/examples/image
sudo mkdir Original_Image
sudo mkdir Inference_results
```

* Then specify the upload synchronization directory on the edge device (AIR-020) by editing the `FileSync.ini` file.

```sh
sudo gedit /usr/local/AgentService/FileSync.ini
```

* In the `FileSync.ini` file, change `Dir=XXX...` to the specified `Dir=/opt/linux-sdk-python/examples/image/Inference_results`.
* Then click `Save` to save and close the `FileSync.ini` file.

<p align="center">
  <img width="600" src="image\Collect_data_for_analytics_04.png">
</p>

* After restarting the AIR-020 and the inference app will be launched automatically as well.
* Go to the `DeviceOn` server web UI, click `List` in `Device` on the left menu.
* Click the `MORE` icon on the right side of `air020`.
* Check whether its `Local Path:` of `Device File Synchronization` is `/opt/linux-sdk-python/examples/image/Inference_results`.

<p align="center">
  <img width="600" src="image\Collect_data_for_analytics_05.png">
</p>

* In this repo, the DEMO app will save a captured image and its inference result into respective directories in AIR-020 per five seconds.

<p align="center">
  <img width="600" src="image\Collect_data_for_analytics_06.png">
</p>

* After starting the inference app for ten minutes, go to the DeviceOn server web UI and then click its left menu `Event Log` to be able to find the data transferring information.

<p align="center">
  <img width="600" src="image\Collect_data_for_analytics_07.png">
</p>

* In addition, captured images in the `Original_Image` directory can be uploaded to the `Edge Impulse` platform according to the section of [OPS | Collect data for model retraining](CollectDataForRe-training.md).

## How to modify the period for saving inference result at AIR-020 
* For example, modify the default vaule of `5` in `/opt/linux-sdk-python/examples/image/classify.py`, as shown in the column 203 therein.
* `5` means to save data per five seconds. If it's changed to `6`, it will save data per six seconds correspondingly.

```sh
if (seconds % 5) == 0 and (seconds > sec_list1) :
```

* To stop saving data at AIR-020, use the symbol `"""` to igore the following codes from the column `203` to `230`.

```sh
"""
if (seconds % 5) == 0 and (seconds > sec_list1) : 
			#seconds.tm_sec = seconds.tm_sec + 1
			#if n == 1:
	###
	local_time = time.localtime()
	timeString = time.strftime("%Y_%m_%d_%H_%M_", local_time)
	###
	i = i + 1

	print ('img.shape2', original_image.shape)
	#original_img_pad = "./Original_image/" + str(timeString) + str(i)+".jpg"
	#cv2.imwrite(original_img_pad, original_image)
			
	img_pad = "/opt/linux-sdk-python/examples/image/Inference_results/" + str(timeString) + str(i)+".jpg"
	cv2.imwrite(img_pad, cv2.cvtColor(img, cv2.COLOR_RGB2BGR))
	timestamp = str(timeString) + str(i)
	data_list_1.insert(0, timestamp)

	with open('/opt/linux-sdk-python/examples/image/Inference_results/Inference_results.csv', 'a') as file:
		#writer = csv.writer(file,delimiter=';')
		writer = csv.writer(file)
		#for item in str(data_list_1):
		 #   writer.writerows(item)
		writer.writerow((data_list_1))


	seconds_1 = int(seconds_threshold) + 1
	sec_list.append(seconds_1)
"""
```

## How to modify the period for saving a captured image at AIR-020 
* For example, modify the default vaule of `5` in `/opt/linux-sdk-python/edge_impulse_linux/image.py`, as shown in the column 75 therein.
* `5` means to save a image per five seconds. If it's changed to `6`, it will save data per six seconds correspondingly.

```sh
if (seconds % 5) == 0:
```

* To stop saving images at AIR-020, use the symbol `"""` to igore the following codes from the column `75` to `88`.

```sh
"""
if (seconds % 5) == 0:
	local_time = time.localtime()
	timeString = time.strftime("%Y_%m_%d_%H_%M_%S_", local_time)
	img_test = img
	i = 1
	
	img_pad = "Original_image/"+str(timeString) +".jpg"
	if os.path.isfile(img_pad) == True:
		#cv2.imwrite("Original_image/"+timeString+"NG.jpg",img_test)
		print #("YA" )
	else:
		#print ("NO YA")
		cv2.imwrite(img_pad, img_test)
	i = i + 1
"""
```
