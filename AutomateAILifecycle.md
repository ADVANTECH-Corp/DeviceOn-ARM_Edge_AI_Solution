# DEV | Automate AI app wrapping 

Here will introduce how to use Azure Pipelines to quickly update APP versions through DeviceOn, and how to quickly update the inference model on the edge device (AIR-020).

## Prerequisites

* If you do not have an `Azure` account, please [create an Azure account](https://azure.microsoft.com/zh-tw/free/) at first.
* Then go to [Azure Pipelines](https://azure.microsoft.com/en-us/products/devops/pipelines/) and `Start free`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_01.png">
</p>

* Click `Continue`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_02.png">
</p>

* Fill in `Azure DevOps organization` by yourself and then click `Continue`.
> NOTE: Please keep the organization name becuase the information would be necessary for later operations.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_02_1.png">
</p>

* In this repo, enter EI_DEMO  in `Project name`, select `Private` for `Visibility`, and then click `Create project`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_03.png">
</p>

* Click the gear icon for `Project setting` at bottom left.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_04.png">
</p>

* Turn on the `Repos` of Azure DevOps services.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_05.png">
</p>

* Then refresh the current webpage, and a `Repos` option will show up in the left menu.
* Click the `Repos` option, and then click `Initialize` at bottom to create an `Azure Repos`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_06.png">
</p>

* Next, click the `⋮` item at top right to create a new `Folder` in the Repos.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_07.png">
</p>

* Fill in a new folder and a new file names with`script` here and then click `Create`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_08.png">
</p>

* Click `Commit` at top right and furhter click `Commit` next to confirm the operations.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_09.png">
</p>

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_10.png">
</p>

* Download necessary [script files](https://github.com/ADVANTECH-Corp/DeviceOn-ARM_Edge_AI_Solution/tree/main/azure_pipelines_repos/script) in this repo.
* Replace `<API Key>` in `Deploy.sh` and `EI_run.sh` files with the `API Key` of your own project.
* Upload the three script files to the folder `script` created in Azure Repos, and then click `Commit` to make the changes.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_11.png">
</p>

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_12.png">
</p>

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_13.png">
</p>

* After uploading, click the `Files` item in `Repos` in the left menu.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_14.png">
</p>

* Next, also upload both [EI_DEMO_update.yml and OTAPackage.tar.xz](https://github.com/ADVANTECH-Corp/DeviceOn-ARM_Edge_AI_Solution/tree/main/azure_pipelines_repos) files for generating DeviceOn OTA packages, and then click `Commit` to make the changes.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_15.png">
</p>

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_16.png">
</p>

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_17.png">
</p>

* So far all the required files are ready in `Azure Repos`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_18.png">
</p>

## Create a pipeline to update APP versions in DeviceOn
* Click `Pipelines` in the left menu, and then click `Create Pipeline`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_19.png">
</p>

* Select `Azure Repos Git` as the source for this repo.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_20.png">
</p>

* Next select the `EI_DEMO' project created previously.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_21.png">
</p>

* Then choose `Existing AZure Pipelines YAML file`for this repo.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_22.png">
</p>

* In the right window, select `EI_DEMO_update.yml` just uploaded for `Path`, and then click `Continue`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_23.png">
</p>

* Click `Variables` at top right.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_24.png">
</p>

* Click `New variable`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_25.png">
</p>

* For this repo, there are six new variables necessary to be added, and please NOTE that `Let users override this value when running this pipeline` must be chekced for all the variables.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_26.png">
</p>

* The `Value` of `APP_REPO_NAME` must be the same with the `Repository` name of the `edge-impulse-linux` App in DeviceOn. Hereafter it is demonstrated with `Store`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_27.png">
</p>

* The `Value` of `DEVICEON_URL` is a DeviceOn server URL. For example, here is `deviceon.wise-paas.com`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_28.png">
</p>

* `Keep this value secret` of `DEVICEON_PW` must be checked to keep the pipeline working normally.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_29.png">
</p>

* The `Value` of `APP_VERSION` is a version number later than the original `edge-impulse-linux` App (for example, from 1.0.0.0 to 1.0.0.1) so that DeviceOn can normally update the `edge-impulse-linux` App to an edge device (AIR- 020) .

| Name | Value |
| ------ | ------ |
| APP_NAME | edgeimpulselinux |
| APP_REPO_NAME | `<Repository Name>` |
| DEVICEON_URL | `<DeviceOn URL>` |
| DEVICEON_USER | `<DeviceOn Login Account Name>` |
| DEVICEON_PW | `<DeviceOn Login Account Password>` |
| APP_VERSION | `<Version Number>` |

* After checking the above-mentioned six variables, click `Save`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_30.png">
</p>

* Then click `Run` at top right.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_31.png">
</p>

* Please NOTE that if `Run` can't be executed successfully, please go to the following website showing in an error message to apply required access to Azure Pipelines.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_31_1.png">
</p>

```sh
https://aka.ms/azpipelines-parallelism-request
```

* When filling out the form in the website, please NOTE that it's necesary to use the corresponding `Azure DevOps Organization`.
* As for the `Are you requesting a parallelism increase for Public or Private projects?` item, select `Private` in this repo or your persnoal POC.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_31_2.png">
</p>

* It could take 2~3 business days to issue such a request to be approved
* After receiving an e-mail, the pipeline can be executed normally.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_31_3.png">
</p>

* Once the pipeline starts running you can click `Job` at bottom left to get detailed information.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_32.png">
</p>

* If there is no error in each step of `Job`, it means that a new `edge-impulse-linux` app version has been successfully pushed to `DeviceOn`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_33.png">
</p>

* Then go to `DeviceOn` to check the `Repository` where the `edge-impulse-linux` app was saved. You can see that the version number of the `edge-impulse-linux` app has been updated from `1.0.0.0` to `1.0.0.1`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_34.png">
</p>

* To this stage, an overall CI/CD to bridge the gap between Edge Impulse (ML service) and DevieOn (Edge deployment and management platform) is complete. 

## (Additional instructions) Easily update a new app version by DeviceOn OTA 

* Click the AIR-020 connected to `DeviceOn` already, and then click `Upgrade` of its installed `edge-impulse-linux` app to deploy a new app version.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_35.png">
</p>

* Check if `version` is `1.0.0.1` or later than the orignal one at edge and then click `Confirm`.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_36.png">
</p>

* Then it shows a installation progress for the new `edge-impulse-linux` app of `1.0.0.1` version.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_37.png">
</p>

* Finally the `edge-impulse-linux` app of 1.0.0.1 version number is installed at edge able to be checked by DeviceOn as well.

<p align="center">
  <img width="600" src="image\Automate_AI_app_wrapping_38.png">
</p>
