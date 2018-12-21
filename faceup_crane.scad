diam = 35;
diff = 6;

module triangle_base(diam=35, diff=6){
difference(){
//main
circle(r=diam/2, $fn=3, center=true);
//hole of main triangle
circle(r=diam/2 - diff, $fn=3, center=true);
    
}

//lines of triangle
rotate([0,0,30])
    translate([0,-diff/2,0])
        square([diff/2, diam/4],center=true);

rotate([0,0,150])
    translate([0,-diff/2,0])
        square([diff/2, diam/4],center=true);

rotate([0,0,270])
    translate([0,-diff/2,0])
        square([diff/2, diam/4],center=true);
}

//nsq=9.98; mdf=2.96;
module cuad_sup(nsq=9.98, mdf=2.96){
{
    difference(){
        square([nsq, nsq],center=true);
        translate([mdf,0,0])
        square([mdf*2, mdf],center=true);
    }
}
}

mdf=2.96;
difference(){
triangle_base();
circle(r=1, $fn=100,center=true);
}
translate([diam/2,0,0]) cuad_sup();
rotate([0,0,180]) translate([diam/2 - mdf*2,diam/2 - mdf,0]) cuad_sup();

mirror([0,1,0]){
    rotate([0,0,180]) translate([diam/2 - mdf*2,diam/2 - mdf,0]) cuad_sup();

}