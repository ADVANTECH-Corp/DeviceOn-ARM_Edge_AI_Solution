# Train an AI model

After labeling the necessary data, we can start to proceed model training. Edge Impulse studio provides very friendly UX/UI to users on model training jobs. In addition, its `EON Tuner`, acting as AutoML, can help users select a suitable AI model fulfilling the specification of a target hardware.

## Quickly create an AI model
### Design feature generation block(s)
* The `Impulse deign` in the left menu includes data preprocessing blocks and model type blocks.  Before a model training process, click its sub-item `Create impulse` to proceed.

* Click `Add a porcessing block` to start designing a data preprocessing method.

<p align="center">
  <img width="600" src="image\Training_AI_model_01.png">
</p>

* With `Add a porcessing block`, we can further choose a `Image` or `Raw Data` bock. Here we choosed the recommended `Image` block and then click `Add`.

<p align="center">
  <img width="600" src="image\Training_AI_model_02.png">
</p>

* Next with `Add a learning block`, we also choosed the recommended `Transfer Learning(Images)` block and then click `Add`.

<p align="center">
  <img width="600" src="image\Training_AI_model_03.png">
</p>

* Click `Save Impulse` to save the settings from data preprocessing to model training procedures.

<p align="center">
  <img width="600" src="image\Training_AI_model_04.png">
</p>

* After that, two more sub-items `Image` and `Transfer learning` showed up within `Impulse deign`.
* Then click the `Image` item, it's convenient to compare the difference between a original image and a preprocessed one in the `Parameters` tab.
* Next click the `Save parameters` button and go to the `Generate features` tab.

<p align="center">
  <img width="600" src="image\Training_AI_model_05.png">
</p>

* In the `Generate features` tab, click the `Generate features` button.

<p align="center">
  <img width="600" src="image\Training_AI_model_06.png">
</p>

* The right `Feature explorer` canvas will display distribution of image feature values. In general, we can expect that a trained model with good precision comes from obviously distinct feature distribution.

<p align="center">
  <img width="600" src="image\Training_AI_model_07.png">
</p>

### Design transfer learning block
* Further click the `Transfer learning` sub-item in the left `Impulse design` item to go to the `Neural network settings` page.
* Therein `Training settings` allows us to modify model training parameters about a transfer learning manner. We can click `Start training` to proceed model training once parameters are determined.

<p align="center">
  <img width="600" src="image\Training_AI_model_08.png">
</p>

* After starting a training process, its progress and related information will be printed in the right-upper frame.
> Please NOTE that currently **training time is limited to 20 miniutes for a trial account**. If an estimated training time exceeds the limiation, the training process won't start or will be withdrawn.

<p align="center">
  <img width="600" src="image\Training_AI_model_09.png">
</p>

* After model training is completed, detailed training model info can be found at the right bottom. Here we can found a `model version`, an `ACCURACY` score and etc.
  - Model version: Quantized (int8)
  - ACCURACY: 61.7%.

<p align="center">
  <img width="600" src="image\Training_AI_model_10.png">
</p>

* Then switching `Quantized (int8)` in the model version to `Unoptimized (float32)`. `ACCURACY` of `Unoptimized (float32)` was increased to 99.6%.

<p align="center">
  <img width="600" src="image\Training_AI_model_11.png">
</p>

> When we have to use a quantized model for deployment owing to specific considerations, it's necessary to further modify training parameters or increase training data for accuracy improvement.

## AutoML with EON Tuner
* When we need to get an accuracy-improved and/or performance-acceptable AI model, JUST click the `EON Tuner` item in the left menu to open its studio page.

<p align="center">
  <img width="600" src="image\Training_AI_model_12.png">
</p>

* Then click `Configure target` to select a `Target device`.

<p align="center">
  <img width="600" src="image\Training_AI_model_13.png">
</p>

* Next click `Start EON tuner` to automatically find the best AI model in accordance with target device capabilities.

<p align="center">
  <img width="600" src="image\Training_AI_model_14.png">
</p>

* It may take minutes or even hours that depends on the amount of data.

<p align="center">
  <img width="600" src="image\Training_AI_model_15.png">
</p>

* After EON tuner was executed and successfully done, a batch of training templates were ordered by accuracy score/percentage. 
* Furhter click `Select` in one of templates based on our requirement to replace the original training parameters if necessary.

<p align="center">
  <img width="600" src="image\Training_AI_model_16.png">
</p>

* Then returning to `Transfer learning` page, the model architecture and parameters were updated according to the previous EON tuner selection.
* Here we can obviously see that the `ACCURACY` score of `Quantized (int8)` by **EON tuner** became 99.3%, which was much higher than the score by the default model architecture and parameters.

<p align="center">
  <img width="600" src="image\Training_AI_model_17.png">
</p>

* If ncecessary, click `Quantized (int8)` item to select the other `Unoptimized (float32)`.
* The ACCURACY score of `Unoptimized (float32)` became 99.8%, which is also 0.2% higher than the default float32 model.
* With adoption of the new configuration from EON tuner, here it's still necessary to click `Start training` to get a new trained model.

<p align="center">
  <img width="600" src="image\Training_AI_model_18.png">
</p>

* Then the training status with a new model architecture and new parameters was shown as below.

<p align="center">
  <img width="600" src="image\Training_AI_model_19.png">
</p>

* In the end, it actually created the new float32 model with `ACCURACY` score of 99.8% as indicated by EON tuner.

<p align="center">
  <img width="600" src="image\Training_AI_model_20.png">
</p>

* And the new int8 model achieved a 99.5% ACCURACY score, which was also similar to EON tuner's indication.

<p align="center">
  <img width="600" src="image\Training_AI_model_20_1.png">
</p>

* To this stage, AI model training through Edge Impulse was completed.

## (Reminder for a free trial account) Limited 20 minutes for model training
* A problem could occur that `Estimated training time is larger than compute time limit` when adopting a EON tuner selection for optimization.
* Such information indicates that we need to go back to EON tuner page to choose another configuration for model training. In general, for decreasing training time, it's necessary to select a quantized model or a lower accuracy score.

<p align="center">
  <img width="600" src="image\Training_AI_model_21.png">
</p>

* Next, let's see how to choose a workable option for the time limit in EON tuner as possibly as we can.
* It was observed that one of templates with a lightweight model and a ACCURACY score of 95% had `INPUT` of a 32x32 image resolution. It was expected to have less traing time so choosing it to replace the original model training configuration.

<p align="center">
  <img width="600" src="image\Training_AI_model_22.png">
</p>

* After that going back to `Transfer learning` page, the model configuration had been updated as well.
* Here the `ACCURACY` score of `Quantized (int8)` became 94.9%, which is also far better than the int8 model trained by default (only 61.7%). 

<p align="center">
  <img width="600" src="image\Training_AI_model_23.png">
</p>

* Then click `Start training` to train the new model.

<p align="center">
  <img width="600" src="image\Training_AI_model_24.png">
</p>

* And it came to get an accuracy improved int8 model.

<p align="center">
  <img width="600" src="image\Training_AI_model_25.png">
</p>

* For a float32 model requirement in the free trial situation, click `Quantized (int8)` to select `Unoptimized (float32)`.
* Then we could find that the `ACCURACY` score of `Unoptimized (float32)` was 94.8%, which was 4.8% lower than the default. 
* As a result, we need to go back to the previous step.

<p align="center">
  <img width="600" src="image\Training_AI_model_30.png">
</p>

* Click `Create impulse` in the left menu of Edge Impulse studio.
* Then click a trash icon at bottom right of the `Classification (Keras)` block to delete it.

<p align="center">
  <img width="600" src="image\Training_AI_model_26.png">
</p>

* Next, click `Add a learning block`, choose the recommended `Transfer Learning (Images)` block and then click `Add`.

<p align="center">
  <img width="600" src="image\Training_AI_model_27.png">
</p>

* Click `Start training` to train a new model.

<p align="center">
  <img width="600" src="image\Training_AI_model_28.png">
</p>

* Finally a better float32 model was generated within the training time limit.
<p align="center">
  <img width="600" src="image\Training_AI_model_29.png">
</p>
