
# Patterns in freshwater diatom ecology - exploring ecological optima at the family level

### Kevin Thirouin

<hr>

## Introduction

Diatoms are a highly diverse (>75,000 described taxa; Kociolek 2018) lineage of photosynthetic, unicellular eukaryotic algae. They are found in virtually all aquatic environments worldwide, including marine, fresh, and brackish waters, as well as soils. Diatoms form simple to ornate glass (SiO2) cell walls and produce a highly nutritious lipid photosynthetic product.

Freshwater diatom diversity is of particular interest because of their use as water quality indicators (Keck 2015). Certain diatom species can be associated with either polluted or pristine waters. The presence or absence of a particular taxon can be invaluable for understanding the conditions of a water source.

I am interested in exploring and comparing family-level ranges of ecological optima for freshwater diatoms. This may be informative in estimating optimum conditions in which to grow newly discovered/described taxa, and ultimately determining whether suprageneric identification could be used more readily in estimating environmental conditions in freshwater systems.

<hr>

## Summary

### Goals of Keck et al (2015):

Keck et al added ecological data onto a molecular phylogeny to determine whether there is phylogenetic signal in ecological optima for freshwater diatom species. The overall goal in this study was to determine if phylogenetic signal could be found in these data to reduce the need for highly specialized teams of diatomists to identify diatoms at the species level in biomonitoring surveys, and instead use ecological criteria and possibly higher level (and therefore more efficient) taxonomic classifications to make water management decisions.

### Brief description of methodology that produced the data

The Keck et al ecological optima dataset was collected over a period of 7 years (2001 to 2008) through the Réseau de Contrôle de Surveillance (RCS) program in France. The authors used the RCS database to obtain 2119 data points linking diatom relative species abundance with environmental parameters (physical and chemical water conditions). The authors further subset those data by calculating optimum parameter values, for species occurring in at least 10 different samples, using the weighted average method (Ter Braak and Looman 1986).

### Type of data in this data set:  

This dataset includes ecological optima data (19 ecological variables, all numeric, all used in determining water quality) for 117 diatom taxa. 

#### Format of data

Column 1 is a list of taxa included in the study, followed by 19 columns of different ecological optima variables (all numeric).

#### Size of data (i.e., megabytes, lines, etc.)

This dataset is 117 lines, and 20 columns.

#### Any inconsistencies in the data files?  Anything that looks problematic?

Nothing looks problematic in this dataset, no NAs or other issues are apparent.

#### What the data represent about the biology?

These data represent the optimum ecological parameters for 117 different species of freshwater diatoms.

<hr>

## Detailed Description of Analysis to be Done and Challenges Involved

The steps you propose here should have an obvious correspondence to the driving question(s) you listed above.

### Data Re-structuring and Additions
This project will involve editing the species column of the dataset to replace spaces with underscores for ease of use in R; the addition of a "family" column will also be necessary to be able to distinguish which binomials fit into a particular taxonomic family. This will be done by cross-referencing the genera with those found on [DiatomBase](diatombase.org) and assigning them to the appropriate, accepted family in a new column in the dataset.

### Steps
The data will be subset to the ecological optima variables of interest (6 of the 19), and the range and average of each optimum will be identified for each diatom family. The chosen subset of ecological optima will be compared across genus/species binomials as well as families, and visualized. Statistical analyses will be run to determine if significant differences in different optima are found between taxonomic groups.


<hr>

## References 

Keck, F., Rimet, F., Franc, A. and Bouchez, A. (2016), Phylogenetic signal in diatom ecology: perspectives for aquatic ecosystems biomonitoring. Ecol Appl, 26: 861-872. [doi:10.1890/14-1966](https://esajournals.onlinelibrary.wiley.com/doi/abs/10.1890/14-1966)

Keck, François; Rimet, Frédéric; Franc, Alain; Bouchez, Agnès (2015), Data from: Phylogenetic signal in diatom ecology: perspectives for aquatic ecosystems biomonitoring, Dataset, https://doi.org/10.5061/dryad.0db3f

KOCIOLEK J.P., BALASUBRAMANIAN K., BLANCO S., COSTE M., ECTOR L., LIU Y., KULIKOVSKIY M., LUNDHOLM N., LUDWIG T., POTAPOVA M., RIMET F., SABBE K., SALA S., SAR E., TAYLOR J., VAN DE VIJVER B., WETZEL C.E., WILLIAMS D.M., WITKOWSKI A. & WITKOWSKI J. 2018. DiatomBase. Available from: [http://www.diatombase.org](http://www.diatombase.org)


> Written with [StackEdit](https://stackedit.io/).
