---
layout: page
permalink: /research/braincraft.html
---

# Braincraft associated team

What are the processes by which animals and humans select their actions based
on their motivations and on the consequences of past actions? This is a
fundamental question in neuroscience, with implications to ethology,
psychology, economics, sociology and computer science. The basal ganglia are a
group of interconnected subcortical nuclei which have been the subject of
intensive studies in the past years, both at the computational, psychological,
anatomical and biological levels (Alexander, 1986; Mink, 1996; Gurney et al,
2001, Leblois 2006). From study of the basal ganglia’s dysfunctions
(e.g. neurodegenerative diseases), these nuclei are believed to play a
prominent role in action selection, choosing, among possible actions, to
trigger the one with the best expectancy of achievement, with regard to the
goal to be fulfilled. The place for the representation of actions and of their
contingencies with regard to motor and sensory constraints is the prefrontal
cortex, in charge of the temporal organization of behavior (O’Reilly et al,
2006). The prefrontal cortex is consequently at the crossroad of two kinds of
loops, with other cortical regions giving sensorimotor constraints from the
environment and with the basal ganglia giving reinforcement constraints in
terms of goal achievement.

A central question in cognitive computational neuroscience is to understand how
cognitive control emerge from these regions and elaborate criteria, in the
process of making an overall decision, which often require weighting various
tradeoffs (Kolling, 2012; Fiorillo C.D., 2003). A particularly important
question in this perspective is to know more precisely the nature and the
moment of the contribution of the basal ganglia in this process. As often in
this domain, this question evokes two main aspects: (i) information
representation: which kind of information is represented in these structures
and how it is exchanged between them? (ii) learning: what kind of learning is
performed in each of these structures and what is its impact on the others?

## Investigators

* **Nicolas P. Rougier**  
  INRIA, Institute of Neurodegenerative Diseases (IMN), UMR 5293

* **Randall C. O'Reilly**  
  Computational Cognitive Neuroscience (CCN) Lab at University of Colorado, Boulder, USA

* **Thomas Boraud**  
  Institute of Neurodegenerative Diseases (IMN), UMR 5293


## First year (2015)

This first year of the associated team has given us the opportunity to exchange
with our US partners on the various topics mentioned in the program. This
convinced us to start to explore the role of the OFC in the decision making
process and the dynamic valuation of stimuli. Furthermore, we (on the French
side) started to investigate the Emergent software platform in order to check
if it can be used for our own models that differ a bit in their functional
hypothesis and basic computational unit. In the same time, we’re also
investigating how to back port some the Emergent models into the Python/Numpy
framework such as making the model easily shareable and replicable.

### Record of activities

* Short visit (2 days) of 2 French PhD students (Meropi Topalidou and Charlotte
  Héricé) in June 2015 for a tutorial on the Emergent software. The goal was to
  check how easy it would be for the French team to adapt their model to this
  platform. This is still ongoing work since the port may require additional
  components to be developed on the US side.

* Short visit (5 days) of Nicolas Rougier, Frédéric Alexandre, Thomas Boraud
  and Maxime Carrère (PhD student) for the preparation of the upcoming joint
  NSF-ANR call for proposal (deadline 19/10/2015). The goal was to discuss on
  how to best organize ourselves to answer the call and to agree on the
  experimental and modeling part.


## Second year (2016)

We mentioned last year that we do not have yet a common platform for sharing
models. The US team is mostly using the Emergent framework (that they are
developing) while the French team is mostly using the Python language
associated with the classical scientific stack (numpy, scipy, matplotib,
cython). This incompatibility prevents us from sharing models or components and
represents the main barrier for deeper collaborations. Fortunately, Fabien
Benureau joined the French partner as a post-doc and has a great experience in
Python. In cooperation with Jessica Mollick, he started the replication of two
models (PVLV and bvPVLV) that are representative of the kind of models the US
partner is doing. This work is not yet finished but early results tend to show
this will be finished by next year and this should help us to exchange both
model parts and computational principles underlying those models.

In the meantime, we are also exchanging publications, materials and experience
on the modeling of the medial prefrontal cortex, a structure known to be
involved in the estimation of the emotional value of surrounding objects and in
the evaluation of motivation to act (need, fatigue). Thomas Boraud is also
active in the discussion since he is currently experimenting electrophysiology
in this region in monkeys. One important goal of this discussion is to
precisely define a well-defined and motivated experimental protocol to be
presented for a proposition of common ANR-NSF project. Both teams are also
working on the precise understanding of reward prediction errors in a neuronal
structure called VTA (Ventral Tegmental Area), known to be of utmost importance
for respondent as well as instrumental conditioning. Furthermore, we’re also
investigating respective modeling works to compare similar mechanisms and to
understand when they are complementary. These exchanges were particularly
fruitful with respect to models of dopamine release even if we disagreed on
some specific mechanisms.

### Record of activities

* Visit (2 days) of Randall O’Reilly in Bordeaux. Randall was invited as a
  keynote speaker for the SBDM conference in Paris and came to Bordeaux
  afterwards. This gave us the opportunity to settle a plan around the Python
  replication for the Emergent framework.

* Visit (2 weeks) of Jessica Mollick (from Randall O’Reilly’s lab) in
  August 2016. The goal of this visit was to exchange ideas and comment around
  the architecture of bvPVLV model (not yet published) which is currently
  designed by the US team and shares a number of components that are also found
  in our own models. Jessica was also introduced with our models such that the
  US team can start replication using the Emergent framework.

* Visit (3 weeks) of Fabien Benureau (from Mnemosyne project) in
  September 2016. The goal of this visit was to advance the replication of the
  bvPVLV model that serves as a testbed model for a Python translation of the
  Emergent framework. The visit was quite successful even though there is still
  more work to be done. The final goal of this translation is to ease the
  exchange of models between the two teams.


## References

* Alexander, G.E., DeLong, M.R., Strick, P.L. Parallel Organization of
  Functionally Segregated Circuits Linking Basal Ganglia and Cortex. Annual
  Review of Neuroscience, Vol. 9, No. 1, pp. 357-381, 1986.
* Camille, N., Tsuchida, A. & Fellows, L.K. Double Dissociation of
  Stimulus-Value and Action- Value Learning in Humans with Orbitofrontal or
  Anterior Cingulate Cortex Damage, Journal of Neuroscience,
  31(42):15048-15052, 2011.
* O'Reilly, R.C. & Frank, M.J. Making Working Memory Work: A Computational
  Model of Learning in the Prefrontal Cortex and Basal Ganglia. Neural
  Computation, 18, 283-328, 2006.
* Fiorillo C.D., Tobler P.N., Schultz W. Discrete coding of reward probability
  and uncertainty by dopamine neurons. Science 299:1898-1902, 2003.
* Gurney, K.N., Prescott, T.J. & Redgrave, P. A computational model of action
  selection in the basal ganglia I: A new functional anatomy. Biological
  Cybernetics 84: 401-410, 2001.
* Kennerley, S. W., Behrens, T. E. J., & Wallis, J. D. Double dissociation of
  value computations in orbitofrontal and anterior cingulate neurons. Nature
  Neuroscience, 14(12), 1581158, 2011.
* Leblois A., Boraud T., Meissner W., Bergman H., Hansel D. Competition between
  Feedback Loops Underlies Pathological Dynamics in the Basal Ganglia Journal
  of Neuroscience 26(13):3567-3583, 2006.
* Kolling, N., Behrens, T., Mars R. and Rushworth M. Neural Mechanisms of
  Foraging. Science, 336 (6077), 95-98, 2012.
* Mink, J. W. (1996). The Basal Ganglia: Focused selection and inhibition of
  competing motor programs. Progress in Neurobiology, 50, 381-425.
