> [!info] Question
> How might fairness, accountability, and transparency be achieved collectively by an automated decision - that is - by a decision outputted by an AI? In your answer, compare and contrast a causal account of explanation with at least one other account of explanation. Make explicit reference to the reading (and references therein) for Thursday of Week 4.
### 1. Introduction
Achieving the properties of accountability, fairness and transparency is essential to acceptable Automated Decision Making (ADM). We assess the potential for rule-lists to jointly achieve fairness and transparency for COMPAS, a recidivism prediction software. We argue that COMPAS achieves transparency through explicable rule-lists without diminishing accuracy. We argue that rule-lists can be shown to be normatively salient through Kantian ethics. Finally, we show that COMPAS does not in practice have sufficient accuracy to result in fairness, particularly through the effect of automation bias.

First we define that accountability is to possess normatively salient reasoning (fairness) and accessible, understandable explanation of said reasoning (transparency). Then, we discuss how human decision making is able to jointly achieve fairness and transparency through the belief-desire-intention model. We define reasoning as the process of coming to a decision, and explanation as the accessible and understandable communication of this process. We then argue that we cannot achieve transparency through the translation of reasoning to explanation, and that we must employ reasoning that is inherently explicable (which we call transparent reasoning). We explore ways of explanation, determining the deductive nomological and causal explanation are sufficient to explain decisions. Next, we show how rule-lists are forms of transparent reasoning through deductive nomological and causal explanation. We show that COMPAS can be become transparent through implementation of rule-lists without losing accuracy. The rule-list implementation is called CORELS. Next we argue that accuracy is not sufficient to prove moral salience, but rather the reasons underlying the decision should themselves be morally salient. We discuss how rule-lists may be shown to be morally-salient through Kantian ethics. Finally, we argue that the accuracy of CORELS/COMPAS, even with transparency and moral reasoning, is ultimately insufficient for fairness through considering ADM guidelines and cognitive bias.

### 2.1. Accountability, Fairness, and Transparency
First, let's define accountability, fairness and transparency. Borrowing from Grayson, we identify that **accountability requires reasons**. That is, an accountable decision is one that is reasonable. Reasonableness is a function of normatively rational salience (Grayson 2024 p5). For a reason to be normatively salient, a reason must be considered grounded in norms or morally "right" or "fair" within a given context. **So we derive our property of fairness as possessing reasons that are considered morally salient**. A decision's reasonableness also requires reportability, that is the reasons for a decision must be understandable and accessible to its stakeholders. **So we have our second derived property of transparency which refers to the reportability of a decision.** Lets finally define that a decision that collectively achieves fairness, accountability and transparency is acceptable.

### 2.2. Human Decision Making
**Through the belief-desire-intention model and causal explanation, humans are capable of making decisions that are fair and transparent, and as such accountable and acceptable.** Grayson explore human decision making through the a model mirroring the belief-desire-intention (BDI) agent model developed by Michael Bratman. Beliefs are the set of true statements understood by some agent, let's call them Bob, such as "there is coffee in the fridge". Desires are an agent's goals, preferences and values, such as "Bob feels groggy and tired". Beliefs and desires are independent of each other. An intention is a plan, scheme or strategy formed in pursuit of an agent's desires, and based upon an agent's beliefs. The coexistence of the aforementioned belief and desire, and the lack of opposing desires such as "Bob wants to stay in bed", would culminate in the intention of "Bob will go to the kitchen and drink coffee". This line of reasoning naturally aligns itself with causal reasoning which may be phrased as "if Bob had not believed coffee lie in the fridge and Bob did not feel tired, then Bob would not have gone to get coffee". By explaining a decision using causal explanation in relation to beliefs and desires, one's decision is made transparent. By explaining morally salient beliefs and desires, one's decision is made fair.

### 2.3. COMPAS Recidivism Prediction
COMPAS (Correctional Offender Management Profiling and Alternative Sanctions) is a software that predicts recidivism of convicted criminals. COMPAS aims to be used to assist judges in deciding the sentence of a convicted criminal by providing a prediction of the recidivism risk of said criminal. COMPAS uses at least 15 factors with multiple items (Center for Criminology and Public Policy Research 2010, p10) as of 2010, this number has undoubtedly increased in the last decade.

### 2.4. Ways of Explanation
Essential to transparency is explanation. Grayson mentions 4 models of explanation, of these we will consider: the deductive-nomological model, the statistical model, and the causal model.

To explain some event or state $x$ through causal explanation is to specify the causes of $x$. *Counterfactual causal* explanation takes the below form which we will refer to as form $C$.

> Where $c$ and $e$ are two distinct possible events, $e$ _causally depends_ on $c$ if and only if, if $c$ were to occur $e$ would occur; and if $c$ were not to occur $e$ would not occur. (Lewis 1973).

From our earlier example, event $c$ is "Bob feels tired and believes there is coffee in the fridge" and event e is "Bob goes to the fridge". Proving causal relationships is not trivial however. The methods of proof of causal relationships are complex, and "unfortunately, valid explanations of the causes of social phenomena do not come easily" (Chambliss 2018). Methods can include statistical inference, longitudanal studies, and controlled trials. These methods are discussed in greater detail in Chambliss' book 'Making sense of the social world'.

Statistical explanation is based upon the probability of event $c$ causing event $e$. This takes the form "given Bob feels tired and believes there is coffee in the fridge, bob will almost certainly go to the fridge" (adapted from Howel p125). Causal and statistical explanation are similar in that they identify a causal event $c$ and link $c$ to resulting event $e$. However, the difference between even $e$ occurring and "almost certainly occurring" is critical. Statistical explanation only explain the likeliness of $e$, which is not sufficient to explain the $e$ itself. **Although statistical explanation is not sufficient, statistical models may be used to determine causal relationships.** For example, the statistic that 95% of tired people with coffee nearby will go to drink coffee in conjunction with the elimination of confounding variables may be used to determine the causal relationship mentioned above.

Deductive nomological explanation involves starting from general laws and circumstances, and then showing "how that the statement describing the result can be validly inferred" (Hempel 1962 p100). To explain Bob's behaviour we could explain "Bob being tired and believing there is coffee in the fridge, and the general human law that individuals will take actions to remedy their fatigue implies that Bob will go to the fridge". Similar to causal explanation, these general laws are not trivial to prove, and themselves require sophisticated reasoning. Unlike deductive explanation's bottom-up approach which deduces the outcome, causal reasoning starts from the outcome event, and considers and refines the causes. Both causal and deductive explanation are sufficient to explain result $e$.

### 2.5. Reasoning to Explanation
**For an AI decision to be transparent, it must possess reasoning that tends easily tends towards explanation without significant translation, we call such reasoning transparent reasoning.** Reasoning is the process in which a human or machine come to a decision. An explanation is the conveying of our reasoning to others. We can think of the process of conveying reasoning as translation from logic into the explanation.

For human decision making, there is little required translation. This is because the justification of a decision, that is the beliefs and desires of an agent, are trivially explicable through causal reasoning as described with Bob.

Borrowing from Grayson's recidivism example, our judge has sentenced the defendant to 6 years with no parole through risk assessment given by COMPAS. Our defendant then asks for an explanation, "why has it been decided that I am given such a long punishment without parole?". The COMPAS creators know that it is not feasible to explain COMPAS's algorithm because it is too complex (and it is proprietary). The COMPAS creators decide to translate their reasoning, that is their algorithm, into an explanation through the means of a large language model or some new algorithm.

**A translation algorithm that can convert complex reasoning into accessible explanation requires that the resulting explanation is either not faithful, and so not transparent, or the algorithm can be designed through transparent reasoning.** Suppose after a translation step from complex logic into accessible explanation COMPAS pragmatically explains "you have offended once in the past and your demographic is deemed to be more likely to re-offend in the upcoming years". However, the defendant may then ask "how can I trust that this translation is true to the logic of the vastly complex COMPAS algorithm?". **Since neither the original reasoning nor the translation steps are transparent due to their complexity, COMPAS cannot be transparent even if the resulting explanation appears to be.** The latter case, that COMPAS may be programmed through transparent reasoning, is a promising approach to achieving transparency that we will discuss next.

### 3.1. Explicable reasoning
**Through rule-lists, which I will argue are forms of transparent reasoning, COMPAS may be made transparent without losing accuracy.**

A research team from Berkely ventured to make transparent recidivism prediction using the reasoning of "rule-lists" which are predictive models composed of if-then statements (Angelino et al 2018). Reasoning through rule lists is transparent because the reasoning for a decision is directly explicable through causal and deductive explanation. Let's see an example rule list below:

```python
if (age = 18 − 20) and (sex = male) then predict yes
else if (age = 21 − 23) and (priors = 2 − 3) then predict yes
else if (priors > 3) then predict yes
else predict no
```
(Angelino et al, 2018)

**Through causal and deductive nomological explanation, as well as the relevant justifications for causal relationships and general laws, we can with very little translation, explain reasoning for a rule-list system's decision.** If our criminal from our aforementioned case was aged 19 and male we could explain causally using form $C$ (refer to 2.4.) where event or circumstance $e$ is our high risk prediction and event or circumstance $c$ is the conditions of our if statement. It is also necessary that this causal relationship's justification is accessible and publicly available. With deductive nomological explanation, we explain that the circumstances of age 19 and male sex, along with the general law that this demographic is of high risk of reoffending (which like causal reasoning must be justified) implies that the convicted criminal is of high risk. **Since conditions of rule-lists easily tend to explanation in the form of causal and deductive nomological, rule-lists are a form of transparent reasoning.**

Researches created the CORELS recidivism algorithm with rule-lists. CORELS is "competitive with scores generated by the COMPAS algorithm" (Angelino et al 2018). So rule-lists enable us to satisfy transparency whilst maintaining accuracy of our algorithm, next we discuss if this is sufficient for the property of fairness.

### 3.2. Accuracy is necessary, but insufficient to prove fairness
Grayson states that accuracy allows COMPAS to achieve fairness (Grayson 2024 p7), however, fairness is defined not in terms of the outcome, but in terms of the reasoning. **For predictive ADM to remain fair, not only must they be accurate, but so too much their reasoning, that is, their internal logic, be normatively salient**. We may justify normative salience through Kantian ethics.

**Regardless of an ADM's accuracy, it may be considered unfair if internal reasoning is not normatively salient, specifically due to algorithmic discrimination**. Suppose that COMPAS is highly accurate to a non-disputable extent and constructed through rule lists. Our judge has used COMPAS's prediction to sentence our defendant, however the defendant is unsatisfied and asks for an explanation of COMPAS's reasoning. The judge explains that COMPAS has decided they are high risk "because your age of 19, your location of $l$, ethnicity of $e$, sex of $s$, ...". This is an example of algorithmic discrimination against particular demographics $l, e, s$. Certainly discrimination is considered against the norm, and is disagreeable by normative ethical theories. Kantian ethics agree that "algorithmic discrimination is morally wrong when it makes demeaning distinctions, as respect is owed to every individual." (Reinhardt L., 2024). Certainly distinguishing recidivism based upon one's ethnicity and location would be demeaning. So, regardless of accuracy, COMPAS would not be normatively salient here, and so too not fair.

**Apparent bias in the outcomes of ADM decisions is only unfair when the underlying reasoning is not normatively salient**. COMPAS and CORLES both shown to have biases, particularly in race (Angelino et al 2024 p40). However, bias in outcome is only unfair when there exists algorithmic discrimination. Consider 2 rule-lists from CORELS:

```python
(1)
if (location = transit authority) then predict yes . Found by 2 folds
else if (stop reason = suspicious object) then predict yes
else predict no

(2)
if (stop reason = suspicious object) then predict yes
else if (location = transit authority) then predict yes
else if (city = Bronx) then predict no
else if (location = housing authority) then predict no
else if (stop reason = furtive movements) then predict no
else predict yes
```
(Angelino et al 2024 p68-72)

Both rule-lists are created to optimally predict recidivism from the NYPD stop-and-frisk data set which resulted in similar accuracy and biases. Rule-list 1 may be accepted as normatively salient as it is legal (under Australian law), reasonably permissible as a norm, and can be shown to be ethical under Kantian ethics. The applicable maxim here could be "I ought to judge one's risk based upon past actions". Rule-list 2 judges an individual to have low recidivism risk if they are located in Bronx. This may be considered as against the norm, and also impermissible as the applicable maxim of "I ought to judge one's risk based upon their city of origin" is un-agreeable. As such, rule-list 2 is a case of algorithmic-discrimination, even if it is in the favour of the convicted criminal. **Though both rule-lists maintain similar bias and accuracy, it is the reasoning of rule-list 2 that causes it to discriminate and be impermissible.**

### 3.3. Is CORELS accurate enough to be fair?
We have discussed how CORELS may have normatively salient and transparent reasoning, to jointly complete our triad, we are left to prove that CORELS is sufficiently accurate to achieve fairness. We can define sufficient accuracy of an ADM to be such that does not result in compromised accuracy of related decision making as recommended by Commonwealth Ombudsman's ADM guide. Finally, based upon this definition, we can show that CORELS negatively impacts accuracy of sentencing judges, and so cannot be fair.

The common concerns regarding COMPAS is regarding it's lack of accuracy (Grayson 2024 p6). Studies show that "COMPAS is not significantly better (more accurate) than the crowd" (Derssel J, Farid H, 2018). To answer the question of whether CORELS/COMPAS's accuracy of ~66% (Angelino et al 2018 p40) is sufficient, we may turn to an item from Commonwealth's 'Automated Decision Making' guide: "Have you ensured that the automated system does not, at any part of the process, compromise accuracy in decision making?" Commonwealth Ombudsman p29). **Specifically for CORELS, does CORELS compromise the accuracy of sentencing judges?** As argued by Park, "cognitive biases serve to further entrench COMPAS’s role in sentencing decisions" (Park 2029). Most notably *automation bias* - the tendency to ascribe power to automated aids over other sources (Kate Goddard et al) - leads to judges disregarding other factors pertinent to a case. Ultimately, due to COREL's inaccuracy, it is at a high risk of diminishing the accuracy of sentencing judges.

### 4. Conclusion
We have shown how COMPAS recidivism software can be made transparent through rule-lists without losing accuracy, and shown to be normatively salient by analysing morality of underlying reasoning through Kantian ethics. However, we determine that due to cognitive biases, utilisation of COMPAS is at high risk of diminishing accuracy of sentencing judges, and as such COMPAS cannot be regarded as fair.

### References
Chambliss D.F. 2018, Causation and Experimental Design, Making sense of the social world, \<https://www.sagepub.com/sites/default/files/upm-binaries/23639_Chapter_5___Causation_and_Experimental_Design.pdf>

Center for Criminology and Public Policy Research 2010, VALIDATION OF THE COMPAS RISK ASSESSMENT CLASSIFICATION INSTRUMENT, accessed 29th October 2024, \<https://criminology.fsu.edu/sites/g/files/upcbnu3076/files/2021-03/Validation-of-the-COMPAS-Risk-Assessment-Classification-Instrument.pdf>

Angelino et al, 2018, Learning Certifiably Optimal Rule Lists for Categorical Data, accessed 30th October 2024, \<https://arxiv.org/pdf/1704.01701>

Carl G.H 1962, Deductive-Nomological vs. Statistical Explanation, accessed 30th October 2024, \<https://conservancy.umn.edu/items/b8ce3527-af35-44a0-be95-013a66d7af79>

C. M. Lorkowski, David Hume: Causation, accessed 30th October 2024 \<https://iep.utm.edu/hume-causation/>

Lewis, D., 1973. Counterfactuals, Oxford: Blackwell.

Dressel J, Farid H. 2018, The accuracy, fairness, and limits of predicting recidivism. _Sci Adv_, accessed 31st October 2024. \<https://pmc.ncbi.nlm.nih.gov/articles/PMC5777393/>

Reinhardt L., 2024, When is algorithmic discrimination wrong? , accessed 31st October 2024, \<https://journals.ub.uni-koeln.de/index.php/phidi/article/view/2416>

Commonwealth Ombudsman, Automated Decision-making, Better Pratice Guide, accessed 31st October 2024, <https://www.ombudsman.gov.au/__data/assets/pdf_file/0029/288236/OMB1188-Automated-Decision-Making-Report_Final-A1898885.pdf>

Kate Goddard et al. 2012, Automation Bias: A Systematic Review of Frequency, Effect Mediators, and Mitigators

Andrew Lee Park 2019, Injustice Ex Machina: Predictive Algorithms in Criminal Sentencing, accessed 31st October 2024, \<https://www.uclalawreview.org/injustice-ex-machina-predictive-algorithms-in-criminal-sentencing/>