# OIC-78 Drosophila Brain Lesion Analysis

GitHub Repository: https://github.com/vaioic/OIC-78_Drosophila_Brain_Lesion_Quant

### Summary of Request

Detect and quantify the number, size, and shape of lesions in whole *Drosophila* brain samples. 

### Brief summary of analysis pipeline
Initially trained a pixel classifier through Imaris to quantify lesions, but variation in data was too much. Then attempted to train a StarDist model to detect lesions. Initially showed promise, but timeline to train the model would take too long. Decided to move forward with manual annotation of all the data (done by April) and then automate getting size and shape measurements with a script (done by Kristin). 

May use the manually annotated data to train a StarDist model at a later date.

### Data
Phalloidin stained *Drosophila* brains were imaged with the multi-photon module on the LSM 880. Brains were mounted on a glass slide with a gasket to keep the coverslip from crushing the samples. Z-stacks covering the full depth of the brain were acquired.

### Analysis Pipeline
*Only covers the script for quantifying the manually annotated data*

Because the images were manually annotated, the primary task was to measure the label image (lesion annotations). 

[Scikit-image](https://scikit-image.org), a python package for analyzing and quantifying images, was used for measuring the volume and surface area of the lesion annotations. 

To calculate the Sphericity of the lesion annotations, the following equation was used:

($\pi$<sup>1/3</sup> * ( (6*Volume)<sup>2/3</sup>) ) / Surface Area

[Pandas](https://pandas.pydata.org/docs/index.html), a python package for handling data frames, was used to export the final data frame of measurements as a csv. 

A [Python script](/Analysis_Scripts/Lesion_Quantification.ipynb) was written to quantify all images in an automated manner.

### Output
For each image, the label ID, area (Volume), surface area, and sphericity were exported as a csv. Example of data exported shown below:

|    |   Unnamed: 0 |   label |     area |   Surface_Area (um^2) |   Sphericity |
|---:|-------------:|--------:|---------:|----------------------:|-------------:|
|  0 |            0 |       1 | 273.472  |               344.011 |     0.592271 |
|  1 |            1 |       2 | 364.586  |               408.554 |     0.60409  |
|  2 |            2 |       3 |  57.6276 |               137.058 |     0.526421 |
|  3 |            3 |       4 | 283.985  |               336.287 |     0.621305 |
|  4 |            4 |       5 | 117.851  |               215.844 |     0.538559 |

Unnamed: 0 is the index value of each object (can be ignored). Label is the Object ID (the label value used to annotate the lesion), and area is the volume in um^3. 

### Notes

With a larger manually annotated data set available, it may be worth using it to train a StarDist model. However, this would only be worth the investment if collecting and analyzing this type of data is part of future experiments in the lab.

#### Optional Analyses - what other information could you get from this data
Distribution of the lesions within the brain could be assessed using the centroid coordinates and the bounding box of the whole brain.

Fluorescence intensity within the lesions could be measured to assess how "depleted" they are of phalloidin.