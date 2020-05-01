
# Patterns in freshwater diatom ecology - exploring ecological optima at the family level

#### Kevin Thirouin

<hr>

### 1) How do optimum ecological conditions compare across freshwater diatom families?

### 2) Are family-level differences in optimum conditions significant? Is family identification sufficient to determine general aquatic conditions?

## Introduction

Diatoms are a highly diverse (>75,000 described taxa; Kociolek 2018) lineage of unicellular, photosynthetic eukaryotic algae. They are found in virtually all aquatic environments worldwide, including marine, fresh, and brackish waters, as well as soils (Mann 1999). Diatoms form glass (SiO~2~) cell walls, and produce a highly nutritious lipid photosynthetic product, the latter making them an important and preferred food source for aquatic grazers (Kociolek 2018).

Freshwater diatom diversity is of particular interest because of their use as water quality indicators (Keck 2015). Certain diatom species can be associated with either polluted or pristine waters. The presence or absence of a particular taxon can be invaluable for understanding the conditions of a water source.

This study compares a selection of pre-calculated ecological optima for freshwater diatom families that are considered important bioindicators. These preliminary results could prove useful in developing methods of estimating optimum conditions in which to grow newly discovered/described diatom taxa, and ultimately in determining whether suprageneric identification could be used more readily in estimating environmental conditions in freshwater systems.
<hr>

## Methods

#### _Data source:_

Data used in this study are originally from:
**Keck, F., Rimet, F., Franc, A. and Bouchez, A. (2016), Phylogenetic signal in diatom ecology: perspectives for aquatic ecosystems biomonitoring. Ecol Appl, 26: 861-872. doi:[10.1890/14-1966](https://doi.org/10.1890/14-1966)**

The dataset information used in the above publication:
**Keck, François; Rimet, Frédéric; Franc, Alain; Bouchez, Agnès (2015), Data from: Phylogenetic signal in diatom ecology: perspectives for aquatic ecosystems biomonitoring, Dataset,
https://doi.org/10.5061/dryad.0db3f**


_**Data description and context**_

The original dataset used by Keck et al [(2015)](doi:[10.1890/14-1966](https://doi.org/10.1890/14-1966)) was obtained from the Réseau de Contrôle de Surveillance (RCS), a program in France that functions in similar ways to the United States' National Ecological Observatory Network (NEON). Determining specific RCS protocols on how these data were obtained was difficult due to a language barrier on their [website](https://www.hauts-de-france.developpement-durable.gouv.fr/?RCS-Reseau-de-Controle-de-Surveillance](https://www.hauts-de-france.developpement-durable.gouv.fr/?RCS-Reseau-de-Controle-de-Surveillance)) and that portions of that website were undergoing maintenance at the time of this analysis. The raw RCS data were collected between 2001 and 2008. These data consisted of environmental parameters paired with diatom abundance counts. Keck et al further subset these data into a form that was suitable for phylogenetic analysis, to be accompanied by diatom gene sequence data. The environmental parameter and diatom abundance data were each log-transformed, and ecological optimum values for each taxon was calculated using the weighted-average method (Ter Braak and Looman 1986). These optimum values were combined with gene sequence data to determine if phylogenetic signal exists in diatom ecology. The overall goal of the study was to determine if phylogenetic signal could be found in these data to reduce the need for highly specialized teams of diatomists to identify diatoms at the species level in biomonitoring surveys, and instead use ecological criteria and possibly higher level (and therefore more efficient) taxonomic classifications to make water management decisions.

_**The present analysis**_

Additional data were collected and combined with the above dateset for this analysis, including the addition of a column for family-level taxon identification. These data were obtained from [DiatomBase](diatombase.org), where each genus from the Keck et al dataset was queried and the family name recorded in a [.csv file](https://github.com/kevinthirouin/CompBioLabsAndHomework/blob/master/IndProject/families_genera_filled.csv). This file was imported into R (version 3.6.3) using RStudio (version 1.2.5033), along with the original Keck et al [ecological optima file](https://github.com/kevinthirouin/CompBioLabsAndHomework/blob/master/IndProject/Data_Ecol_Optima_original.csv). Six of the original 19 ecological optima parameters were selected for this analysis, and mean optima values were taken for each diatom genus, and family in the dataset. Plots of each selected ecological optimum by diatom family were produced using ggplot2 from the [tidyverse]((https://www.tidyverse.org/)). These six plots have been combined for ease of visualization using the cowplot package. They can be found [here](https://github.com/kevinthirouin/CompBioLabsAndHomework/blob/master/IndProject/EcoOptPanelPlot.png).

It should be noted that the dataset originally produced by Keck et al [2015](doi:[10.1890/14-1966]) included log-transformed data and subsequent weighted average -- this means that the plots produced are scaled differently than would have been most informative. Back-transforming the data was impossible due to the lack of data provided to undo the weighted average (Keck et al did not provide species abundance data, which is a critical piece of the weighted average equation).

To attempt a statistical analysis that was not riddled with bias or independence errors (to the best of my ability), I further subset the imported data to include only those diatom families which were represented by more than five taxa in the dataset. From that output, a random sample of five taxa from each family was taken, resulting ultimately in a dataframe of five families, each represented by five unique taxa. A one-way ANOVA was run on this new dataframe for each ecological optimum variable. Additionally, a one-way ANOVA was also run for each genus in the same dataset.

Additional plots were developed, the parameters chosen based on the output of the one-way ANOVA. The first [plot](https://github.com/kevinthirouin/CompBioLabsAndHomework/blob/master/IndProject/GenusLevellogNH4.png) shows the optimum levels of NH4 for each genus represented, with each genus colored by family. A [boxplot](https://github.com/kevinthirouin/CompBioLabsAndHomework/blob/master/IndProject/FamilyLevellogNO3_boxplot.png) was produced showing the relationships of the reduced family-level taxon sampling and NO3 values. Finally, an additional [boxplot](https://github.com/kevinthirouin/CompBioLabsAndHomework/blob/master/IndProject/extra_logpH_boxplot.png) was developed as a piece for further discussion (see results and conclusion, below).

## Results and conclusions
Comparing differences in ecological optima as intended proved to be difficult with this dataset, primarily due to the lack of even taxon sampling at the family-level. However, by utilizing various data manipulation techniques and subsetting the data further to even out the taxa, some of the ANOVAs that were run reported significant differences among families for certain ecological parameters. Those that reported some significant differences include the NO3 optimum values for the five best-represented families, (based on a random sample of five representatives from each family), and the NH4 optima for a genus-level analysis for the same five families. NO3 and NH4 are important in aquatic nitrogen cycling, and important indicators for water quality (particularly pollution by fertilizers and wastewater inputs, (Laws et al 1994; Stevenson & Smol 2015).

Because the main results of this analysis are based largely on a reduced number of taxa from the initial dataset, drawing major conclusions is difficult. However, these data suggest that with more robust sampling across all represented diatom families may lead to a better understanding of which taxa are good indicators of a particular aquatic environment. The implications of this range from freshwater biomonitoring _in situ_ to developing adequate diatom culture media for laboratory analysis with different taxa.

### Additional discussion and parting thoughts

A final piece to discuss stems from the plot below:
![image](https://github.com/kevinthirouin/CompBioLabsAndHomework/blob/master/IndProject/extra_logpH_boxplot.png)

This is a boxplot of log pH by genus before subsetting the data to more highly represented families. The interesting takeaway from this plot is that outliers present in several families happen to be in families that have recently undergone a great deal of taxonomic upheaval and are likely nonmonophyletic taxa. For instance, The family Cymbellaceae has been reevaluated several times in the last century, and taxa continue to be described based on 19th and early 20th century floras from distant regions (Kociolek 2018). Taxonomic handling continues to be inconsistent even at the family level (da Silva 2016). Similar taxonomic problems have been rampant in large diatom families such as the Naviculaceae (Beszteri et al 2001).
With further analyses such as this one, and the original investigation by Keck et al (2015), perhaps more attention to ecological conditions will help to solve difficult phylogenetic puzzles. This would help us not only use these taxa to understand our freshwater systems, but also shed some light on evolutionary relationships that have eluded us for so long.  




## References 

Keck, F., Rimet, F., Franc, A. and Bouchez, A. (2016), Phylogenetic signal in diatom ecology: perspectives for aquatic ecosystems biomonitoring. Ecol Appl, 26: 861-872. [doi:10.1890/14-1966](https://esajournals.onlinelibrary.wiley.com/doi/abs/10.1890/14-1966)

Keck, François; Rimet, Frédéric; Franc, Alain; Bouchez, Agnès (2015), Data from: Phylogenetic signal in diatom ecology: perspectives for aquatic ecosystems biomonitoring, Dataset, https://doi.org/10.5061/dryad.0db3f

Beszteri, B., Ács, É., Makk, J., Kovács, G., Márialigeti, K., & Kiss, K. T. (2001). Phylogeny of six naviculoid diatoms based on 18S rDNA sequences. _International Journal of Systematic and Evolutionary Microbiology_. https://doi.org/10.1099/00207713-51-4-1581

da Silva, W. J. (2016). Diatom classification: clarifying the authority for the Cymbellaceae. _Diatom Research_. https://doi.org/10.1080/0269249X.2016.1236757

Kociolek, J. P. (2018). A worldwide listing and biogeography of freshwater diatom genera: a phylogenetic perspective. _Diatom Research_, _33_(4), 509–534. https://doi.org/https://doi.org/10.1080/0269249X.2019.1574243

Laws, E. A., Hiraoka, J., Mura, M., Punu, B., Rust, T., Vink, S., & Yamamura, C. (1994). Impact of land runoff on water quality in an Hawaiian estuary. _Marine Environmental Research_. https://doi.org/10.1016/0141-1136(94)90009-4

Mann, D. G. (1999). The species concept in diatoms. _Phycologia_, _38_(6), 437–495. https://doi.org/10.2216/i0031-8884-38-6-437.1

Stevenson, R. J., & Smol, J. P. (2015). _Use of Algae in Ecological Assessments_. _Freshwater Algae of North America: Ecology and Classification_. Elsevier Inc. https://doi.org/10.1016/B978-0-12-385876-4.00021-9

ter Braak, C. J. F., & Looman, C. W. N. (1986). Weighted averaging, logistic regression and the Gaussian response model. _Vegetatio_. https://doi.org/10.1007/BF00032121



KOCIOLEK J.P., BALASUBRAMANIAN K., BLANCO S., COSTE M., ECTOR L., LIU Y., KULIKOVSKIY M., LUNDHOLM N., LUDWIG T., POTAPOVA M., RIMET F., SABBE K., SALA S., SAR E., TAYLOR J., VAN DE VIJVER B., WETZEL C.E., WILLIAMS D.M., WITKOWSKI A. & WITKOWSKI J. 2018. DiatomBase. Available from: [http://www.diatombase.org](http://www.diatombase.org)


> Written with [StackEdit](https://stackedit.io/).
