# Label training data

## Log in Edge Impulse studio
- Open [Edge Impulse](https://www.edgeimpulse.com/) website with your browser and then click `Login` at top-right corner.
- Procced to `log in`, or `sign up` for a free trial.

<p align="center">
  <img width="600" src="image\Label_training_data_01.png">
</p>

## Prepare data for model training
When we have a free trial account of Edge Impulse to conduct the exercise of this project, because of limitations of a free trial, we just used a sub-dataset from the "Spoiled and fresh fruit inspection dataset", the quality of the four kinds of fruits, to carry out this repo.

The used dataset totally includes `4` classes of fruit with Pass and NG status:

    -Banana 
    - F_Banana (Pass)
    - S_Banana (NG)
    -Lemon
    - F_Lemon (Pass)
    - S_Lemon (NG)
    -Lulo
    - F_Lulo (Pass)
    - S_Lulo (NG)	
    -Mango
    - F_Mango (Pass)
    - S_Mango (NG)	

<sub> *Source from: Pachon Suescun, Cesar Giovany; Pinzón Arenas, Javier Orlando; Jiménez-Moreno, Robinson (2020), “Spoiled and fresh fruit inspection dataset”, Mendeley Data, V1, doi: 10.17632/6ps7gtp2wg.1* </sub>

[Download](https://data.mendeley.com/datasets/6ps7gtp2wg/1)

## Create the first new project

* Click `+ Create new project`.
* Name the new project and click `Create new project`.

<p align="center">
  <img width="600" src="image\Label_training_data_02.png">
</p>

* See the welcome screen for a new project.

<p align="center">
  <img width="600" src="image\Label_training_data_03.png">
</p>

## Upload and label data

* Click `LET'S COLLECT SOME DATA`.

<p align="center">
  <img width="600" src="image\Label_training_data_04.png">
</p>

* Select `Upload data` to upload the fruit images in a local folder.

<p align="center">
  <img width="600" src="image\Label_training_data_05.png">
</p>

* In `Upload exising data`, click `Select files` to select a fruit category (eg: F_Lemon).
* Select `Automatically split between training and testing` in `Upload into category`, so that the uploaded data is automatically distributed between one training set and the other test set in an 8:2 ratio.
* In `Label`, select `Enter label:` and enter a requried name of uploaded fruit images. For example, `PASS_Lemon` is used for qualified lemon, and `NG_Lemon` is used for unqualified lemon.

<p align="center">
  <img width="600" src="image\Label_training_data_06.png">
</p>

* In sequence complete similar operations for necessary image data.

## Check training data quality

* After uploading and labeling the data, click `Data acquisition` in the left menu, and in `Training data`&`Test data`, check whether each SAMPLE NAME' `LABEL` is correct.

<p align="center">
  <img width="600" src="image\Label_training_data_07.png">
</p>

* Then click `Data explorer`, where you can check data quality; we uploaded image data, so the default is `Using a pretrained visual model`.

* For `Dimensionality reduction technique`, here we adopted `t-SNE` to observe the differences of each fruit type.
* Then click on `Generate data explorer` to further analyze.

<p align="center">
  <img width="600" src="image\Label_training_data_08.png">
</p>

* It might take a little time for data feature generation, and finally it displayed feature distribution of each fruit category. 

<p align="center">
  <img width="600" src="image\Label_training_data_09.png">
</p>

> There are obvious differences among different fruit images so we can expect that in general a trained model with these data will perform good recognition accuracy on each fruit category.
