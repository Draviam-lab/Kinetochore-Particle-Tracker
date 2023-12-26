# Kinetochore-Particle-Tracker



## Image Processing Methods to Automatically Track Intensity Changes In Submicron-sized Cellular Structures

This is an image analysis workflow starting with image segmentation and particle analysis. This workflow is likely to be useful for tracking and measuring changes in submicron structures in microscopy.


Description for the notebook files and folders:

 |Name                        | Type         |Description
 |----------------------------|------------- |------------ 
 | functions_AstrinWT.ipynb    | Notebook     |This file contains the functions that are used to analyse Wildtype-Q1012 dataset
 | AstrinWT.ipynb     | Notebook     |Measures Astrin intensity in WildType and p.Q1012* and generates csv files for particles measurement 
 | GraphAnalysis              | folder       |Contains generated and collated csv file
 | data                       | folder       |Images folder. It contains the subfolders for each dataset.
 | AnalysisResults            | folder       |for generated csv files and labelled images.

 
 
    Folder Structure for datasets
    .
    ├── Control/Wildtype Folder
     ├── Experiment name       #Name of the experient
       ├── mask Channel          # Folder for mask images(.tif. The name of the folder is as per the mask signal)
       ├── Particle channel      # folder for particle channel images (.tif. The name of the folder is as per the protein of interest)
       
     
     Folder Structure for AnalysisResults
    .
    ├── Dataset Name
     ├── mask_images                             # to save labelled mask channel images
     ├── mask_raw_images                         # to save the mask channel images
     ├── particle_images                         # to save labelled particle channel images
     ├── particle_raw_images                     # to save the labelled particle channel images
     ├── labelled_<name of the marker>_images    # to save labelled mask marker images. e.g. nuf2,cenpb
     ├── abelled_<name of the protein>_images    # to save labelled protein particle images. e.g. Astrin,PP1
     ├── csvs                                    # for generated csvs
     
     Folder Structure for GraphAnalysis
    .
    ├── Protein Name
     ├── Image dataset                     # Image dataset name. It contains all collated csvs
    
     
     
