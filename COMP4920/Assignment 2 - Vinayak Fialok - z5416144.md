> [!info] Question
> How might fairness, accountability, and transparency be achieved collectively by an automated decision - that is - by a decision outputted by an AI? In your answer, compare and contrast a causal account of explanation with at least one other account of explanation. Make explicit reference to the reading (and references therein) for Thursday of Week 4.

## Possible Thesis

> [!danger] TODO: MAKE CLEAR SENTENCES THAT ARE IN BOLD FOR EACH PARA

1. What is accountability, fairness and transparency
2. Rephrase the first part of the question as **How might an automated decision provide reasons that are ethical in a transparent manner?**
3. Discuss these in practice through human decision making
4. what is Automated Decision Making (ADM)
5. what is COMPAS
6. Reasoning is not explanation, explanation is rather made from reasoning
7. A complex reasoning is hard to explain, and cannot be translated to a transparent accessible explanation without being non-accessible.
8. We must find reasoning that is easily explicable, not explication that matches reasoning
9. Causal explanation and deductive explanation are effective. Deductive explanation is reasoning in of itself, causal explanation requires support from other methods such as statistical reasoning.
10. We can simplify compas using rule list model
11. Rule lists are an example of reasoning that is easy to translate to both causal and deductive reasoning <- TRANSPARENCY
12. We have discussed a method of reasoning, now lets discuss how reasoning may be normatively salient.
13. We can show that COMPAS with rule lists can be fair
14. what is lethal autonomous weapons
15. show that it is not feasible to sufficiently simplify some situations
16. conclusion/ intro: the ability for an AI decision to be fair is dependant on situation and context, some ADM's may satisfy the triad, but that is certainly not true for most.

## 2.1. Accountability, Fairness, and Transparency
Accountability, fairness and transparency are properties of a decision. Firstly, let's define what these properties mean.

Borrowing from Grayson, we identify that accountability requires reasons. That is, an accountable decision is one that is reasonable. Reasonableness is a function of normatively rational salience (Grayson 2024 p5). For a reason to be normatively salient, a reason must be considered grounded in norms or morally "right" or "fair" within a given context. So we derive our property of fairness as possessing reasons that are considered morally salient. A decisions reasonableness also requires reportability, that is the reasons for a decision must also be understandable and accessible to its stakeholders. So we have our last derived property of transparency which refers to the reportability of our decision. Lets finally define that a decision that collectively achieves fairness, accountability and transparency is acceptable.

The question of *How might fairness, accountability, and transparency be achieved collectively by an automated decision* may then be phrased as "**How might an automated decision provide reasons that are ethical in a transparent manner?**". To understand the notion of reasoning, lets explore how Grayson argues human decisions are reasonable and transparent.

### 2.2. Human Decision Making
// TODO: intro para
To discuss how AI may make acceptable decisions, lets first understand how humans may do so. Through the belief-desire-intention model and counterfactual causal reasoning, humans are capable of making decisions that are fair and transparent, and as such accountable and acceptable.

Grayson explore human decision making through the a model mirroring the belief-desire-intention (BDI) agent model developed by Michael Bratman. Beliefs are the set of true statements understood by some agent, let's say Bob, such as "there is coffee in the fridge". Desires are an agent's goals, preferences and values, such as "Bob feels groggy and tired". Beliefs and desires are independent of each other. An intention is a plan, scheme or strategy formed in pursuit of an agent's desires, and based upon an agent's beliefs. The coexistence of the aforementioned belief and desire, and the lack of opposing desires such as "Bob wants to stay in bed", would culminate in the intention of "Bob will go to the kitchen and drink coffee". This line of reasoning naturally aligns itself with causal reasoning which may be phrased as "if Bob had not believed coffee lie in the fridge and Bob did not feel tired, then Bob would not have gone to get coffee". By explaining a decision through beliefs and desires, a human can be transparent about a decision. Following, beliefs and desires that are normatively salient makes a decision fair.

### 2.3.0. COMPAS recidivism prediction
COMPAS (Correctional Offender Management Profiling and Alternative Sanctions) is an algorithm that predicts recidivism of convicted criminals. COMPAS aims to be used to assist judges in deciding the sentence of a convicted criminal. COMPAS uses at least 15 factors with multiple items (Center for Criminology and Public Policy Research 2010, p10) as of 2010, which has undoubtedly increased in the last decade. 

### 2.3.1. Reasoning to Explanation
For an AI decision to be transparent, it must have minimal required translation between its reasoning and explanation.

Reasoning is the process in which a human or machine come to a decision. An explanation is the conveying of our reasoning to others. We can think of the process of conveying reasoning as translation from logic into language. For human decision making, there is little required translation. This is because the justification of a decision, that is the beliefs and desires of an agent are intuitively explicable through language.

Lets borrow the AI machine from Grayson's recidivism example. Our judge has sentenced the defendant to 6 years with no parole through recommendation of our COMPAS AI agent. Our defendant then asks for an explanation, "why has it been decided that I am given such a long punishment without parole?". The COMPAS creators know that it is not feasible to explain COMPAS's algorithm because it is too complex (and it is proprietary). The COMPAS creators decide to translate their reasoning, that is their algorithm, into an explanation through the means of a large language model or some new algorithm.

**A translation algorithm that is able to turn complex reasoning into digestible explanation requires that the resulting explanation is not faithful, or the algorithm itself can be simplified enough to be explicable.** Let's consider the former, where the COMPAS system produces the explanation that "you have offended once in the past and your demographic is deemed to be more likely to re-offend in the upcoming years". However, the defendant may then ask "how can I trust that this translation is true to the vastly complex COMPAS algorithm?". We will discuss the latter simplification case in a later section.

**Since significant translation from reasoning to explanation is in of itself opaque, AI decisions must utilise reasoning that is directly explicable, whilst also retaining accuracy to roaming morally salient.** Next, we will explore how this may be possible, and explore the nature of explanation whether causal or otherwise.

### 3.1 Ways of explanation
Grayson discusses 4 models of explanation of which we will discuss: the deductive-nomological model, the statistical model, and the causal model.

To explain some event or state $x$ through causal explanation is to specify the causes of $x$. *Counterfactual causal* explanation takes the form:
Where $c$ and $e$ are two distinct possible events, $e$ _causally depends_ on $c$ if and only if, if $c$ were to occur $e$ would occur; and if $c$ were not to occur $e$ would not occur. (Lewis 1973).
From our earlier example, event $c$ is "Bob feels tired and believes there is coffee in the fridge" and event e is "Bob goes to the fridge".

Statistical explanation is based upon the probability of event $c$ causing event $e$. This takes the form "given Bob feels tired and believes there is coffee in the fridge, bob will almost certainly go to the fridge" (adapted from Howel p125). Causal and statistical explanation are similar in that they identify a causal even $c$ and link $c$ to resulting event $e$. However, the difference between even $e$ occuring and "almost certainly occuring" is critical. Statistical explanation only explain the likeliness of $e$, which is not sufficient to explain the $e$ itself. Although statistical explanation is not sufficient, statistical models may be used to determine causes for a causal explanation. For example, the statistic that 95% of tired people with coffee nearby will go to drink coffee in conjunction with the elimination of confounding variables may be used to determine the causal relationship mentioned above.

Deductive nomological explanation involves starting from general laws and circumstances, and then showing "how that the statement describing the result can be validly inferred" (Hempel 1962 p100). For Bob we could say that "bob being tired and believing there is coffee in the fridge, and the general human law that individuals will take actions to remedy their fatigue implies that Bob will go to the fridge". In contrast, causal reasoning starts from the outcome event, and considers and refines the causes. Both causal and deductive explanation are sufficient to explain result $e$, we will explore the efficacy of these explanation models next.

### 4.2 Simplification to transparency
As mentioned earlier, one approach to making COMPAS explicable is to simplify its reasoning. An attempt of this was made by a research team from Berkely using the reasoning of "rule-lists" which are predictive models composed of if-then statements (Angelino et al 2018). Reasoning through rule lists is transparent because the reasoning for a decision is easily explicable through causal explanation. Let's see an example rule list below:

```python
if (age = 18 − 20) and (sex = male) then predict yes
else if (age = 21 − 23) and (priors = 2 − 3) then predict yes
else if (priors > 3) then predict yes
else predict no
```

If our criminal from our aforementioned case was aged 19 and male we could explain causally with the precise if conditions that "because you are 19 and male, we have decided that you are at high risk of re-offending". Rule lists are also easy to convert to deductive explanation as "your age of 19 years, your male sex, and the general law this demographic is high risk, indicates you are at high risk of re-offending". Through rule-lists as above, researches created the CORELS algorithm which was "competitive with scores generated by the COMPAS algorithm" (Angelino et al 2018). So, through rule lists, CORELS and as such automated recidivism predication can become transparent.

Simplification of COMPAS into CORELS also does not diminish accuracy and so remains fair. "It is the accuracy of the COMPAS system that allows it to achieve fairness" (Grayson 2024 p7). The CORELS team found that "the accuracies of rule-lists learned by CORELS are competitive with scores generated by the black-box COMPAS algorithm" (Angelino et al 2024 p40). So, in the case of recidivism, CORELS achieves transparency through explicable rule-lists, whilst also maintaining accuracy, and so fairness, competitive with COMPAS. Though COMPAS's lack of transparency may be remedied without loss of accuracy, COMPAS's mediocre accuracy makes raises concerns regarding fairness.

## 4.3 Accuracy is insufficient for fairness
Grayson states that accuracy allows COMPAS to achieve fairness, however, fairness is defined not in terms of the outcome, but in terms of the reasoning. For predictive ADM to remain fair, not only must they be accurate, but so too much their reasoning, that is, their internal logic and algorithm, be normatively salient. We can justify normative salience through Kantian ethics.

Suppose that COMPAS is highly accurate to a non-disputable extent and constructed through rule lists. Our judge has used COMPAS's prediction to sentence our defendant, however the defendant is unsatisfied and asks for an explanation of COMPAS's reasoning. The judge explains that COMPAS has decided they are high risk "because your age of 19, your location of $l$, ethnicity of $e$, sex of $s$, ...". This is an example of algorithmic discrimination against particular demographics $l, e, s$. Certainly discrimination is considered against the norm, and is disagreeable by normative ethical theories. Kantian ethics agree that "algorithmic discrimination is morally wrong when it makes demeaning distinctions, as respect is owed to every individual." (Reinhardt L., 2024). Certainly distinguishing recidivism based upon one's ethnicity and location would be considered demeaning.

At present, COMPAS scores a mean accuracy of 66% whereas CORELS achieves 66.5% (Angelino et al 2024 p40). Studies show that "COMPAS (and so CORELS) is not significantly better than the crowd" (Derssel J, Farid H, 2018). Moreover, COMPAS and CORLES both shown to have biases, particularly in race (Angelino et al 2024 p40). However, bias in outcome is only unfair when there exists algorithmic discrimination. Consider 2 rule-lists from CORELS:

```python
(1)
if (priors > 3) then predict yes
else predict no

(2)
if (priors > 3) then predict yes
else if (sex = male) and (juvenile crimes > 0) then predict yes
else predict no
```

Rule-list 1 may be accepted as normatively salient as it only distinguishes risk based on prior convictions. This distinguishes not on uncontrolled attributes, but upon
### References
Center for Criminology and Public Policy Research 2010, VALIDATION OF THE COMPAS RISK ASSESSMENT CLASSIFICATION INSTRUMENT, accessed 29th October 2024, \<https://criminology.fsu.edu/sites/g/files/upcbnu3076/files/2021-03/Validation-of-the-COMPAS-Risk-Assessment-Classification-Instrument.pdf>

Angelino et al, 2018, Learning Certifiably Optimal Rule Lists for Categorical Data, accessed 30th October 2024, \<https://arxiv.org/pdf/1704.01701>

Carl G.H 1962, Deductive-Nomological vs. Statistical Explanation, accessed 30th October 2024, \<https://conservancy.umn.edu/items/b8ce3527-af35-44a0-be95-013a66d7af79>

C. M. Lorkowski, David Hume: Causation, accessed 30th October 2024 \<https://iep.utm.edu/hume-causation/>

Lewis, D., 1973. Counterfactuals, Oxford: Blackwell.

Dressel J, Farid H. 2018, The accuracy, fairness, and limits of predicting recidivism. _Sci Adv_, accessed 31st October 2024. \<https://pmc.ncbi.nlm.nih.gov/articles/PMC5777393/>

Reinhardt L., 2024, When is algorithmic discrimination wrong? , accessed 31st October 2024, \<https://journals.ub.uni-koeln.de/index.php/phidi/article/view/2416>