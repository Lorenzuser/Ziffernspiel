class UIOfGameLogic {  
  private char[][] colors = {{0, 255, 255},
                           {0, 200, 50},
                           {255, 210, 0},
                           {254, 138, 24},
                           {255, 0, 0}
                          };
  
  public Spielfeld game_logic;

  UIOfGameLogic() {
    game_logic = new Spielfeld();
  }
  
  public void showPattern() {
    fill(255);
    textFont(createFont("Georgia", 52));
    text("create this pattern", 1250, 50);
    textFont(createFont("Georgia", 64));
    for(int y = 0; y < 5; y++) {
      fill(colors[game_logic.get_goal_pattern(y) - 1][0], colors[game_logic.get_goal_pattern(y) - 1][1], colors[game_logic.get_goal_pattern(y) - 1][2]);
      rect(1175, 150*y + 100, 150, 150, 15);
      fill(255);
      text(game_logic.get_goal_pattern(y), 1250, 150*y+175);
    }
  }
    
  public void showCells(int clicked_cell_y, int clicked_cell_x) {
    try {
      background(50);
      showPattern();
      for(int y = 0; y < 5; y++) {
        for(int x = 0; x < 5; x++) {
          if(game_logic.get_game_map(y, x) == 0 || (y == clicked_cell_y && x == clicked_cell_x)) {
            continue;
          }
          fill(colors[game_logic.get_game_map(y, x) - 1][0], colors[game_logic.get_game_map(y, x) - 1][1], colors[game_logic.get_game_map(y, x) - 1][2]);
          rect(200*x, 200*y, 200, 200, 20);
          fill(255);
          text(game_logic.get_game_map(y, x), 200*x+100, 200*y+100);
        }
      }
    } catch(Exception e) {
      println(e + " in showCells()");
    }  
  }
      
  public void showClickedCell(int cell_y, int cell_x) {
    try {
      fill(colors[game_logic.get_game_map(cell_y, cell_x)-1][0], colors[game_logic.get_game_map(cell_y, cell_x)-1][1], colors[game_logic.get_game_map(cell_y, cell_x)-1][2]);
      rect(mouseX - 100, mouseY - 100, 200, 200, 20);
      fill(255);
      text(game_logic.get_game_map(cell_y, cell_x), mouseX, mouseY);
    } catch(Exception e) {
      println(e + " in showClickedCell()");
    }
  }
  
  public void showMovableSpaces(int clicked_cell_y, int clicked_cell_x) {
    try {
      for(int y = clicked_cell_y - 1; y <= clicked_cell_y + 1; y++) {
        for(int x = clicked_cell_x - 1; x <= clicked_cell_x + 1; x++) {
          if(y >= 0 && y < 5 && x >= 0 && x < 5 && !(y == clicked_cell_y && x == clicked_cell_x)) {
            if(game_logic.get_game_map(y, x) == 0) {
              fill(255, 0, 0);
              circle(x * 200 + 100, y * 200 + 100, 50);
            }
          }
        }
      }
    } catch(Exception e) {
      println(e + " in showMovableSpaces()");
    }
  }
          
  public void animationGameWon(int i) {
    try {
      background(50);
      showPattern();
      if(i >= 1000) {
        fill(255, 255, 0);
        text(" You won, press <<new game>>", 600, 500);
      } else {
        for(int y = 0; y < 5; y++) {
          for(int x = 0; x < 5; x++) {
            if(game_logic.get_game_map(y, x) == 0) {
              continue;
            }
            fill(colors[game_logic.get_game_map(y, x)-1][0], colors[game_logic.get_game_map(y, x)-1][1], colors[game_logic.get_game_map(y, x)-1][2]);
            rect(200*x, 200*y + i, 200, 200, 20);
            fill(255);
            text(game_logic.get_game_map(y, x), 200*x+100, 200*y+100 + i);
          }
        }
      }
    } catch(Exception e) {
      println(e + " in animationGameWon()");
    }
  }
}
