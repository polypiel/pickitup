# Use Case: New Pickup

## Description
Registering the pick up of a cent is the paramount behaviour of the system.

## Actors
Users and owners

## Preconditions

## Basic Flow
 1. The user goes to the Pick form.
 2. Selects the coin type from a list.
 3. Sets the date and time. By default with the current date and time.
 4. Optionally adds a comment.
 5. The coordinates and textual location will be discovered automatically.

## Alternate Flows
 2. If the coin isn't in the list (i.e. an foreign coin) ...
 5. If there's no location service available the user will be able to set the textual location.

## Exceptional Flows

## Post Conditions
