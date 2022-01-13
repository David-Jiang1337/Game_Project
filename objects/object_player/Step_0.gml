/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

//keyboard checks
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));

var interactButton = keyboard_check_pressed(ord("F"));

//movement variables
var xdirection = right - left;
var ydirection = down - up; //these works because booleans are automatically converted to binaries in this context

var xdisplacement = (moveSpeed*global.realTime)*xdirection;
var ydisplacement = (moveSpeed*global.realTime)*ydirection;




//item interaction (this is implemented in player and not entity because only the player should be able to interact with items)
var nearestItem = instance_nearest(x,y,object_interactable);

//update functions

move(xdisplacement, ydisplacement);
checkInteract(nearestItem, interactButton);

