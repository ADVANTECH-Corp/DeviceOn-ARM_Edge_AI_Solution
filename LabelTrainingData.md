# Label training data

When we use the developer free mode of Edge Impulse to conduct the exercise of this project, because of the limitations of the developer free version, we use the sub-dataset in the "Spoiled and fresh fruit inspection dataset", the quality of the four kinds of fruits, to carry out drill.

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

* select `Upload data` to upload the fruit data on the local machine.

<p align="center">
  <img width="600" src="image\Label_training_data_05.png">
</p>

* In `Upload exising data`, click `Select files` to select a fruit category (eg: F_Lemon).
* Select `Automatically split between training and testing` in `Upload into category`, so that the uploaded data is automatically distributed between the training set and the test set in an 8:2 ratio.
* In `Label`, select `Enter label:` and enter the uploaded fruit category code. The Lemon qualified data uploaded here is `F_Lemon`, we enter `PASS_Lemon` to indicate qualified, if it is `S_Lemon` data, enter `NG_Lemon`, it means unqualified.

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

* `Dimensionality reduction technique`Here, we directly try to separate the best `t-SNE` to help us observe the differences of each fruit data category.
* Click on `Generate data explorer` to analyze.

<p align="center">
  <img width="600" src="image\Label_training_data_08.png">
</p>

* While waiting for a cup of coffee, you can see the `Data explorer` to display the distribution status of each fruit data category with images. 

<p align="center">
  <img width="600" src="image\Label_training_data_09.png">
</p>

* It can be seen that the difference between different data categories in the image is quite obvious, so we can look optimistically, and the model to be trained later will not be too bad for the recognition accuracy of each fruit category.
