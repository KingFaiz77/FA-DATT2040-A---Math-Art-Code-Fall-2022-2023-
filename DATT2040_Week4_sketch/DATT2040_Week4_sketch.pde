//import processing.pdf.*;

//Past color palette in this zone below>>|-------------------------------------------------------------|
                          color[] cols = { #FF1A60, #F0829B, #F7DBA5, #B8D0EB, #84B082, #3891A6, #B8D0EB };
color bgCol = #F2F2EB;
//other color palettes bellow // original is here >>  | #FF1A60, #F0829B, #F7DBA5, #B8D0EB, #84B082, #3891A6, #B8D0EB |  Art piece

//Palette2: | #03B5AA, #037971, #023436, #00BFB3, #049A8F, #009FB9, #47F1E2 |  Blue ocean   10/10

//Palette3: | #461220, #8C2F39, #9F0A41, #B23A48, #FCB9B2, #FDC5B7, #FED0BB |  Pink         7/10

//Palette4: | #8E9AAF, #ADADC1, #CBC0D3, #EFD3D7, #F7DFE9, #FEEAFA, #DEE2FF |  Artic punch  7.9/10

//Palette5: | #c4f7fc, #FFFC95, #364446, #53686a, #3B6064, #8bb0b3, #a8d3d8 |  Lightning    8.2/10

//Palette6: | #001514, #FBFFFE, #B38281, #6B0504, #A3320B, #C5711D, #E6AF2E |  Safari       9.9/10

//Palette7: | #8DAA91, #788475, #6B5E69, #655E63, #5E5D5C, #453643, #28112B |  Spooky       8.5/10

//Palette8: | #CCFBFE, #CDE9EE, #CDD6DD, #CDCACC, #CDACA1, #CD9B94, #CD8987 |  Sand&water   6.5/10

//Palette9: | #DAD2D8, #143642, #0F8B8D, #7E935B, #EC9A29, #CA5D22, #A8201A |  Harmonie     10/10

//Palette10: | #562C2C, #F2542D, #F49A74, #F5DFBB, #82BAA8, #0E9594, #127475 | Fall         10/10

//Palette11: | #83B692, #BED0DA, #F9ADA0, #F9627D, #C65B7C, #91496A, #5B3758 |  Pink        9.8/10


long seed;

float margin = 50;
int count = 1000;  
Line[] lines = new Line[count];

float noiseScale = 2000, noiseStrength = 10;
float curlx, curly;

void setup() {
  size(850, 850);
  
  seed = (long)random(1000);
  println(seed);
  randomSeed(seed);
  noiseSeed(seed);
  
  
  background(bgCol);
  
  curlx = randomGaussian() + width/2;
  curly = random(margin, height-margin);
  
  for (int n = 0; n < lines.length; n++) {
    lines[n] = new Line();
  }
  
  //noLoop();
  
}

void draw() {
  for (Line a : lines) {
    a.display();
    a.update();
    
    //if(frameCount%150 >= 149){
      //saveFrame("####_out.png");
      //Uncomment the 2 lines above to save an image frame in your folder
    //}
  }
}
