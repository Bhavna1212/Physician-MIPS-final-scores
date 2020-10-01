# Physician-MIPS-final-scores
Healthcare assignment -Project is on the Merit-Based Incentive Payment System (MIPS) final scores and performance 

This file contains Merit-Based Incentive Payment System (MIPS) final scores and performance category scores for clinicians.
Use of healthcareai R package.

The variables in the data set are
1.	Organization legal name	
2.	Organization PAC ID	
3.	Sources of scores	
4.	Quality Category Score	
5.	ACI Category Score	
6.	IA Category Score	
7.	Final MIPS Score

The split_train_test function ensures the test dataset has proportionally similar characteristics to the training dataset. By default, 80% of observations are used for training; that proportion can be adjusted with the p parameter. The seed parameter controls randomness so that you can get the same split every time you run the code if you want strict reproducibility.

For  Model Training: Here you can tune all three available models: random forests (“RF”), regularized regression (i.e. lasso and ridge, “GLM”), and gradient-boosted decision trees (i.e. XGBoost, “XGB”). Increasing tune_depth from its default value of 10 will tune the models over more combinations of hyperparameter values in the search for the best model.

We have selected “RMSE” as our model metric. Options for regression: "RMSE" (default) (root-mean-squared error, default), "MAE" (mean-absolute error), or "R squared." Options for multiclass: "Accuracy" (default) or "Kappa" (accuracy, adjusted for class imbalance).

Faster Model Training : Flash_models uses fixed sets of hyperparameter values to train the models, so you still get a model customized to your data, but without burning the electricity and time to precisely optimize all the details.

we have used the healthcare package “healthcareai” .
uses of functions “machine_learn” , prep_data, tune_model, fash_model.
The machine_learn function automatically trained regression algorithms because the outcome variable Final MIPS Score is continuous in the dataset, and has executed cross validation for three machine learning models: random forests, XGBoost, and regularized regression.
We need to set the metric to Options for regression: "RMSE" (default) (root-mean-squared error, default), "MAE" (mean-absolute error), or "R squared." Options for multiclass: "Accuracy" (default) or "Kappa" (accuracy, adjusted for class imbalance).
The best regression model is random Forest having  RMSE = 3.8, MAE = 1.6,  Rsquared = 0.99.
For precise control tune_models and flash_models are the model-training function. Flash_model() function is for speed . It uses fixed sets of hyperparameter values to train the models, so you still get a model customized to your data, but without burning the electricity and time to precisely optimize all the details.
For our model has interpreted that , low value of ACI Category Score signifies that people with less ACI Category Score are less likely to have more Final MIPS Score. Similarly, Quality Category Score is associated with increased Final MIPS Score after accounting for other variables.
