class Row {
  private int width;
  private ArrayList<Rectangle> rects;

  public Row(int width) {
    this.width = width;
    this.rects = new ArrayList<Rectangle>();
  }

  public Boolean isEmpty() {
    return rects.isEmpty();
  }

  public void append(Rectangle r) {
    rects.add(r);
  }

  public Rectangle pop() {
    if (this.isEmpty()) {
      throw new IndexOutOfBoundsException();
    }
    return rects.remove(rects.size() - 1);
  }
  
  public float worst() {
    if (this.isEmpty()) {
      return 0;
    }
    
    float s = 0;
    float rmin = this.rects.get(0).getWeight();
    float rmax = rmin;
    for (Rectangle r : this.rects) {
      float wgt = r.getWeight();
      s += wgt;
      if (wgt < rmin) {
        rmin = wgt;
      } else if (wgt > rmax) {
        rmax = wgt;
      }
    }
    
    return max((pow(this.width, 2) * rmax) / pow(s, 2), 
               pow(s, 2) / (pow(this.width, 2) * rmin));
  }
  
  public void draw() {
  }
}