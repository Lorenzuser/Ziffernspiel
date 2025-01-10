class Spielfeld {  
  private int[] goal_pattern = new int[5];
  private int[][] game_map = new int[5][5];
  
  private boolean first_time_mouse_clicked = true; // weird workaround because mousePressed doesn't update while being in a loop
  private int[] clicked_cell; // necesarry for the same reason
  
  public int get_game_map(int y, int x) {
    try {
      return game_map[y][x];
    } catch(Exception e) {
      println(e + " in get_game_map()");
      return -1;
    }
  }
  
  public int get_goal_pattern(int i) {
    try {
      return goal_pattern[i];
    } catch(Exception e) {
      return -1;
    }
  }
  
  Spielfeld() {
    // fill game_map
    for(int i = 0; i < game_map.length; i++) {
      for(int j = 0; j < game_map[i].length; j++) {
        if(i == 2) {
          game_map[i][j] = 0;
        } else {
          game_map[i][j] = j+1;
        }
      }
    }
    // init random pattern
    do {
      newPattern();
    } while(checkGameWon());
  }
  
  public void newPattern() {
    for(int i = 0; i < goal_pattern.length; i++) {
      goal_pattern[i] = (int) random(1,6); //check if creates proper numbers
    }
  }
      
  public int[] getCellFromCoordinate() {
    int[] return_cell = {6,6};
    if(mouseX < 1000 && mouseX >= 0 && mouseY >= 0 && mouseY < 1000){
      return_cell[1] = mouseX/200;
      return_cell[0] = mouseY/200;
    }
    return return_cell;
  }
  
  public boolean checkGameWon() {
    try {
      int match_counter_row = 0;
      int match_counter_column = 0;
      int match_counter_row_upside_down = 0;
      int match_counter_column_upside_down = 0;
      // check zeilen
      for(int i = 0; i < goal_pattern.length; i++) {
        for(int j = 0; j < goal_pattern.length; j++) {
          if(game_map[i][j] == goal_pattern[j]) 
            match_counter_row++;
          if(game_map[j][i] == goal_pattern[j])
            match_counter_column++;
          if(game_map[i][4-j] == goal_pattern[j])
            match_counter_row_upside_down++;
          if(game_map[4-j][i] == goal_pattern[j])
            match_counter_column_upside_down++;
        }
        if(match_counter_row == 5 || match_counter_column == 5 || match_counter_row_upside_down == 5 || match_counter_column_upside_down == 5)
          return true;
        match_counter_row = match_counter_column = match_counter_row_upside_down = match_counter_column_upside_down = 0;
      }
      return false;
    } catch(Exception e) {
      println(e + "in checkGameWon()");
      return false;
    }
  }
    
    
  public boolean checkIfMovePossible(int origin_y, int origin_x, int goto_y, int goto_x) { //<>//
    try { //<>//
      if(game_map[goto_y][goto_x] != 0)
        return false;
      int vertical_step = abs(origin_y - goto_y);
      int horizontal_step = abs(origin_x - goto_x);
      if(vertical_step > 1 || horizontal_step > 1)
        return false;
      if((vertical_step == 1 || horizontal_step == 1))
        return true;
      return false;
    } catch(Exception e) {
      println(e + "in checkIfMovePossible ()");
      return false;
    }
  }
  
  public boolean set_clicked_cell__return_if_cell_clicked() {
    try {
      if(mousePressed) {
        if(get_first_time_mouse_clicked()) {
          set_clicked_cell(getCellFromCoordinate());
          if(get_clicked_cell(0) == 6 || get_game_map(get_clicked_cell(0), get_clicked_cell(1)) == 0) return false; //player just clicked randomly
          set_first_time_mouse_clicked(false);
          return true;
        }
      }
      return false;
    } catch(Exception e) {
      println(e + "in set_clicked_cell__return_if_cell_clicked()");
      return false;
    }
  }
  
  public void moveCellInGamemap() {
    try {
      int[] goto_cell = getCellFromCoordinate();
      if(goto_cell[0] != 6) { //check if actually droped upon a real cell
        if(checkIfMovePossible(clicked_cell[0], clicked_cell[1], goto_cell[0], goto_cell[1])) {
          game_map[goto_cell[0]][goto_cell[1]] = game_map[clicked_cell[0]][clicked_cell[1]];
          game_map[clicked_cell[0]][clicked_cell[1]] = 0;
        }
      }
    } catch(Exception e) {
      println(e + "in moveCellInGamemap()");
    }
  }
  
  public boolean get_first_time_mouse_clicked() {
    return first_time_mouse_clicked;
  }
  
  public void set_first_time_mouse_clicked(boolean val) {
    first_time_mouse_clicked = val;
  }
  
  public int get_clicked_cell(int i) {
    try {
      return clicked_cell[i];
    }
    catch(Exception e) {
      println(e + " in get_clicked_cell");
      return -1;
    }
  }
  
  public void set_clicked_cell(int[] val) {
    try {
      if(val.length == 2) {
        clicked_cell = val;
      } else { //<>//
        println("invalid length for val ");
      }
    } catch(Exception e) {
      println(e + " in set_clicked_cell()");
    }  
  }
}
