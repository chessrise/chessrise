import { Chessground } from "chessground";

function initChessground() {
  if(document.getElementById("chessgame")) {
    const options = { movable: {free: true}, addPieceZIndex: true};
    const chessgame = Chessground(document.getElementById("chessgame"),options);
  // Chessground(document.body, config: Config);
  }
}

export { initChessground };
