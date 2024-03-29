# Machine Learning from Coursera by Andrew Ng

---

## Octave
 
 Useful for prototyping ML projects because it has ways to easily implement ML algorithms with builtin functions.

--
 
Examples of Machine Learning:

* Database mining (Web click data, medical records, biology, engineering)
* Applications that can't be programmed by hand (Autonomous helicopter, handwriting recognition, most of Natural Language Processing (NLP), computer vision.
* Self-customizing programs (Amazon, Netflix product recommendations)

## Machine Learning Algorithms
 
### Supervised Learning
 
* The "correct answers" are given for the algorithm to learn from; A.K.A. the "training set".
* Usually useful for __Regression__: Predicting a continuous valued output.
* __Classification__ problems: predicting a discrete valued output, like 0 or 1 (no or yes), specific categories, etc.
* Notation for this course: __m__ = number of training examples, __x__ = input variable (features), __y__ = output variable (target variable), __(x,y)__ = single training example.
 
 
### Unsupervised Learning
 
* The "correct answers" are not given and the algorithm has to learn some structure in the data.
* A common thing for the algorithms to do is to __cluster__ the data into separate groups. (i.e. Google News, human genes, organizing computing clusters, social network analysis, market segmentation, astronomical data analysis).
 
 
### Univariate Linear Regression
 
* One variable, model __h(x) = a1 + a2*x__ is a straight line mapping __x__ to __y__ after fitting to the __m__ training examples.
* Fitting process:
 * Find __a1__ and __a2__ in __h(x) = a1 + a2*x__ such that we minimize the __cost function__ __J(a1,a2)__: 1/(2m) * the summation of (h(x)-y)^2 over all __m__. Also called the __squared error function__.

 
 ### Gradient Descent

* Basic idea is to start with some __a1__, __a2__ and keep changing them to reduce __J(a1,a2)__ until we end up at a minimum.
* This can be applied for any number of variables __a1,...,an__.
* For each variable __aj__, repeatedly update __aj__ with __aj__ minus __dJ/daj__ * the __learning rate__ (usually alpha). Look up the gradient descent equation to see it.
* You must simultaneously update all __aj__; don't do it one at a time because each update will affect the derivative for the other variables.


### Multivariate Linear Regression

* 