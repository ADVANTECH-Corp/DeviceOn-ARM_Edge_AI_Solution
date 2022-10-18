# DeviceOn-ARM_Edge_AI_Solution
## Overview

When we talk about an overall process of Edge AI Solution, it will include data ingestion, data preprocessing, data labeling, model training and validation、model optimization, application development, application deployment and edge inference. And it's obvious that we always didn't care the time spent for the flow or pipeline integration when we carried out a POC. However there are still lots of matters necessary to be handled at that moment when we would like to transfer a POC of edge AI solution into a production stage, some things like an integrated pipeline from cloud training to edge inference, continuous deployment for AI application update, remote monitoring and management over large-scale edge AI devices and even further statistical analysis by rich inference results.

>Architecture

![image](image/project_architecture.png)

When it comes to a production stage for edge AI solutions, the topic of continuous maintenance includes lots of extra tasks to be considered and dealt with. For example, it’s necessary to re-train an AI model owing to precision bias or target objects changed. The frequency of AI application installation and update increases to a great degree. The remote capability to manage massive and unattended edge AI devices is required. Edge AI devices are rugged enough to operate normally and continuously in terrible environments, and so on. To help deal with such problems, Advantech provides customers with Azure Custom Vision, Azure DevOps, DeviceOn and AIMB-288E with NVIDIA Quadro GPU. With the aids of these products and services, it can help construct a complete Edge AI solution and accelerate realization of solution landing or production stage migration.

| Category  | Product | Key Benefits & Features |
| ------------- | ------------- | ------------- |
| ML SaaS | Edge Impulse | Easily customize your own state-of-the-art AI models for your **dedicated use case** that no ML expertise is required |
| Dev. Pipeline | Azure DevOps | Complete or complementary services provision to automate development pipeline for packaging your AI application and cross-region development|
| Deployment & Mgmt. | **DeviceOn** | Central mgmt. platform to remotely update AI applications (OTA), and monitor and control large-scale devices at ease |
| AI Edge | **AIR-020** | ??? while yielding 100% performance in 55 °C environments |

>Use Case

![image](image/scenario.png)

(待更新為水果品質檢測的描述)
In the following, a use case for production line management will be introduced. It will demonstrate how Advantech supports customers to construct a production-stage edge AI solution with edge AI related products by Advantech. It didn’t end in POC and moreover aimed to create a continuously operational edge AI application.
In this use case of PCB production management, customers tried to find a way to get notifications immediately for specific production issues. Therefore they would like to adopt a vision AI solution to improve management efficiency and reduce production loss. In the beginning, customers analyzed key factors of production capability monitoring. One is to make sure there is always a WIP of PCB in a production line to be manufactured. The other one is to know if an operator in the target workstation can operate correctly and produce normally. For operator recognition by a vision AI method in this scene, it’s easily be affected by different camera capture angles and different operator positions. To enhance recognition precision and reliability of operator existence in this practice, except for general person detection, it’s also necessary to detect a cap, gloves and tools worn or operated by an operator in each capture. To deal with such a complicated recognition problem, it always needs a compatible AI algorithm/model and powerful edge AI computing device. In the following sections, let’s find out how the above-mentioned Advantech edge AI products can be adopted to help construct an edge AI application into a production phase in which continuous maintenance is also considered.

* ### [**ML | Label training data**](ML%20|%20Label%20training%20data.md)

* ### [**ML | Train an accurate enough AI model**](ML%20|%20Train%20an%20accurate%20enough%20AI%20model.md)

* ### [**DEV | Encapsulate a portable AI application**](DEV%20|%20Encapsulate%20a%20portable%20AI%20application.md)

* ### [**DEV | Automate AI lifecycle**](DEV%20|%20Automate%20AI%20lifecycle.md)

* ### [**OPS | Deploy AI to any edge**](OPS%20|%20Deploy%20AI%20to%20any%20edge.md)

* ### [**OPS | Collect training, inference, and performance data**](OPS%20|%20Collect%20training,%20inference,%20and%20performance%20data.md)

* ### [**OPS | Monitor and manage large-scale devices**](OPS%20|%20Monitor%20and%20manage%20large-scale%20devices.md)

## Resources and reference
