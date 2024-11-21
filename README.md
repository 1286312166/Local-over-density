This is the implementation of identifying and processing local over-densities.

Directore Struture
Parameter Calculation：It includes the code for calculating self-sparsity, mutual sparsity, and small-distance variability, as well as for identifying and processing local over-densities and generating synthetic data models.
Examples：Provides a careful set of exampels that are known to work.
README： Explains how to compile and run the code.

Program language
matlab



The following is a detailed description of each file.



In the "code" folder:

In the "Parameter Calculation" subfolder:

self_sparsity_all.m——calculate self-sparsity (use all points)

self_sparsity_neighbor.m——calculate self-sparsity (use neighbor points)

mutual_sparsity.m——calculate mutual sparsity

small_distance_variability.m——calculate small-distance variability

Sparsity_variability_all.m——calculate self-sparsity, mutual sprasity and small-distance variability (for self-sparsity, all points are used)

Sparsity_variability_neighbor.m——calculate self-sparsity, mutual sprasity and small-distance variability (for self-sparsity, neighbor points are used)

extract_output.m——extract small values of self-sparsity and mutual sparsity and extract anomalously high values of small-distance variability



In the "theoretical data" subfolder：

uniform_theoretical_data.m——2D uniform mesh synthetic data (without noise)

theoretical_data.m——synthetic data generation (without noise)

add_dense_points.m——add dense points to existing data

add_nosiy.m——add nosiy to existing data




In the "examples" folder:

"xx-data"——spatial dataset

"xx-MSsp-Var"——calculate self-sparsity, mutual sprasity and small-distance variability

"xx-mutual-sp"——only calculate mutual sprasity

"xx-mutual-self-sp"——only calculate self-sparsity and mutual sprasity

In the "relative errors" subfolder: relative error results are stored

