mdf =2.98;
n = 14;
length_rail = 200;
tail_rail = 100;

axis_length = 180;
width = 40;
space_roll = 9;
steps = 25;
module rail(axis_length=190, space_roll=9){
square([axis_length, space_roll], center=true);
//right side
translate([axis_length/2,0,0]) circle(r=space_roll/2,center=true);
//lefth side
translate([-axis_length/2,0,0]) circle(r=space_roll/2,center=true);
}

module pieza_general(length_rail = 200,tail_rail = 100, width=30){
difference(){
    rail(length_rail + tail_rail,width);
//square([length_rail + tail_rail, width], center=true);
    translate([-length_rail/2 + tail_rail/2,-width/4+ mdf,0])
    rail();
}
}

module main_body(n,steps,mdf,width){
difference(){
pieza_general();
    //unions with triangles
    for(i=[0:n]){
    translate([ -steps*(i-6), width/2 - mdf]) square([mdf, 3*mdf],center=true);
        if(i >= 0 && i<= 2){
       mirror([0,1,0]){
            translate([ -(steps - 10)*(i-6), width/2 - mdf]) square([mdf, 3*mdf],center=true);
        }
      }
    }
    
}
}

support_w =20;
difference(){
main_body(n=14,steps=25,mdf=2.98,width=30);
 translate([length_rail/2 + steps,-width/4,0]) square([support_w, mdf],center=true);
    
 translate([length_rail/2 ,-width/4 + steps/4 + mdf,0]) rotate([0,0,90]) square([support_w/2, mdf],center=true);
    
  translate([length_rail/2 + width + steps/2 ,-width/4 + steps/4 + mdf,0]) rotate([0,0,90]) square([support_w/2, mdf],center=true);
}

