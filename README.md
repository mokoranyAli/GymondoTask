# GymondoTask

## Contents

* [Overview]
* [Networking]
* [Architecture]
* [UI]
* [Dependencies]
* [Installation]


## Overview

App to show exercies list and every item in list has name and image if possible, then you can go to exercise details screen to see name of exercise, images of exercise if found and variations of exercises if found .. And if you select a variation you will go to variation details screen.

## Networking

Netwroking applied in APIService file using just URLSession with dataTaskPublisher to return Combine Publisher.


## Architecture

Task is implemented using MVVM with clean architecture.
Each entity has ViewModel, one use-case or more if needed, repository and service.

## UI

Task is implemented using both UIKit and SwiftUI .. Exercise list screen using UIKit and TableView with datsource and custom cell.
And Exerceise Details screen and Variation Details Screen are implemented using SwiftUI.

## Dependencies 

I used SDWebImage for rendering image on UIKit ImageView or Image in SwiftUI.

## Installation 

Just clone or download then cd to directory then pod install.


<!--- In file -->
[Overview]: #overview
[Networking]: #networking
[Architecture]: #architecture
[UI]: #additional
[Dependencies]: #dependencies
[Installation]: #installation
