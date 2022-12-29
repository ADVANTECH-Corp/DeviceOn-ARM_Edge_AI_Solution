# DeviceOn-ARM_Edge_AI_Solution
## Overview

A typical Machine Vision solution pipeline consists of data ingestion, data preprocessing, data labeling, model training and validation, model optimization, application development, application deployment and edge inference. Tasks and processes that could be ignored for POC purpose would become key success factors for production stage, such as integrated pipeline from cloud training to edge inference, continuous deployment for AI application updates, remote monitoring, management over large-scale edge AI devices and further analytics of rich inference results. This best practice is to bridge those gaps with hand-on implementation details hopefully to bring every machine vision project to real edge production.

> ### **Architecture**

![image](image/project_architecture.png)

When it comes to a production stage for edge AI solutions, users have to deal with many tasks associated with continuous integration and delivery (CI/CD). It’s necessary to retrain an AI model owing to precision bias or target objects changed with frequent application updates.. The capability to remotely manage large number of devices - supervised or unattended - is required. IoT devices have to be ruggedized to function normally in all kinds of different environment conditions. That’s why Advantech provides customers with Edge Impulse, Azure DevOps, DeviceOn and AIR-020 with NVIDIA Jetson, as a well-validated Edge AI solution set. Any AI or IoT builder can reference this best practice as the base to customize for its own domain solution, using all or part of this Advantech-recommended solution set.

| Category  | Product | Key Benefits & Features |
| ------------- | ------------- | ------------- |
| ML SaaS | **[Edge Impulse](https://www.edgeimpulse.com/)** | Easily customize your own state-of-the-art AI models for your **dedicated use case** that no ML expertise is required |
| Dev. Pipeline | [Azure DevOps](https://azure.microsoft.com/en-us/products/devops/) | Complete or complementary services provision to automate development pipeline for packaging your AI application and cross-region development|
| Deployment & Mgmt. | **[DeviceOn](https://campaign.advantech.online/en/DeviceOn/index.html#SolutionPackages)** | Central mgmt. platform to remotely update AI applications (OTA), and monitor and control large-scale devices at ease |
| AI Edge | **[AIR-020](https://www.advantech.com/en/products/65f20c25-f6ef-4ab5-be3c-b7dfa7a833b3/air-020/mod_fcf216c8-3495-4809-b815-61dc008d53a4)** | Powered by NVIDIA Jetson series and featuring an ultra-compact and rugged design with 12 ~ 24V wide power input & -10 ~ 55 °C operating temperatures |

> ### **Use Case**

![image](image/scenario.png)

In this repository, a fruit inspection use case is implemented to demonstrate how Advantech supports customers to deliver a production-stage edge AI solution. we use the following dataset with a deep learning-based algorithm from Edge Impulse to identify different fruit and associated quality.

The whole dataset has 8 different fruits:
  
    -banana
    -lemon
    -lulo
    -mango
    -orange
    -strawberry
    -tamarillo
    -tomato 
<sub> *Source from: Pachon Suescun, Cesar Giovany; Pinzón Arenas, Javier Orlando; Jiménez-Moreno, Robinson (2020), “Spoiled and fresh fruit inspection dataset”, Mendeley Data, V1, doi: 10.17632/6ps7gtp2wg.1* </sub>
 
Two thousand images of each one of the types of fruits are acquired for a total of 16000 samples. Half of them correspond to fresh fruits and the other half to non-fresh or spoiled fruits. For the acquisition of the dataset, changing of backgrounds, rotation of the fruits, distance of capture, and light variations were made, in order to make it robust. 

> ### **Step-by-step details are presented in the following sections**

* #### [**ML | Label training data**](LabelTrainingData.md)

* #### [**ML | Train an AI model**](TrainAnAccurateEnoughAIModel.md)

* #### [**DEV | Wrap an app around the model**](EncapsulateAPortableAIApplication.md)

* #### [**DEV | Automate AI app wrapping**](AutomateAILifecycle.md)

* #### [**OPS | Deploy the AI app to edge devices**](DeployAIToAnyEdge.md)

* #### [**OPS | Collect data for model retraining**](CollectDataForRe-training.md)

* #### **OPS | Collect data for analytics** <sub>*(To be published soon, email wowaiot.wseg@advantech.com to get notified)*</sub> 

## Reference Resources
### Sample Data for Training and Inference

* [Images for labeling and training](https://data.mendeley.com/datasets/6ps7gtp2wg/1)


### App Uploading and Deployment

* [Wrap an app](https://youtu.be/5wRANEF-nxM?t=171)

* [Select an app then deploy to devices](https://youtu.be/5wRANEF-nxM?t=15)

* [Select a device then deploy an app](https://youtu.be/5wRANEF-nxM?t=36)

### AI Model Deployment and Operation

* [Create a container](https://youtu.be/bilP6FpyU0M?t=109)

* [Container management](https://youtu.be/bilP6FpyU0M?t=145)

### [More about DeviceOn](https://docs.wise-paas.advantech.com/en/Guides_and_API_References/ApplicationServices/1564727799415968385/1564727878040194797/v1.0.2)
