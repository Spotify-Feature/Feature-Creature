Original App Design Project - README 
===

# Spotify Feature

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Analyzes the different features of a Spotify user's songs and playlists, and allows them to share with friends/followers through created posts.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Social Networking/Music
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on a computer. Functionality wouldn’t be limited to mobile devices, however mobile version could potentially have more features.
- **Story:** Analyzes Spotify users' music features, and connects them to other users with similar features. The user can follow other users, and create posts about their playlists and favorite music.
- **Market:** Anyone could choose to use this app, particularly music enthusiasts, and Spotify users. 
- **Habit:** This app could be used as often or unoften as the user wanted depending on how passionate they are about their music choices and their curiosity to discover new music through others. 
- **Scope:** First, we would start with allowing users to choose which particular features of their songs they would like to see. Then, they could share their stats through a post or create a post related to any song/playlist, and link it.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can login - authenticate existing Spotify account
* User can register a new account
* User can choose an audio feature for their music (Mood, Properties, Context)
    * Ex. User can access the mood of the songs on their playlist: Danceability, Valence, Energy, Tempo
* User can view their profile
* User can create a post related to the current music they are listening to and link the song/playlist

**Optional Nice-to-have Stories**

* User can follow other users
* User can view friend's/follower's playlists to analyze their music's features
* User can search for highest feature (Ex: Most energetic song)
* User can match with others based on similar music taste through similar features
* User can post snippets of songs or quote lyrics

### 2. Screen Archetypes

* Login
* Register - User signs up or logs in to existing Spotify account (authentication)
   * Upon Download/Reopening of the app, the user is prompted to log in to gain access to their profile information
   * User can register a new account - link to create a Spotify account
* Profile  
    * User can scroll through their own profile of their songs and playlists
* Detail
    * User can view detailed audio features of each song on their playlist
* Creation
    * User can create a post 
* Stream
    * User can scroll through posts of their followers

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Stream
* Profile
* Search
* Detailed Profile

**Flow Navigation** (Screen to Screen)

* Login
   * Stream
* Register - User signs up or logs in to existing Spotify account (authentication)
   * Stream
* Stream - User can scroll through posts of their followers
   * Detail?
* Search - User can filter for posts about specific music or look in catagories (i.e. Energetic, Sad, etc.)
   * Stream
* Creation
   * Stream
* Profile
   * Detail

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://user-images.githubusercontent.com/29981064/115094930-62fb3480-9eed-11eb-872e-70c82b76e809.png" width=600>
<img src="https://user-images.githubusercontent.com/29981064/115094939-727a7d80-9eed-11eb-922b-176c426e337b.png" width=600>


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
