
nsq=9.98;
mdf=2.96;
diff = 3;
union()
{
difference(){
    square([nsq+2, 3*(nsq-diff) + 4], center=true);
    union(){
        translate([0, nsq+diff - 2,0]) square([mdf, nsq-diff],center=true);
        translate([0, -nsq-diff +2,0]) square([mdf, nsq-diff],center= true);
    }
}

translate([nsq-diff +2, 0,0])
    difference(){
        square([nsq+0-diff, nsq], center=true);
        square([nsq+0-diff,mdf],center=true);
    }

}