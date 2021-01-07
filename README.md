Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

Task
-----

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

The code should defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

# My apporach
Given the user stories above I firstly planned the structure of my classes.

- I planned the basic structure of the code by breaking down the given user stories into classes and methods by extracting the nouns and verbs. For readablilty and to siplify the code as much as possible I decided to have three classes: Airport, Plane and Weather.

| Class   | Attributes                              | Methods                   |
|---------|-----------------------------------------|---------------------------|
| Airport | - runway = [ ]<br>- capacity = capacity | - land<br>- take_off      |
| Plane   | - flying = true                         | - land<br>- take_off |
| Weather | - weather = rand(..)                    | - stormy                  |           |  

- I then diagrammed and predicted how each class would work together. 

![Imgur](https://imgur.com/zFQRHUf.png)
