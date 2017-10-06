------------
FEEC/Unicamp
------------

Datasets required:
data.mat (containing matriz X and S)
test.mat (containing matriz Xt and St)
These files should be copied to the current directory.

Preprocessing:
Execute the following command:
> gen_k_folds('data',5)

Main program
nn1h_k_folds.m (Neural network with one hidden layer)

After training, you can run analysis.m using
w1k.mat and w2k.mat (best performance for the training dataset)
or using
w1vk.mat and w2vk.mat (best performance for the validation dataset)
[k] here is the fold number.

If you have trained just one neural network model, run [analysis_fold1.m]
instead of [analysis.m].

Please, report any correction and/or code improvement you may
conceive to increment the quality of this toolbox.
