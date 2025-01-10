UIOfGameLogic game = new UIOfGameLogic();
Button new_game_button = new Button("new game", 1100, 875, 300, 100, 15);



long first_iteration_won_time; // again a workaround because processing-function don't work properly while you are in loop of significant length
boolean first_iteration_won = true;

public void updateGame() { 
  if(mousePressed) {
    if(game.game_logic.get_first_time_mouse_clicked()) {
      game.game_logic.set_clicked_cell(game.game_logic.getCellFromCoordinate());
      if(game.game_logic.get_clicked_cell(0) == 6 || game.game_logic.get_game_map(game.game_logic.get_clicked_cell(0), game.game_logic.get_clicked_cell(1)) == 0) {
        if(new_game_button.getClicked())
          game = new UIOfGameLogic();
        return;
      }
      game.game_logic.set_first_time_mouse_clicked(false);
    }
    game.showCells(game.game_logic.get_clicked_cell(0), game.game_logic.get_clicked_cell(1));
    game.showMovableSpaces(game.game_logic.get_clicked_cell(0), game.game_logic.get_clicked_cell(1));
    game.showClickedCell(game.game_logic.get_clicked_cell(0), game.game_logic.get_clicked_cell(1));
  } else {
    if(!game.game_logic.get_first_time_mouse_clicked()) {
      game.game_logic.moveCellInGamemap();
      game.game_logic.set_first_time_mouse_clicked(true);
    }
    game.showCells(6, 6);
  }
  
}
  
void setup() {
    size(1500, 1000);
    // Create the font
    textFont(createFont("Georgia", 64));
    textAlign(CENTER, CENTER);
    
    new_game_button.createButton();
}

void draw() {
  if(game.game_logic.checkGameWon()) {
      if(first_iteration_won) {
        first_iteration_won_time = System.currentTimeMillis();
        first_iteration_won = false;
      }
      game.animationGameWon((int) (System.currentTimeMillis() - first_iteration_won_time) / 2);
      if(new_game_button.getClicked()) 
        game = new UIOfGameLogic();
  } 
  else {
    updateGame();
    first_iteration_won = true;
  }
  new_game_button.createButton();
}
