physician <- read.csv("Physician_Compare_2017_Group_Public_Reporting_-_Overall_MIPS_Performance.csv", header=TRUE)
library(healthcareai)
str(physician)
head(physician)
summary(physician)
names(physician)


#Easy machine learning
quick_models <- machine_learn(physician, Organization.legal.name,Organization.PAC.ID,
                              Sources.of.scores,outcome = Final.MIPS.Score)

quick_models
predictions <- predict(quick_models)
predictions
plot(predictions)

quick_models %>% 
  predict(outcome_groups = 2) %>% 
  plot()

#DATA PROFILING
missingness(physician) %>% 
  plot()

#DATA PREPARATION
split_data <- split_train_test(d = physician,
                               outcome = Final.MIPS.Score,
                               p = .9,
                               seed = 84105)


prepped_training_data <- prep_data(split_data$train,Organization.legal.name,Organization.PAC.ID,
                                   Sources.of.scores, outcome = Final.MIPS.Score,
                                   center = TRUE, scale = TRUE,
                                   collapse_rare_factors = FALSE)
#Model Training
models <- tune_models(d = prepped_training_data,
                      outcome = Final.MIPS.Score,
                      tune_depth = 25,
                      metric = "RMSE")

evaluate(models, all_models = TRUE)

models["Random Forest"] %>% 
  plot()

#Faster Model Training
untuned_rf <- flash_models(d = prepped_training_data,
                           outcome = Final.MIPS.Score,
                           models = "RF",
                           metric = "RMSE")
#Model Interpretation
interpret(models) %>% 
  plot()


#Variable Importance
get_variable_importance(models) %>%
  plot()

#EXPLORE

explore(models) %>% 
  plot()

#Prediction
predict(models)

test_predictions <- 
  predict(models, 
          split_data$test, 
          risk_groups = c(low = 30, moderate = 40, high = 20, extreme = 10)
  )
plot(test_predictions)