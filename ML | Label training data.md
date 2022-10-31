# Label training data

When we used the developer free mode of Edge Impulse for the exercise of this project, because of the limitations of the developer free version, we used the `quality classification of four fruits` in the following "Spoiled and fresh fruit inspection dataset" for the exercise.

The dataset has `8` different fruits:

    -Banana 
    - F_Banan (Pass)
    - S_Banan (NG)
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

### Sign in or create a free developer account for Edge Impulse

<p align="center">
  <img width="600" src="image\Label_training_data_01.png">
</p>



### Create the first new project

* Click `+ Create new project`.
* Name the new project and click `Create new project` to create the project.

<p align="center">
  <img width="600" src="image\Label_training_data_02.png">
</p>

* See the welcome screen for new projects.

<p align="center">
  <img width="600" src="image\Label_training_data_03.png">
</p>



### Upload and tag data

* Click `LET'S COLLECT SOME DATA`.

<p align="center">
  <img width="600" src="image\Label_training_data_04.png">
</p>

* In `LET'S COLLECT SOME DATA`,select`Upload data` to upload the fruit data in this machine.

<p align="center">
  <img width="600" src="image\Label_training_data_05.png">
</p>

* In `Upload exising data`, click `Select files` to select a fruit category (eg: F_Lemon).
* Select `Automatically split between training and testing` in `Upload into category`, so that the uploaded data is automatically distributed between the training set and the test set in an 8:2 ratio.
* Select `Enter label:` in `Label` and enter the code of the uploaded fruit category. The Lemon qualified data uploaded here is `F_Lemon`. Here, the author enters `PASS_Lemon` to indicate qualification. If it is `S_Lemon` data, it is the code name `NG_Lemon` `, which means unqualified.

<p align="center">
  <img width="600" src="image\Label_training_data_06.png">
</p>

* Upload all the eight categories of the four kinds of fruits in sequence, and add labeling.



### Check the quality of the data

* After the data upload is complete, click `Data acquisition` in the left menu, and in `Training data`&`Test data`, check whether `SAMPLE NAME` and "LABEL" are correct.

<p align="center">
  <img width="600" src="image\Label_training_data_07.png">
</p>

* After checking the data, click `Data explorer`, where you can check the quality of the original data; we uploaded image data, so the default is `Using a pretrained visual model`.

* In the `Dimensionality reduction technique`, we try it directly, the official description is the `t-SNE` with the best separation effect, and observe the difference of each fruit category.
* Click on `Generate data explorer` to analyze.

<p align="center">
  <img width="600" src="image\Label_training_data_08.png">
</p>

* While waiting for a cup of coffee, you can see the `Data explorer` to display the distribution status of each fruit data category with images. 
* It can be seen that the difference between different data categories in the image is quite obvious, so we can look optimistically, and the model to be trained later will not be too bad for the recognition accuracy of each fruit category.
