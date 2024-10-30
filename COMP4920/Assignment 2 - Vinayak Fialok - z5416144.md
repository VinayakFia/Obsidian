> [!info] Question
> How might fairness, accountability, and transparency be achieved collectively by an automated decision - that is - by a decision outputted by an AI? In your answer, compare and contrast a causal account of explanation with at least one other account of explanation. Make explicit reference to the reading (and references therein) for Thursday of Week 4.

## Possible Thesis

1. Why are we worried about accountability, fairness and transparency
	1. Intentions/ decisions are based upon beliefs/desires
	2. Accountability, fairness and transparency are properties upon a decision
	3. A decision is accountable if it is explicable
	4. Decisions may be explained through an agen't beliefs and desires
	5. A decision is fair if its explination is nomatively salient
	6. Normative salience is a property on an explanation or reason that identifies that a decision aligns with ethical standards
	7. a decision is transparent if its explanation is reportable and accessible.
	8. Humans are partial to causal explanation
	9. Human decision making is accepted by its accountability, fairness and transparency
2. ADM
	1. What is ADM
	2. What makes a decision fair, accountable and transparent
	3. ADM through causal does not work
		1. COMPAS recidivism
		2. LLM detection
		3. Specifically discus the shortcomings

> [!danger] TODO: MAKE CLEAR SENTENCES THAT ARE IN BOLD FOR EACH PARA

## 2.1. Accountability, Fairness, and Transparency
Accountability, fairness and transparency are properties of a decision. Firstly, let's define what these properties mean.

Borrowing from Grayson, we identify that accountability requires reasons. That is, an accountable decision is one that is reasonable. Reasonableness is a function of normatively rational salience (Grayson 2024 p5). For a reason to be normatively salient, a reason must be considered grounded in norms or morally "right" or "fair" within a given context. So we derive our property of fairness as possessing reasons that are considered morally salient. A decisions reasonableness also requires reportability, that is the reasons for a decision must also be understandable and accessible to its stakeholders. So we have our last derived property of transparency which refers to the reportability of our decision. Lets finally define that a decision that collectively achieves fairness, accountability and transparency is acceptable.

The question of *How might fairness, accountability, and transparency be achieved collectively by an automated decision* may then be phrased as "How might an automated decision provide reasons that are ethical in a transparent manner". To understand the notion of reasoning, lets explore how Grayson argues human decisions are reasonable and transparent.

### 2.2. Human Decision Making
// TODO: intro para
To discuss how AI may make acceptable decisions, lets first understand how humans may do so. Through the belief-desire-intention model and counterfactual causal reasoning, humans are capable of making decisions that are fair and transparent, and as such accountable and acceptable.

Grayson explore human decision making through the a model mirroring the belief-desire-intention (BDI) agent model developed by Michael Bratman. Beliefs are the set of true statements understood by the agent, such as "there is coffee in the fridge". Desires are an agent's goals, preferences and values, such as "I feel groggy and tired". Beliefs and desires are independent of each other. An intention is a plan, scheme or strategy formed in pursuit of an agent's desires, and based upon an agent's beliefs. The coexistence of the aforementioned belief and desire, and the lack of opposing desires such as "I want to stay in bed", would culminate in the intention of "I will go to the kitchen and drink coffee". This line of reasoning naturally aligns itself with causal reasoning. More specifically Grayson discusses counterfactual causal reasoning, which for the above situation would be phrased as "if I had not believed coffee lie in the fridge and I did not feel tired, then I would not have gone to get coffee". By explaining a decision through beliefs and desires, a human can be transparent about a decision. Following, beliefs and desires that are normatively salient makes a decision fair.

### 2.3.0. COMPAS recidivism prediction
COMPAS (Correctional Offender Management Profiling and Alternative Sanctions) is an algorithm that predicts recidivism of convicted criminals. COMPAS aims to be used to assist judges in deciding the sentence of a convicted criminal. COMPAS uses at least 15 factors with multiple items (Center for Criminology and Public Policy Research 2010, p10) as of 2010, which has undoubtedly increased in the last decade. 

### 2.3.1. Reasoning to Explanation
For an AI decision to be transparent, it must have minimal required translation between its reasoning and explanation.

Reasoning is the process in which a human or machine come to a decision. An explanation is the conveying of our reasoning to others. We can think of the process of conveying reasoning as translation from logic into language. For human decision making, there is little required translation. This is because the justification of a decision, that is the beliefs and desires of an agent are intuitively explicable through language.

Lets borrow the AI machine from Grayson's recidivism example. Our judge has sentenced the defendant to 6 years with no parole through recommendation of our COMPAS AI agent. Our defendant then asks for an explanation, "why has it been decided that I am given such a long punishment without parole?". The COMPAS creators know that it is not feasible to explain COMPAS's algorithm because it is too complex (and it is proprietary). The COMPAS creators decide to translate their reasoning, that is their algorithm, into an explanation through the means of a large language model or some new algorithm.

**A translation algorithm that is able to turn complex reasoning into digestible explanation requires that the resulting explanation is not faithful, or the algorithm itself can be simplified enough to be explicable.** Let's consider the former, where the COMPAS system produces the explanation that "you have offended once in the past and your demographic is deemed to be more likely to re-offend in the upcoming years". However, the defendant may then ask "how can I trust that this translation is true to the vastly complex COMPAS algorithm?". We will discuss the latter simplification case in a later section.

**Since significant translation from reasoning to explanation is in of itself opaque, we AI decisions must be utilise reasoning that is explicable, whilst also retaining accuracy to roaming morally salient.** Next, we will explore how this may be possible, and explore the nature of explanation whether causal or otherwise.

### 3.1 Ways of explanation
Grayson discusses 4 models of explanation: the deductive-nomological model, the statistical model, the pragmatic model, and the causal model. Grayson primarily expounds on the causal model as "it (has) the most natural fit" (Grayson 2024, p4).

To explain some event or state $x$ through causal explanation is to specify the causes of $x$. This may be 

### 4.1 Explicable simplification of COMPAS
As mentioned earlier, one approach to making COMPAS explicable is to simplify its reasoning. An attempt of this was made by a research team from Berkely using the reasoning of "rule-lists" which are predictive models composed of if-then statements (Angelino et al 2018). Reasoning through rule lists is transparent because the reasoning for a decision is easily explicable through causal explanation. Let's see an example rule list below:

```python
if (age = 18 − 20) and (sex = male) then predict yes
else if (age = 21 − 23) and (priors = 2 − 3) then predict yes
else if (priors > 3) then predict yes
else predict no
```

If our criminal from our aforementioned case was aged 19 and male we could explain causally to him that "because you are 19 and male, we have decided that you will re-offend".

### 2.2 Accountability
Borrowing from Grayson, we identify that accountability requires reasons (Grayson 2024 p5). It is because a decision may be explained that it is accountable.


Center for Criminology and Public Policy Research 2010, VALIDATION OF THE COMPAS RISK ASSESSMENT CLASSIFICATION INSTRUMENT, accessed 29th October 2024, \<https://criminology.fsu.edu/sites/g/files/upcbnu3076/files/2021-03/Validation-of-the-COMPAS-Risk-Assessment-Classification-Instrument.pdf>

Angelino et al, 2018, Learning Certifiably Optimal Rule Lists for Categorical Data, accessed 30th October 2024, <https://arxiv.org/pdf/1704.01701>

Carl G.H 1962, Deductive-Nomological vs. Statistical Explanation, accessed 30th October 2024, <https://conservancy.umn.edu/items/b8ce3527-af35-44a0-be95-013a66d7af79>