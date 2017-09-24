class Rectangle {
  private float sw, sh, sx, sy;
  float w, h, x, y, wgt; // scalar
  Rectangle parent;
  ArrayList<Rectangle> rows;
  
  Rectangle(float w, float h, float x, float y, float wgt) {
   this.w = this.sw = w;
   this.h = this.sh = h;
   this.x = this.sx = x;
   this.y = this.sy = y;
   this.wgt = wgt;
   rows = new ArrayList<Rectangle>();
   this.parent = null;
   
  }
  int getWidth() {
    return (int)(this.w * (this.parent == null ? (float)width : this.parent.getWidth()));
  }
  
  int getHeight() {
    return (int)(this.h * (this.parent == null ? (float)height : this.parent.getHeight()));
  }
  
  int getX() {
    return width * (int)(this.parent == null ? this.x : this.x + this.parent.getX());
  }
  
  int getY() {
    return height * (int)(this.parent == null ? this.y : this.y + this.parent.getY());
  }
  
  int worst() {
    int sAbsWid = (int)(this.sw * (float)getWidth());
    int sAbsHgt = (int)(this.sh * (float)getHeight());
    return min(sAbsWid, sAbsHgt);
  }
  
  private void vertLayoutRow(ArrayList<Float> weights) {
    float currY = 0, w = 0;
    for (int i = 0; i < weights.size(); i++) {
      float h = wgt * sh;
      w = wgt / h;
      Rectangle r = new Rectangle(w, h, 0, currY, weights.get(i));
      rows.add(r);
      currY += h;
    }
    this.sw -= w;
    this.sx += w;
  }
  
  private void horizLayoutRow(ArrayList<Float> weights) {
   float currX = 0, h = 0;
   for (int i = 0; i < weights.size(); i++) {
    float w = wgt * sw;
    h = wgt / w;
    Rectangle r = new Rectangle(w, h, currX, 0, weights.get(i));
    rows.add(r);
    currX += w;
   }
   
   this.sh -= h;
   this.sy += h;
  }
  
  void layoutRow(ArrayList<Float> weights) {
    int sAbsWid = (int)(this.sw * (float)getWidth());
    int sAbsHgt = (int)(this.sh * (float)getHeight());
    if (sAbsHgt < sAbsWid) {
      vertLayoutRow(weights);    
    } else {
      horizLayoutRow(weights);
    }
    
  }
  
  
 
}