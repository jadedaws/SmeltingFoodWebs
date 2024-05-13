# SmeltingFoodWebs

<b> Stable isotope analysis provides novel insights for measuring lake ecosystem recovery following acidification</b> :factory: :fish: <br>

<b> J.C. Dawson, M.M. Guzzo, J.M. Gunn, E.J.S. Emilson, K.S. McCann, and B.A. Edwards </b>

Pre-print available <a href="https://cdnsciencepub.com/doi/pdf/10.1139/cjfas-2023-0305">here</a>.


## Abstract

Unstable and simplified freshwater food webs impair the resilience of Canadian fisheries facing environmental stressors. This study utilizes stable isotope analyses to assess trophic recovery to explore food web resiliency in lakes historically impacted by metal mining in Sudbury, Ontario. Carbon (δ 13C) and nitrogen (δ 15N) stable isotope ratios were quantified in yellow perch (<i>Perca flavescens</i>), smallmouth bass (<i>Micropterus dolomieu</i>), and baseline organisms to develop quantitative population metrics and describe dietary niche partitioning. The most severely damaged lake with a barren watershed had the lowest trophic positioning, smallest body size and niche area, and greatest niche overlap among fish species. Semi-barren and forested watershed lakes were more similar to reference lakes in isotopic metrics; however, elevated niche overlap and reduced trophic positioning suggests recovery in these lakes is ongoing. We found that including stable isotope analyses in lake recovery studies provided critical insights not captured by traditional biomonitoring approaches.


## File overview

<b>Data</b>

- `2019-CRADL_BB-DY-NL-WORKING.csv` - File containing the BsM catch and size data for the study lakes (barren, semi-barren, and forested watershed)
- `CRADL_catch_data_2019-WORKING.csv` - File containing the BsM protocol catch information metadata for Sudbury BsM lakes (Study Lakes, NE, and SW BsM) 
- `Dawson-Isotopes-2024Feb06.csv` - File containing the raw C and N isotope values for the reference lakes (Reference Lake 1 through 5)
- `Dawson-Isotopes-StudyLakes.csv` - File containing the raw C and N isotope values for the study lakes (barren, semi-barren, and forested watershed)
- `big-siberdat.csv` - File containing isotopic data for study and reference lakes formatted for use in SIBER R package
- `ellipse-data_Mar04.csv` - File containing isotopic data used for calculating niche ellipse extents
- `seab_results.csv` - File containing the raw Bayesian standard ellipse area results

<b>Scripts</b>
- `Regional-Context_BsM.Rmd` - R Markdown file containing the script used to calculate Sudbury regional lake comparisons (CPUE, fish size)
- `SIBER-Niche.Rmd` - R Markdown file containing the script used to calculate isotopic niche metrics using SIBER package
- `StudyLakes_Calculations-Figures.Rmd` - R Markdown file containing the script used to pre-process data, calculate trophic position, proportion littoral, and condition indices, and create all figures (except for map [Fig. 1]) 
- `calculate_ellipse_extents.R` - R script used to calculate the standard ellipse areas


## Contributors

In order on manuscript author list:

- Jade C. Dawson - `@jadedaws`
- Matthew M. Guzzo - `@mattguzzo12`
- John M. Gunn
- Erik J.S. Emilson -  `@ErikEmilson`
- Kevin S. McCann
- Brie A. Edwards

