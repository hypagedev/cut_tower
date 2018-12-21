diam = 40;
module main_sq(diam=40, fitline=6){
difference(){
    //first square
    square(diam, center=true);
    //hole
    square(diam/2 , center = true);
    
}
//add the diagomal
rotate([0,0,55])
    square([fitline,diam], center=true);

}

module cortes(nsq=9.98, mdf=2.96){
union(){
    
//lateral cut: first
  translate([diam/2 - nsq/2 + 3 ,0,0])
    square([nsq - 3, mdf], center=true);  
   
//lateral cut: second

  translate([-diam/2 + nsq/2 - 3 ,0,0])
    square([nsq - 3, mdf], center=true);

//lateral cut: thirst
  translate([0,diam/2 - nsq/2 + 3 ,0])
    square([mdf, nsq - 3], center=true); 
    
//lateral cut: fourth
 translate([0,-diam/2 + nsq/2 - 3 ,0])
    square([mdf, nsq - 3], center=true); 
    
//first cut
translate([diam/2 - nsq/2 + 3 ,diam/2 - nsq/2,0])
square([nsq - 3, mdf], center=true);
mirror([0,1,0])
{
    //second cut
    translate([diam/2 - nsq/2 + 3,diam/2 - nsq/2,0])
     square([nsq - 3, mdf], center=true);
}
mirror([1,0,0])
{
    //third cut
    translate([diam/2 - nsq/2 + 3,diam/2 - nsq/2,0])
    square([nsq - 3, mdf], center=true);
}
mirror([1,0,0])
mirror([0,1,0])
{
    //forth cut
    translate([diam/2 - nsq/2 + 3 ,diam/2 - nsq/2,0])
    square([nsq - 3, mdf], center=true);
}
}
}

difference(){
    main_sq();
    cortes();
}