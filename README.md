# LostAndFound

## What is this?
A repo for this game jam: https://itch.io/jam/neurosama-birthday-game-jam

with the theme : LOST AND FOUND

I'm using the repo description as a GDD because

Edit: it's now 4 hours till deadline and I've spent most of the day designing mechanics rather than coding stuff - which means I'm dropping out :S

## What's the plan?

I want to make a card game - in about 31 hours as of writing this (sleep not included) - and I don't feel like working with humans at the moment, so I'm going alone.

So the plan is to create a simple single-player card game like Cultist Simulator (aka CS) - but different. I don't like the real-time clocks from CS, as well as how hectic it becomes with scale.

I want this game to be primarily a game about the choices where the player collects information about the game world to make better decisions.

## How will it be connected to the theme?

I feel like going with a dual approach.

I want Finding and Losing to be mechanics in-game - Finding would work like the Discover mechanic in Hearthstone (the player is presented with up to 3 cards from a specific group, from which they get to keep one), while Losing... not sure yet, will update later hopefully.

What I also want to explore in the story is the concept of what makes one "self". So memories - both impactful and seemingly insignificant, stuff that triggers memories, self-discovery, self-sacrifice for self and for others.

All of the above will be connected by the concept of **LOSING** what makes people what they are as well as **FINDING** out stuff about the dream world and other agents.

## The Story

Game starts with an announcement that "the ritual was successful", and that "you have breached the dream world". The player needs to **FIND** their way to *something*, or risk becoming **LOST** like the countless soles that ventured here before.

The game takes place in a dream world where time works funny. 

Edit: I've been cycling through various ideas, and at some point the concept of including mental disorders (like depression and mania) into the story really stuck with me.

## Art style

Programmer art in various forms. Animating 2D card movement is a pain so I'll go with 3D cards in a 2D world. Probably flat 2D game world. 2D shader VFX.

## Core mechanics (needs to work ASAP)

- Cards - need to be draggable, need to interact with other objects - also various types of cards

- Card holding - a way to keep cards in hand and drag them out of hand / in to stuff

- Card types - so far I got hand cards (the ones the player can drag on stuff to interact), deck cards (representing random stuff that the player has to deal with) and board cards (stuff that sits on board and can be interacted later + might last only X card draws before something happens)

- Board - where the game takes place an where deck and board cards live.

- Printing messages to the player - subtitles are optional for the player, not the creator

- Deck building / drafting - before the game starts the player needs to make choices that define their game deck. Currently I see it as selecting 2-4 groups of around 6-10 cards each that will make the game deck. (it should probably be a blind pick on first run with a "more details" option that allows to see what cards will be added by each choice)

- Movement - static screen game - so no movement, only dragging stuff around

- Fail state - game ends when player has no cards in hand or when they exceed their hand size (no classical health points will exist)

## Bonus mechanics (stuff that could be cool, but is non-essential

- 4 key stats - I'm thinking something as general as 2 power centric attributes (example offense/defense) and 2 stamina centric attributes (example stamina bar size/stamina bar regeneration)

- Collecting data on opponents - details such as the time period from which they come, likes / dislikes
