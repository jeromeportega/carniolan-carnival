/// @description Boss Movement
// You can write your code in this editor

function wasp_movement(_speed, _bounce_angle) {
/// @description  Move around the room randomly avoiding walls and objects
/// @param  Speed
/// @param  BounceAngle

	// Define local variables for this script
	var i;
	var spd		=	_speed; // The speed to move the object
	var ang		=	_bounce_angle; // Bounce angle, will prevent us from moving along the walls (I recomend 5)

	var top		=	0;
	var bottom	=	room_height / 4;
	var left	=	0; 
	var right	=	room_width;
	var hit		=	array_create(5,false); // Here we create an array for our five different types of collisions or "hits"

	// Make sure we are checking colisisons based on center origin
	var x_middle	= (sprite_width/2);
	var y_middle	= (sprite_height/2);
	var prev_offx	= sprite_xoffset;
	var prev_offy	= sprite_yoffset;

	if ((sprite_xoffset != x_middle) || (sprite_yoffset != y_middle)) {
		sprite_set_offset(sprite_index,x_middle,y_middle);
	}

	// Setup hitboxes near the walls to detect our object
	hit[0]		=	point_in_rectangle(x,y,left,top,right,top+y_middle);		// collision with Top Zone
	hit[1]		=	point_in_rectangle(x,y,left,bottom-y_middle,right,bottom);	// collision with Bottom Zone
	hit[2]		=	point_in_rectangle(x,y,left,top,left+x_middle,bottom);		// collision with Left Zone
	hit[3]		=	point_in_rectangle(x,y,right-x_middle,top,right,bottom);	// collision with Right Zone


	// If we hit any "wall" or come in contact with foriegn object-
	// -adjust course randomly in opposite direction while factoring bounce angle
	if (hit[0] || hit[1] || hit[2] || hit[3]) {
	
		// Correct our direction to avoid collisions while compensating our defined bounce angle
		for (i = 0; i < 5; i++) {
			if hit[i] {
				switch i {
					case 0: // Hit Top
					do { move_towards_point(x,y+sprite_height,speed); } until point_distance(x,y,x,(y+sprite_height)+1);
					direction = (irandom_range(360-ang,180+ang));
					speed = 0;
					break;
				
					case 1: // Hit Bottom
					speed = 0;
					do { move_towards_point(x,y+sprite_height,speed); } until point_distance(x,y,x,(y-sprite_height)-1);
					direction = (irandom_range(180-ang,0+ang));
					speed = 0;
					break;
				
					case 2: // Hit Left
					do { move_towards_point(x,y+sprite_height,speed); } until point_distance(x,y,(x+sprite_width)+1,y);
					direction = (irandom_range(90-ang,(-90)+ang));
					speed = 0;
					break;
				
					case 3: // Hit Right
					do { move_towards_point(x,y+sprite_height,speed); } until point_distance(x,y,(x-sprite_width)-1,y);
					direction = (irandom_range(90+ang,270-ang));
					speed = 0;
					break;
				}
			}
		}
	}

	// Accelerate to set speed if we are topped
	if (speed < spd) {
		speed++;
	}

// Reset sprite origin to what it was
	sprite_set_offset(sprite_index,prev_offx,prev_offy);
}

wasp_movement(5,5);
