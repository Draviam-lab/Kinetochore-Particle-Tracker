# Kinetochore-Particle-Tracker
# ImageAnalysis


## Image Processing Methods to Automatically Track Intensity Changes In Submicron-sized Cellular Structures

This is an image analysis workflow starting with image segmentation and particle analysis. This workflow is likely to be useful for tracking and measuring changes in submicron structures in microscopy.


Description for the notebook files and folders:

 |Name                        | Type         |Description
 |----------------------------|------------- |------------ 
 | functions.ipynb            | Notebook     |This file contains the functions that are used in this pipeline
 | Analysis-Method1.ipynb     | Notebook     |Measures PP1 intensity in CDKi and DMSO Cells,generates graphs and csv files for particles measurements 
 | Analysis-Method2.ipynb     | Notebook     |Measures Astrin intensity in WildType and Q1012,generates graphs and csv files for particles measurement 
 | graphs                     | folder       |generated graphs
 | Experiment Name            | folder       |Experiment folder.It has following subfolders. 
 | mask                       | folder       |tif images of masks
 | channel                    | folder       |tif images of the channel 
 | labelled _images           | folder       |generated and labelled images
 | AnalysisResults            | folder       |for Graphs and csvs

 
 
    Folder Structure for experiments
    .
    ├── Experiment Name
     ├── mask                  # mask images(.tif)
     ├── pp1/channel           # channel images (.tif)
     ├── labelled_images       # labelled and overlay images
     
     Folder Structure for AnalysisResults
    .
    ├── Experiment Name
     ├── graphs                # to save the graphs
     ├── csvs                  # for generated csvs
