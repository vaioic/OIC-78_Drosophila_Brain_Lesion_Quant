path = getDir("Location of Files");
savLoc = getDir("Save Here");
fileList = getFileList(path);

setBatchMode(true);

for (i=0; i<fileList.length; i++) {
	file = path + fileList[i];
	if(endsWith(fileList[i], ".tif")) {
		run("Bio-Formats Importer", "open=file autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
		shortTitle = File.nameWithoutExtension;
run("Image Sequence... ", "dir=" + savLoc + "/ format=TIFF name=" + shortTitle + "_");
close; 
	}}
