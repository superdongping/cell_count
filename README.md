These codes are used for cell counting from microscope images.
The main workflow:
1) load the file from folders, and import the images using bfmatlab package
2) use the function analyzeROIsAndCellsFromData to analyze the image
3) use the mouse to define subregions to analyze from a large image
4) all the detail parameters are located in the function Cell_Count, and may need to be adjusted based on different needs, the current setting is optimized for the c-fos cell count from the image with 10x objects.

If you have any question, contact me at superdongping@gmail.com or pingdong@unc.edu
