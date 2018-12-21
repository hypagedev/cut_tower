use <rail_crane.scad>

module main_body_up(n=14,steps=25,mdf=2.98, width=40){
    //unions with triangles
    for(i=[0:n]){
    translate([ -steps*(i-6),width/4,0]) square([mdf, 3*mdf],center=true);
    }
}
length_rail = 200;
tail_rail = 100;

axis_length = 180;
width = 30;
difference(){
    rail(length_rail + tail_rail,width/2);
    main_body_up(14, 25, 2.98, width/2);


}