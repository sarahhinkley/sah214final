# Hurricane effects on stream chemistry

# Purpose
Recreate Figure 3 from Schaefer et al. (2000) (shown below) which investigates the concentrations of five different nutrients at four different watersheds. The five different nutrients are (a) Potassium (K), (b) Nitrate-N (NO3-N), (c) Magnesium (Mg), (d) Calcium (Ca), (e) Ammonium-N (NH4-N). The four different watersheds are Puente Roto Mameyes (RMP), Bisley Quebradas 1, 2 and 3 (BQ1, BQ2 and BQ3). 
<center>
![](paper/figure3_frompaper.png)
</center>

# Description of repository components

* **`data/`** - Raw data for each watershed from McDowell and International Institute Of Tropical Forestry (IITF) (2024).
* **`scratch/`** - Contains our "spagetti". This allows us to develop our conceptual understanding of what our workflow should look like. 
* **`output/`** - Contains the .csv for the cleaned data.
* **`docs/`** - Contains html file for creating website in GitHub Pages. 
* **`R/`** - Contains `moving_average()`, a self-defined function used in the code.
* **`paper/`** - Contains image(s) used in the README and paper.qmd. As well as, organized output of the project details. 

# Author and Contributors
### Author
Sarah Hinkley - https://github.com/sarahhinkley

### Contributors
* Jacob Sloan - https://github.com/sacobjloan 
* Monique Hernandez- https://github.com/moniqueallyson 


# References
McDowell, William H., and USDA Forest Service. International Institute Of Tropical Forestry (IITF). 2024. “Chemistry of Stream Water from the Luquillo Mountains.” Environmental Data Initiative. https://doi.org/10.6073/PASTA/F31349BEBDC304F758718F4798D25458.

Schaefer, Douglas. A., William H. McDowell, Fredrick N. Scatena, and Clyde E. Asbury. 2000. “Effects of Hurricane Disturbance on Stream Water Concentrations and Fluxes in Eight Tropical Forest Watersheds of the Luquillo Experimental Forest, Puerto Rico.” Journal of Tropical Ecology 16 (2): 189–207. https://doi.org/10.1017/s0266467400001358.

