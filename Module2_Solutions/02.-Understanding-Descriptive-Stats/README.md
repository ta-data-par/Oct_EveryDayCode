![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

# Lab | Understanding descriptive stats
This lab is meant to guide you to understand a better the basic statistics. Also you will learn how to use some useful methods. 
* Some of the questions are not about code and you will need to provide some analysis so please give your answers with markdown cells. 
* Do all the challenges in the same notebook. 

## Challenge 1
* Do a function to simulate a rolling dice 10 times and save the information in a dataframe.
* Plot the values sorted by value.
* Calculate the frequency distribution and plot it. What is the relation between this plot and the other one? Describe it with words.

## Challenge 2
With the results of your dice of the challenge 1, define some functions to calculate the mean in two ways:
* Summing all the observations separately (no method allowed!)
* Calculate first the frequency distribution and then the mean with the values of the distribution (no other methods allowed!)
* Define a function to calculate the median. No method allowed!
*Hint: depending on the number of observations you need to define two cases.
* Using your last function, use it to define a function that will calculate the four quartiles.


## Challenge 3
Read the csv `roll_the_dice_hundred.csv`
* Plot the values sorted. What do you see?
* With the functions you defined in the challenge 2, calculate the mean of the rollings.
* Calculate the frequency distribution.
* Plot the histogram as we did during the lesson. What do you see? (shape, values...) how could you connect the value of the mean to the plot you see? 
* Now read the `roll_the_dice_thousand.csv` and plot the frequency distribution in the same way you did it before.
What has changed? Why do you think it is changing?

## Challenge 4
In the `ages_population` files, we will find some information about a poll we did to a thousand people. Each file corresponds to a different neighbourhood.
 
Read the csv `ages_population.csv`. Here you have a poll we did to people from here in Barcelona about their ages. You will find each observation in the csv.
* Calculate the frequency distribution and plot it as we did during the lesson. Define a range for the mean and std with the eye.
* Calculate the mean and the standard deviation and compare it with your range. Does it fit?
* Now read the csv `ages_population2.csv` and calculate the frequency distribution and plot it.
* What do you see? Is there any difference?
* Calculate the mean and std and compare with the last one. What do you think?

## Challenge 5
Now is the turn of `ages_population3.csv`.
* Calculate the frequency distribution and plot it as we did during the lesson. 
* Calculate the mean and std and compare with the plot. What is happening?
* Calculate the four quartiles and give some arguments for the last question using them. How much difference there is between median and mean?
* Calculate some other percentiles that can be useful to give more arguments. 

## Bonus challenge
Take the information about the 3 neighbourhoods and compare them. Prepare a report about the three of them, about their similarities and their differences basing your arguments in the basic statistics.

