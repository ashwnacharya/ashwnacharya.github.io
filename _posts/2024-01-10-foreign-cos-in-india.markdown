---
layout: post
title:  "3 types of Software Teams: A Mental Model for Indian Engineers"
date:   2024-01-10 12:00:00 +0530
---

## TL-DR:
* Specifically relevant to Multinational software companies with offices in India.
* Teams in Indian offices of these companies typically handle three types of software projects:
    * Staff Augmentation
    * Shared Ownership
    * Total Ownership


## What am I talking about?
With a few exceptions, I've spent the majority of my career working in the Indian offices of large US-based enterprise companies.

Typically, these enterprise companies have their headquarters situated in the US or Europe. For instance, Microsoft's headquarters is in Redmond, VMWare's in San Francisco, and EMC in Hopkinton, MA.

The headquarters (HQ) is the mothership: the geolocation with the most significant presence of senior leaders within the company. Offices in other countries are frequently labeled as "Development Centres" or "Centers of Excellence." However, for the purpose of this discussion, let's refer to them as Satellites.

Based on my experience, projects or teams in satellite offices typically fall into one of the following three broad categories.


### 1. Staff Augmentation
The Staff Augmentation model involves the team in a satellite region primarily offering low-level headcount to a team based at the HQ.

The headcount is mostly junior or mid-level engineers, along with a frontline EM or a team lead. 

Major decisions are predominantly made at the mothership and then conveyed to the satellite teams. Consequently, a key indicator of the staff-augmented model is when senior leadership, architects, product managers, designers, etc., are primarily based at the mothership.

Within this team, the work typically involves executing marching orders issued by the mothership. The quality of delivery is frequently assessed based on how closely it aligns with the specifications provided by the mothership.

A staff augmentation arrangement is typically found when the team or organization at the satellite is still in the process of finding its feet: building credibility and earning trust of the mothership. So the leaders at the mothership understandably hesitant to hand over the reins.

Engineers in this team primarily experience growth by assisting the satellite leadership in earning credibility and trust.

Leaders at a satellite organization usually aim to earn credibility and trust by leveraging organizational design and cost arbitrage benefits to increase their throughput. However, the results are mixed, mainly because [Mythical Man-Month principles](https://en.wikipedia.org/wiki/The_Mythical_Man-Month) still hold true.


### 2. Shared Ownership
As staff augmentation teams mature, they transition into a Shared Ownership model, placing the satellite teams more or less on equal footing with their counterparts at the mothership.

Additional context is shared, and there is increased trust in the capabilities of the offshore team. The satellite teams are empowered to exercise judgement and make critical decisions.

Responsibilities are delineated along module or workstream boundaries due to timezone challenges, which hinder effective collaboration across different geographical locations.

At times, the nature of the product and/or the distribution of customers necessitates the adoption of a Shared Ownership model: For instance, this is applicable when a product demands a follow-the-sun model to maintain its availability and meet reliability SLOs, or when a product has a substantial customer base situated in the same geographic location as the satellite team.

An variation of the Shared Ownership model is where the mothership owns the core differentiators for a product, i.e., the more challenging aspects. This is because of the greater talent density, a history of ownership, a proven track record, and so on. The satellite teams handle the easier, more commoditized components.

A well-functioning shared responsibility model is often envisioned as the terminal state desired by the company's senior leadership. A successful outcome is frequently the result of a meticulously planned and well-executed [Inverse Conway's Maneuver](https://martinfowler.com/bliki/ConwaysLaw.html).


### 3. Total Ownership
A total ownership model is when a product is owned end-to-end by the satellite team. This typically signifies a high level of trust in the talent and execution capabilities of the satellite team.

In certain cases, this stems from the leadership at the mothership giving the satellite organization an opportunity to demonstrate their capabilities by taking on a low-risk, high-reward initiative.

Alternatively, this involves a revenue-generating product in sunset/maintenance mode being transferred to the satellite team while the mothership teams shift their focus to riskier, more promising initiatives.

While uncommon, it is not entirely unheard of for a satellite team to take ownership of a high-risk, high-reward project.



## A variation of the Pioneers, Settlers and Town-planners model
In a sense, the above model serves as an alternative perspective: an observation from the other side, of the [Pioneers, Settlers and Town Planners](https://blog.gardeviance.org/2015/03/on-pioneers-settlers-town-planners-and.html) model proposed by [Simon Wardley](https://www.linkedin.com/in/simonwardley/).

An executive at the mothership pioneers the offshore model for the first time through the establishment of a staff augmentation engagement. With time, the settler phase involves discovering best practices and failure modes, ultimately transitioning to the town planner phase for extracting maximum value.

![](/assets/2024-01-10/msft.jpeg)
<sub>Pic mostly unrelated, other than the fact that this is where I picked up this mental model. </sub>

## Observations and Caveats

**Clusters on a spectrum:** It is useful to view this model as clusters on a spectrum, rather than as discrete, well-defined buckets.

**Not a broad brush:**  It is useful to apply this model at a team level, rather than at the entire company level. It is common for teams from different parts of a company to be at different points of the spectrum.

**A point in time snapshot:** Teams are continually evolving, influenced by various tectonic forces. Therefore, it is useful to utilize this model to depict the state of a team or organization at a specific point in time, rather than as a permanent label.

**X-axis of the spectrum represents trust:** The higher the trust in the satellite org, the more influence one has in decision-making. 

![](/assets/2024-01-10/trust.png)
<sub>Earn trust to change the model of engagement</sub>

## How to use this mental model?
Personally, I have found this model to be valuable when assessing potential job offers.

For instance, an offer from a team following a staff augmentation model can be viewed as an opportunity to lead the transition towards a shared ownership model, assuming alignment among the leaders at the satellite location. This can be a good opportunity to earn career growth via taking up more responsibilities. However, a lack of ambition from the leaders may lead to frustration.

Likewise, a Total Ownership model can be considered as a means to achieve a better work-life balance with no calls and meetings beyond work hours, along with increased autonomy. But this may come at the cost of career growth, assuming you are working on a product that is being sunsetted.

A Shared Ownership model, on the other hand, offers the opportunity to be on equal footing with counterparts from the mothership. However, it may entail trade-offs such as frequent short-term trips, meetings scheduled beyond work hours, and navigating differences in work culture, among other considerations.

Thus, there is no model of engagement that is inherently superior or inferior. It all depends on what you want out of a job.

