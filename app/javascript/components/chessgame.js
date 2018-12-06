import { Chessground } from "chessground";
import Chess from 'chess.js'

const toggleBoardOrientation = () => {
 document.getElementById("board-toggle").addEventListener("click", () => {
    const chessgame = Chessground(document.getElementById("chessgame"));
    chessgame.toggleOrientation();
 });
};

const displayGameInitialPosition = () => {
 document.getElementById("pgn-reset").addEventListener("click", () => {
    const chessgame = Chessground(document.getElementById("chessgame"));
    chessgame.set( {fen: "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"});
 });
};

const movee4 = () => {
 document.getElementById("e4").addEventListener("click", () => {
  const chess = new Chess();
  const chessgame = Chessground(document.getElementById("chessgame"));
  chess.move("e4")
  chessgame.set( {fen: chess.fen()})

 });
};





export { toggleBoardOrientation };
export { displayGameInitialPosition };
export { movee4 };
