shader_type spatial;


void fragment(){

}

void vertex(){
	VERTEX.y += sin(VERTEX.x+TIME*2.0)*VERTEX.x*0.03;
	VERTEX.x += sin(VERTEX.y+TIME*2.0)*VERTEX.y*0.03;
	

}