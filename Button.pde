class Button {
  private String name_tag = "Button";
  private int[] rect_data = new int[5];
  
  public void createButton() { //constructor does not allow you to use processing-function, this workaround is used in mutliple occasions
    fill(100);
    rect(rect_data[0], rect_data[1], rect_data[2], rect_data[3], rect_data[4]);
    fill(255);
    text(name_tag, rect_data[0] + rect_data[2] / 2, rect_data[1] + rect_data[3] / 2 - 10);
  }
  
  Button (String _name_tag, int pos_x, int pos_y, int size_x, int size_y, int roundness) {
    name_tag = _name_tag;
    rect_data[0] = pos_x;
    rect_data[1] = pos_y;
    rect_data[2] = size_x;
    rect_data[3] = size_y;
    rect_data[4] = roundness;
  }
  
  public boolean getClicked() {
    if(mousePressed) {
      if(mouseX >= rect_data[0] && mouseX <= rect_data[0] + rect_data[2] && mouseY >= rect_data[1] && mouseY <= rect_data[1] + rect_data[3])
        return true;
    }
    return false;
  }
}
