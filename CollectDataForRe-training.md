# Collect data for model retraining
## Use Edge Impulse Linux SDK to upload data with CLI
* Suppose that new data for retraining had been collected into a local directory in advance.
* In this section it shows how to upload a new fruit type of `Orange` able to be recognized as well.

<p align="center">
  <img width="600" src="image\Collect_data_for_model_retraining_01.png">
</p>

* Firstly prepare to upload images of `Orange` with good quality.
* Execute the following command `edge-impulse-uploader` with some arguments in a terminal, therein:
  - `--api-key` means the `API Keys` of the fruit project in Edge Impulse studio
  - `--label` means the lable of `OK_Orange` to be used for the data set
  - The last is the directory `path` where the dataset is located.

```sh
edge-impulse-uploader --api-key <API Keys> --label OK_Orange /<path>/F_Orange/*.jpg
```

<p align="center">
  <img width="600" src="image\Collect_data_for_model_retraining_02.png">
</p>

* When uploading is running, you can see the uploading time of each image.

<p align="center">
  <img width="600" src="image\Collect_data_for_model_retraining_03.png">
</p>

* After uploading is done, you can also see a summary about successful and failed uploaded images.

<p align="center">
  <img width="600" src="image\Collect_data_for_model_retraining_04.png">
</p>

* In the same way, prepare to upload the images of Orange with poor quality.
* Also execute the above-mentioned command in a terminal.

```sh
edge-impulse-uploader --api-key <API Keys> --label NG_Orange /<path>/S_Orange/*.jpg
```
<p align="center">
  <img width="600" src="image\Collect_data_for_model_retraining_05.png">
</p>

* When uploading is running, you can see the uploading time of each image.

<p align="center">
  <img width="600" src="image\Collect_data_for_model_retraining_06.png">
</p>

* Finally you can also see a summary about successful and failed uploaded images.

<p align="center">
  <img width="600" src="image\Collect_data_for_model_retraining_07.png">
</p>

## Browse batch uploaded training data with Edge Impulse studio
* After uploading all required data, click `Data acquisition` in the left menu.
* In `Training data` and `Test data`, check whether all `SAMPLE NAME` and `LABEL` information are correct.

<p align="center">
  <img width="600" src="image\Collect_data_for_model_retraining_08.png">
</p>

<p align="center">
  <img width="600" src="image\Collect_data_for_model_retraining_09.png">
</p>

With the aids of Edge Impulse CLI, we can easily upload new training data for further retraining an existed AI project/model in Edge Impulse.  
