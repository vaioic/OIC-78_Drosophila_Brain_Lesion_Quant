# OIC-78_Drosophila_Brain_Lesion_Quant
Analysis project to quantify lesions present in *Drosophila* brains.

Script to quantify the manually annotated data [here](/Analysis_Scripts/Lesion_Quantification.ipynb)

Scripts related to training a 2D StarDist model:
- [ImageJ script to turn Z-stack into single images](/Analysis_Scripts/Macro_SaveImageSeries.ijm)
- [Creating Training Data](/Analysis_Scripts/Split-Image.ipynb)
- [Keeping pairs of matching label and image slices for training](/Analysis_Scripts/CheckingListsofFilesForMatchingPairs.ipynb)
- [Training a 2D StarDist Model](/Analysis_Scripts/OIC-78_BrainLesions_StarDist2D.ipynb)
- [Training a 3D StarDist Model](/Analysis_Scripts/OIC-78_Brain_Lesion_StarDist3D.ipynb)
- [Predicting with StarDist](/Analysis_Scripts/StarDist_Prediction.ipynb) 