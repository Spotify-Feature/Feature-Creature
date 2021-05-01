Original App Design Project - README 
===

# Spotify Feature Creature

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
- [x] User can login - authenticate existing Spotify account.
- [x] User can register a new account.
- [ ] User stays logged in across restarts. 
- [ ] User can log out. 
- [ ] User can view their profile.
- [ ] User can choose an audio feature for their music (Mood, Properties, Context).
    * Ex. User can access the mood of the songs on their playlist: Danceability, Valence, Energy, Tempo
- [ ] User can create a post related to the current music they are listening to and link the song/playlist.

**Optional Nice-to-have Stories**

- [ ] User can follow other users
- [ ] User can view friend's/follower's playlists to analyze their music's features
- [ ] User can search for highest feature (Ex: Most energetic song)
- [ ] User can match with others based on similar music taste through similar features
- [ ] User can post snippets of songs or quote lyrics

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
* Search - User can filter for posts about specific music or look in categories (i.e. Energetic, Sad, etc.)
   * Stream
* Creation
   * Stream
* Profile
   * Detail

## Wireframes
<img width="500" alt="Screen Shot 2021-04-16 at 9 35 34 PM" src="https://user-images.githubusercontent.com/56771256/115098012-8e851b80-9efb-11eb-952c-e769777e814b.png">

### [BONUS] Digital Wireframes & Mockups
<img src="https://user-images.githubusercontent.com/29981064/115094930-62fb3480-9eed-11eb-872e-70c82b76e809.png" width=600>
<img src="https://user-images.githubusercontent.com/29981064/115094939-727a7d80-9eed-11eb-922b-176c426e337b.png" width=600>

## Schema 

### Models
**Post** (Discover Screen)
| Property  | Type | Description |
| ------------- | ------------- | ------------- |
| clientID     | String | ID for user (handle)                                |
| author       | Pointer to User | user's display name                        |
| objectID     | String | ID for user post                                    |
| caption      | String | a text box for user post                            |
| image        | File   | user of post's profile image                        |
| likesCount   | Number | number of likes on a post                           |
| commentsCount| Number | count of comments on a post                         |
| postTime     | DateTime (String) | displays how long ago post was published |

### Networking

* Register Screen
    ```
   let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
         user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
* Login Screen
   ```
   let username = usernameField.text!
   let password = passwordField.text!
        
   PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
        if user != nil {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
         }
         else {
            print("Error: \(error?.localizedDescription)")
         }
      }
        
* Create post screen
   * (Create/POST) Create a new post object 
    ```
    let post = PFObject(className: "Posts")
    post["caption"] = commentField.text!
    post["author"] = PFUser.current()!
 
    post.saveInBackground { (success, error) in
       if success {
          self.dismiss(animated: true, completion: nil)
          print ("saved!")
       } else {
          print("error!")
       }
   }

* Home Screen 
   * (Create/POST) Create a new like on a post
     ```
      var likes = PFObject(className:"Likes")
      
      likes["post"] = selectedPost
      likes["author"] = PFUser.current()!
      selectedPost.add(likes, forKey: "likes")
      // Saves the new object.
      selectedPost.saveInBackground {
      (success: Bool, error: Error?) in
      if (success) {
         print ("Comment saved")
      } else {
         print ("Error saving comment")
      }

   * (Create/POST) create a new comment on a post
    ```
      var comment = PFObject(className:"Comments")
      comment["text"] = text
      comment["post"] = Post
      comment["author"] = PFUser.current()!
  Post.add(comment, forKey: "comments")
   // Saves the new object.
   Post.saveInBackground {
   (success: Bool, error: Error?) in
   if (success) {
      print ("Comment saved")
   } else {
      print ("Error saving comment")
   }

**Existing API Endpoints**
- Spotify API Base URL - https://spotify.github.io/ios-sdk/html/

| HTTP Verb  | Endpoints | Description |
| ------------- | ------------- | ------------- |
| GET | SPTAppRemoteAlbum | gets album name and URI  |
| GET | SPTAppRemoteArtist | gets artist's name and URI |
| GET | SPTAppRemoteTrack | gets current track's name URI, duration, artist, album, if it's saved, and what episode and podcast |
| GET | SPTAppRemotePlayerAPI | gets Spotify player |
| GET | imageAPI | gets images from Spotify app |
| GET | userAPI  | gets user data from Spotify app |


## Video Walkthrough

Walkthrough of implemented user stories for sprint 1:

<img src='http://g.recordit.co/mboRNjyhLr.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


