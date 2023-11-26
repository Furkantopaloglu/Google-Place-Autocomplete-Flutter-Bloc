
# Flutter Google Place Autocomplete

  

This project aims to develop an application that uses the Google Place Autocomplete API with Flutter to list and mark the places that match the user’s input text.

![3](https://github.com/Furkantopaloglu/Google-Place-Autocomplete-Flutter-Bloc/assets/45017054/d553baa8-8409-423c-8261-394a1b25fcb3)

###  Video

[![ Google Place Autocomplete](http://img.youtube.com/vi/m2UkbQH-G30/0.jpg)](http://www.youtube.com/watch?v=m2UkbQH-G30  "Google Place Autocomplete")

  


## Usage

  

When you run the application, you will see a text field and a map. Enter a place name or address in the text field and you will see a list of matching places. When you select one of these places, it will be marked on the map. You can zoom in, zoom out or move the map.
  
  

## Setup

  

To run this project, you need to have the following requirements:

- A Google Maps API key (you can get it from https://developers.google.com/maps/documentation/places/web-service/get-api-key)


After downloading your project, run the following commands in the terminal:

  

- Install the dependencies with `flutter pub get`.

- Create the .env file with `flutter pub run envied` and add the line `TOKEN=YOUR_API_KEY` to it. (Replace YOUR_API_KEY with your own API key).
	- OR 
		- static const _key = 'YOUR_GOOGLE_PLACES_API_KEY'; (Replace YOUR_API_KEY with your own API key).

- Run the project with `flutter run`.

  


## Packages

  

I used the following packages in this project:

  

-  [envied]: Environment variable management for the API key

-  [json_annotation]: Helper classes to convert JSON data to Dart objects

-  [google_maps_flutter]: Flutter plugin to display maps

-  [dio]: Dart library to make HTTP requests

-  [flutter_bloc]: BLoC pattern to manage application state

-  [equatable]: Library to easily check the equality of objects

-  [stream_transform]: Helper functions to transform streams