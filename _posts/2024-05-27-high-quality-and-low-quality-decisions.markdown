---
layout: post
title:  "Quality of decisions, and quality of outcomes"
date:   2024-05-27 12:00:00 +0530
published: true
---

## TL-DR:
* There are good quality and bad quality decisions.
* Quality of outcomes are sometimes unrelated by the quality of decisions.
* A leader is evaluated based on the quality of their decisions. However, they are responsible for the outcomes.


## Difference between a decisions and outcomes

### Consider scenario 1:
It is friday night. You are at a pub with your friends. It is 12 AM. You are slightly drunk. Your car is parked on the street. You get to your car, and then decide against driving home. You decide to walk instead. Because you don't want to drive while drunk. And you live not that far away. After all, You have safely made that walk many times before. You could just walk down to the pub tomorrow morning when you are sober, and take your car home. 

So you leave the car behind and walk home. On the way, you get mugged. Muggers take away your wallet, but you are safe, but shook. You lose some money. And some identity cards. A couple of debit cards. And your phone. Urrgh, the hassle!


### Now consider Scenario 2:
You are down on your luck. Your are running out of your savings; you have enough money for one more month of rent and expenses. After one month, your bank balance will be 0. 

Fuck it, you say. World cup final is happening later in the evening. You buy a bottle of cheap booze, and then bet all your money on your favourite underdog team. You are all in. 

Then you park yourself infront of the TV and watch the game. It is a nailbiter. But against all odds, your team wins! You are now very rich! 


## Quality of the decisions vs outcomes
In Scenario 1, was walking home instead of driving drunk a good decision? Or was it a bad one? 
In Scenario 2, was betting all your money on the underdog team a good decision? Or was it terrible?


Of course, not driving drunk was a very good decision. And you had made that walk many times before. You were just unlucky.  Betting all your money on your favourite team was absolutely a bad decision. You just got lucky.

Because a Good quality decision can still have a bad quality outcome. And vice versa.


## Input vs output metrics
Output metrics are the parameters of the outcome you desire. Examples: Revenue. Monthly active users. They can be non-functional outcomes too: like latency. throughput. DORA metrics are output metrics too.

In contrast, input metrics are parameters of the actions you control. They are a measure of how well you have modelled the problem space you are operating in: what do your customers say they want? What constraints are you operating under? How many people do you have to solve the problem at hand? What are their skillsets? What are the parameters of the current system? 

![](/assets/2024-05-27/input-output-metrics.png)
<sub>You could check your weight every morning, and pose in front of the mirror every day. But it is not gonna get you any closer to your goal body.</sub>



## How do you measure...
### ...the quality of decisions?
The quality of a decision measured using input metrics. i,e: what goes in. A good quality decision is one that takes into account all kwown constraints and models the problem domain well. Doing this gives you the highest awareness of failure modes, and prioritise certain types of failures over others. It also helps you identify and avoid one-way doors, Modelling the problem domain and correctly identifying all the constraints is how a lot of mission-critical products: like airplanes, medical devices etc get built. Because you do not wait for on a plane to be up in the air or a patient to be hooked onto a device to uncover a specific failure mode.


![](https://imgs.xkcd.com/comics/voting_software.png)

<sub>[xkcd 2030](https://xkcd.com/2030/)</sub>

### ...the quality of outcomes?
On the other hand, the quality of an outcome is measured using output metrics: i.e. how well does your product solve the business problem at hand? How does it set the business and its customers up for success? Does it open new avenues and opportunities or does it rule them out? Does it walk through one-way doors or does it avoid them? 


## How are leaders evaluated?
Leaders are judged for the quality of their decisions. However, they are rewarded for the quality of their outcomes. 

Leaders get unlucky often. Luck does play a big part. However, reliance on luck, and the impact of bad luck can be minimised by modelling the problem domain as thoroughly as possible.

Therefore, a leader's job is to maximise the probablity of good outcomes by making good quality decisions.



