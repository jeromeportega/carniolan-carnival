// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wasp_movement(_speed, _bounce_angle) {
/// @description  Move around the room randomly avoiding walls and objects
/// @param  Speed
/// @param  BounceAngle

	// Define local variables for this script
	var i;

	var top		=	0;
	var bottom	=	room_height / 4;
	var left	=	0; 
	var right	=	room_width;
	var hit		=	array_create(5,false); // Here we create an array for our five different types of collisions or "hits"

	// Make sure we are checking collisions based on center origin
	var x_middle	= (sprite_width/2);
	var y_middle	= (sprite_height/2);
	var prev_offx	= sprite_xoffset;
	var prev_offy	= sprite_yoffset;

	if ((sprite_xoffset != x_middle) || (sprite_yoffset != y_middle)) {
		sprite_set_offset(sprite_index,x_middle,y_middle);
	}

	// Setup hitboxes near the walls to detect our object
	hit[0] = point_in_rectangle(x,y,left,top,right,top+y_middle);		// collision with Top Zone
	hit[1] = point_in_rectangle(x,y,left,bottom-y_middle,right,bottom);	// collision with Bottom Zone
	hit[2] = point_in_rectangle(x,y,left,top,left+x_middle,bottom);		// collision with Left Zone
	hit[3] = point_in_rectangle(x,y,right-x_middle,top,right,bottom);	// collision with Right Zone


	// If we hit any "wall" or come in contact with foriegn object-
	// -adjust course randomly in opposite direction while factoring bounce angle
	if (hit[0] || hit[1] || hit[2] || hit[3]) {
	
		// Correct our direction to avoid collisions while compensating our defined bounce angle
		for (i = 0; i < 5; i++) {
			if hit[i] {
				switch i {
					case 0: // Hit Top
					direction = (irandom_range(360-_bounce_angle,180+_bounce_angle));
					speed = 0;
					break;
				
					case 1: // Hit Bottom
					speed = 0;
					direction = (irandom_range(180-_bounce_angle,0+_bounce_angle));
					speed = 0;
					break;
				
					case 2: // Hit Left
					direction = (irandom_range(90-_bounce_angle,(-90)+_bounce_angle));
					speed = 0;
					break;
				
					case 3: // Hit Right
					direction = (irandom_range(90+_bounce_angle,270-_bounce_angle));
					speed = 0;
					break;
				}
			}
		}
	}

	if (speed < _speed) {
		speed++;
	}

	// Reset sprite origin to what it was
	sprite_set_offset(sprite_index,prev_offx,prev_offy);
}
