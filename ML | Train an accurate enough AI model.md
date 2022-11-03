# Train an accurate enough AI model

我們將上傳的數據完成標記，也確定數據沒有錯誤後，接著就可以開始下面的模型訓練演練。Edge Impulse的模型訓練對於一般使用者非常友善，系統會推薦上傳數據集所適合的block，可以讓我們快速開發AI模型。而透過EON Tuner可以幫助我們在目標硬體的限制內，選擇最合適的AI模型。
After we mark the uploaded data and confirm that the data is correct, we can start the following model training exercise. Edge Impulse's model training is very friendly to general users, and the system will recommend suitable blocks for uploading data sets, allowing us to quickly develop AI models. EON Tuner can help us select the most suitable AI model within the constraints of the target hardware.

## Designing your learning blocks

* 左側選單中的`impulse deign`是Edge Impulse在AI模型訓練之前，組合Data Preprocessing block與選擇模型種類block的設計介面；讓我們點擊子項目`Create impulse`進入設計介面。
* The `impulse deign` in the left menu is the design interface for Edge Impulse to combine the Data Preprocessing block and the model type selection block before AI model training; let us click the sub-item `Create impulse` to enter the design interface.

* 點擊`Add aporcessing block`開始設計模型前處理方式。
* Click `Add aporcessing block` to start designing the preprocessing method of the model.

<p align="center">
  <img width="600" src="image\Training_AI_model_01.png">
</p>

* `Add aporcessing block`介面上，可以選擇`image` bock or `Raw Data` bock，我們選擇系統推薦`image` bock上，點選`add`。
* On the `Add aporcessing block` interface, you can choose `image` bock or `Raw Data` bock, we choose the system recommended `image` bock, click `add`.

<p align="center">
  <img width="600" src="image\Training_AI_model_02.png">
</p>

* 接下來在`Add a learming block`介面上，我們依然選擇系統推薦`Transfer Learning (Images)` bock上，點選`add`。
* Next, on the `Add a learning block` interface, we still choose the system recommended `Transfer Learning (Images)` bock, click `add`.

<p align="center">
  <img width="600" src="image\Training_AI_model_03.png">
</p>

* 設計好數據前處理到AI模型的訓練流程後，點擊`Save Impulse`儲存設定。
* After designing the training process of pre-processing the data to the AI model, click `Save Impulse` to save the settings.

<p align="center">
  <img width="600" src="image\Training_AI_model_04.png">
</p>

* 左側選單中的`impulse deign`下，多出了剛設計好的兩個子項目，block，`image`與`Transfer Learning`。
* Under `impulse deign` in the left menu, there are two more sub-projects just designed, block, `image` and `Transfer Learning`.

* 點選`image`項目，在`Parameters`頁面，可以檢查原始數據透過我們設計的Data Preprocessing處理前後的差別。
* Click on the `image` item, on the `Parameters` page, you can check the difference between the original data before and after processing through our designed Data Preprocessing.

* 點擊`Save parameters`，會跳轉到'Feature generation' 頁面。
* Click `Save parameters` to jump to the 'Feature generation' page.

<p align="center">
  <img width="600" src="image\Training_AI_model_05.png">
</p>

* 在`Generate features`頁面，點擊綠色的`Generate features`按鈕。
* On the `Generate features` page, click the green `Generate features` button.

<p align="center">
  <img width="600" src="image\Training_AI_model_06.png">
</p>



* 右邊的`Feature explorer`會將經過Data Preprocessing後的所有數據，進行dimensionality reduction的分類，數據會依照特徵的相似性，聚集或分散。
* The `Feature explorer` on the right will classify all the data after Data Preprocessing for dimensionality reduction, and the data will be clustered or scattered according to the similarity of features.

* 可以點擊`Feature explorer`內的圓點，可以查看圓點是屬於哪個數據。
* You can click the dots in the `Feature explorer` to see which data the dots belong to.

<p align="center">
  <img width="600" src="image\Training_AI_model_07.png">
</p>

* 左側選單中的`impulse deign`下的子項目中，點擊`Transfer Learning`項目。
* In the sub-items under `impulse deign` in the left menu, click on the `Transfer Learning` item.

* `Neural Network settings`頁面中的`Training setting`，這裡
是我們上面選擇`Transfer Learning (Images)` bock的模型架構與參數設定，我們點擊`Start training`進行模型訓練。
* `Training setting` in the `Neural Network settings` page, here
It is the model architecture and parameter settings of the `Transfer Learning (Images)` bock we selected above. We click `Start training` to train the model.

<p align="center">
  <img width="600" src="image\Training_AI_model_08.png">
</p>

* 右上的資訊欄，會顯示模型訓練中的資訊；另外要注意，開發人員免費版本的訓練時間會被限制在20分鐘內。模型架構與參數設定，如果被系統評估訓練時間會超過20分鐘，則會終止訓練。
* The information bar on the upper right will display the information of the model training; in addition, please note that the training time of the developer's free version will be limited to 20 minutes. Model architecture and parameter settings. If the training time is estimated by the system to exceed 20 minutes, the training will be terminated.

<p align="center">
  <img width="600" src="image\Training_AI_model_09.png">
</p>

* 模型訓練完成之後，右下的資訊欄位會出現模型的`Model version`，顯示`Quantized (int8)`的模型版本，以及`ACCURACY`分數的相關資訊。
* After the model training is completed, the `Model version` of the model will appear in the information column on the lower right, showing the model version of `Quantized (int8)`, and information about the `ACCURACY` score.

* `Quantized (int8)`的`ACCURACY`分數僅有61.7%。
* The `ACCURACY` score of `Quantized (int8)` is only 61.7%.

<p align="center">
  <img width="600" src="image\Training_AI_model_10.png">
</p>


* 點擊`Quantized (int8)`可以切換`Unoptimized (float32)`的模型版本。
* Click `Quantized (int8)` to toggle the model version of `Unoptimized (float32)`.

* `Unoptimized (float32)`的`ACCURACY`分數高達99.6%。
* `ACCURACY` score of `Unoptimized (float32)` is as high as 99.6%.

<p align="center">
  <img width="600" src="image\Training_AI_model_11.png">
</p>

* 當我們如果必須使用精度int8的模型進行佈署的話，因為int8模型的`ACCURACY`分數僅有61.7%，我們可以試著提高模型的accuracy。
* When we have to use a model with precision int8 for deployment, because the `ACCURACY` score of the int8 model is only 61.7%, we can try to improve the accuracy of the model.

### 使用The EON Tuner提高模型的accuracy
### Using The EON Tuner to improve the accuracy of the model

* 點選左側的EON Tuner，進入EON Tuner頁面。
* Click EON Tuner on the left to enter the EON Tuner page.

<p align="center">
  <img width="600" src="image\Training_AI_model_12.png">
</p>

* 點擊`Configure target`中，設定目標相似的硬體；EON Tuner可以在這硬體限制範圍內協助找到最佳的AI模型。
* Click `Configure target` to set a similar target hardware; EON Tuner can help find the best AI model within the hardware limit.

<p align="center">
  <img width="600" src="image\Training_AI_model_13.png">
</p>

* 點擊`Start EON tuner`啟動EON tuner。
* Click `Start EON tuner` to start EON tuner.

<p align="center">
  <img width="600" src="image\Training_AI_model_14.png">
</p>

* EON tuner運算，依照數據的多寡，需要十幾分鐘甚至到數小時，讓我們喝杯咖啡再回來。
* EON tuner operation, depending on the amount of data, takes ten minutes or even hours, let's have a cup of coffee and come back.

<p align="center">
  <img width="600" src="image\Training_AI_model_15.png">
</p>

* EON tuner運算完成後，我們選擇最適合模型架構旁的`Select`，此模型架構的參數模組，會置換掉我們初始的訓練模型架構與參數。
* After the EON tuner operation is completed, we choose the `Select` next to the most suitable model architecture. The parameter module of this model architecture will replace our initial training model architecture and parameters.

<p align="center">
  <img width="600" src="image\Training_AI_model_16.png">
</p>

* 回到`impulse deign`下的子項目`Transfer Learning`，模型架構與參數已被我們選擇的訓練模型架構與參數更新。
* Going back to the sub-project `Transfer Learning` under `impulse deign`, the model architecture and parameters have been updated by our chosen training model architecture and parameters.

* 右下會有EON tuner先前計算過的模型accuracy分數，可以看到`Quantized (int8)`的`ACCURACY`分數為99.3%，遠大於系統預設模型架構與參數所訓練int8模型的分數。
* There will be the model accuracy score previously calculated by EON tuner in the lower right. You can see that the `ACCURACY` score of `Quantized (int8)` is 99.3%, which is much higher than the score of the int8 model trained by the system preset model architecture and parameters.

<p align="center">
  <img width="600" src="image\Training_AI_model_17.png">
</p>

* 切換點擊`Quantized (int8)`可以切換`Unoptimized (float32)`的模型版本。
* Toggle click `Quantized (int8)` to toggle the model version of `Unoptimized (float32)`.

* `Unoptimized (float32)`的`ACCURACY`分數為99.8%，也比一開始的預設float32模型高了0.2%。
* The `ACCURACY` score of `Unoptimized (float32)` is 99.8%, which is also 0.2% higher than the default float32 model at the beginning.

*  點擊`Start training`進行新模型的訓練。
* Click `Start training` to train the new model.

<p align="center">
  <img width="600" src="image\Training_AI_model_18.png">
</p>

* 正在依照新的模型架構與參數進行訓練中。
* Currently training with new model architecture and parameters.

<p align="center">
  <img width="600" src="image\Training_AI_model_19.png">
</p>

* 完成新模型的訓練，如同EON tuner先前計算過的accuracy分數，float32模型的`ACCURACY`分數得到99.8%。
* Complete the training of the new model, the `ACCURACY` score of the float32 model is 99.8% as the accuracy score previously calculated by the EON tuner.

* 至此，我們已經完成了AI模型的訓練，往佈署到硬體上的流程，又前進了一步。
* At this point, we have completed the training of the AI ​​model, and we have taken another step forward in the process of deploying it to the hardware.

<p align="center">
  <img width="600" src="image\Training_AI_model_20.png">
</p>

### 開發人員免費版本，模型訓練時間20分鐘的限制
### Developer free version, model training time limit of 20 minutes

* 當我們選擇EON tuner中，分數最高的模型架構，訓練時會發生錯誤，右上的資訊欄位顯示:`Estimated training time (38m 30s) is larger than compute time limit (20m 0s)`.
* When we select the model architecture with the highest score in the EON tuner, an error will occur during training, and the information column on the upper right shows: `Estimated training time (38m 30s) is larger than compute time limit (20m 0s)`.

* 這些資訊表示我們在免費版本無法使用這個模型架構與參數，必須回到EON tuner選擇更輕量的模型架構與參數。
* These information means that we cannot use this model structure and parameters in the free version, and must go back to EON tuner to choose a lighter model structure and parameters.

<p align="center">
  <img width="600" src="image\Training_AI_model_21.png">
</p>

* 回到EON tuner頁面，怎麼選擇可以在時間限制內完成訓練的模型架構呢?
* Go back to the EON tuner page, how to choose a model architecture that can complete the training within the time limit?

* 觀察到ACCURACY分數為`95%`的輕量模型架構，它的`INPUT`為32*32，數據在輸入時會壓得更小，模型結構相對的會更輕量，因此選擇它更新原本的模型架構與參數。
* It is observed that the lightweight model architecture with ACCURACY score of `95%`, its `INPUT` is 32*32, the data will be smaller when input, and the model structure will be relatively lighter, so choose it to update the original model architecture and parameters.

<p align="center">
  <img width="600" src="image\Training_AI_model_22.png">
</p>


* 回到`impulse deign`下的子項目`Transfer Learning`，模型架構與參數已被我們的選擇所更新。
* Going back to the sub-project `Transfer Learning` under `impulse deign`, the model architecture and parameters have been updated with our choices.

* 右下會有EON tuner先前計算過的模型accuracy分數，可以看到`Quantized (int8)`的`ACCURACY`分數為94.9%，遠勝過原本系統預設的模型架構與參數所訓練int8模型`ACCURACY`的61.7%分數。因此如果需要in8模型，就可以使用此模型架構與參數進行訓練。
* There will be the model accuracy score previously calculated by EON tuner in the lower right. You can see that the `ACCURACY` score of `Quantized (int8)` is 94.9%, which is far better than the int8 model trained by the original system's preset model architecture and parameters` 61.7% score of ACCURACY`. So if you need an in8 model, you can use this model architecture and parameters for training.

<p align="center">
  <img width="600" src="image\Training_AI_model_23.png">
</p>

* 點擊`Start training`進行新模型的訓練。
* Click `Start training` to train the new model.

<p align="center">
  <img width="600" src="image\Training_AI_model_24.png">
</p>

* 提高int8模型準確度的訓練，完成。
* The training to improve the accuracy of the int8 model is completed.

<p align="center">
  <img width="600" src="image\Training_AI_model_25.png">
</p>


* 切換點擊`Quantized (int8)`切換`Unoptimized (float32)`的模型版本。
* Toggle click `Quantized (int8)` to toggle the model version of `Unoptimized (float32)`.

* 會發現`Unoptimized (float32)`的`ACCURACY`分數為94.8%，比一開始的預設模型架構與參數低了4.8%，因此如果我們需要使用float32的模型，可以回到原始設定的模型架構與參數。
* It will be found that the `ACCURACY` score of `Unoptimized (float32)` is 94.8%, which is 4.8% lower than the initial preset model architecture and parameters, so if we need to use the float32 model, we can return to the original set model architecture with parameters.

<p align="center">
  <img width="600" src="image\Training_AI_model_30.png">
</p>


* 點擊左側選單中的`impulse deign`子項目`Create impulse`，回到設計介面。
* Click on the `impulse deign` sub-item `Create impulse` in the left menu to return to the design interface.

* 點擊`Classification (Keras)`右下的垃圾桶圖示，刪除`Classification (Keras)`bock。
* Click the trash icon in the lower right of `Classification (Keras)` to delete the `Classification (Keras)`bock.

<p align="center">
  <img width="600" src="image\Training_AI_model_26.png">
</p>

* 接下來在`Add a learming block`介面上，我們依然選擇之前選擇的系統推薦`Transfer Learning (Images)` bock上，點選`add`。
* Next, on the `Add a learning block` interface, we still choose the system recommendation `Transfer Learning (Images)` bock selected before, and click `add`.

<p align="center">
  <img width="600" src="image\Training_AI_model_27.png">
</p>

* 點擊`Start training`進行新模型的訓練。
* Click `Start training` to train the new model.

<p align="center">
  <img width="600" src="image\Training_AI_model_28.png">
</p>

* 完成float32模型的訓練。
* Complete the training of the float32 model.
<p align="center">
  <img width="600" src="image\Training_AI_model_29.png">
</p>


