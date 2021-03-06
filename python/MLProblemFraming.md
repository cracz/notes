# ML Problem Framing
---

### Common ML Problems

* __Supervised Learning__: The model is provided with labeled training data. The labels are the correct classification of each entry that we know or want to know. Analogy would be particle identification with Monte Carlo vs real data. In MC we know the exact species (or __labels__) of the particles, but with real data we only have the observables to use for identification.

* __Training__: The gradual process of an algorithm determining the relationship between the features and labels of a dataset. The established relationship after training is the __model__.

* __Unsupervised Learning__: The dataset is unlabeled and the machine must infer its own rules for categorizing data based on the features. One example would be __clustering__ where the data is split into a number of different clusters, establishes common characteristics within each cluster, and tries to determine which cluster a new entry would full under. This can sometimes introduce __bias__ when unwanted patterns are found.

* __Reinforcement Learning__: This doesn't involve example data with labels. The model (or __agent__ here) is made to perform a task and it will recieve a __reward function__ only when that task is successfully completed. The agent learns through trial and error how to perform that task and earn the reward. However this type involves building the means for the agent to interact with the task, whether physical or virtual.

* __Examples of Supervised and Unsupervised ML__:
	* Classification: Pick one of N labels
	* Regression: Predict numerical values
	* Clustering: Group similar examples
	* Association rule learning: Infer likely association patterns in data
	* Structured output: Create complex output
	* Ranking: Identify position on a scale or status



