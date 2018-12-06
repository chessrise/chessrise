import { Chessground } from "chessground";
import Chess from 'chess.js'

const toggleBoardOrientation = () => {
 document.getElementById("board-toggle").addEventListener("click", () => {
    const chessgame = Chessground(document.getElementById("chessgame"));
    chessgame.toggleOrientation();
 });
};

const toDests = (chess) => {
  const dests = {};
  chess.SQUARES.forEach(s => {
    const ms = chess.moves({square: s, verbose: true});
    if (ms.length) dests[s] = ms.map(m => m.to);
  });
  return dests;
}

const toColor = (chess) => {
  return (chess.turn() === 'w') ? 'white' : 'black';
};

const playOtherSide = (cg, chess) => {
  return (orig, dest) => {
    chess.move({from: orig, to: dest});
    cg.set({
      turnColor: toColor(chess),
      movable: {
        color: toColor(chess),
        dests: toDests(chess)
      }
    });
  };
}

const initialPosition = () => {
  const chess = new Chess();
  const cg = Chessground(document.getElementById("chessgame"),
   {movable: {
      color: 'white',
      free: false,
      dests: toDests(chess)
      }
    }
  );

  cg.set( {movable: {
    events: { after: playOtherSide(cg, chess) }
    }
  });
  return cg;
};

const displayGameInitialPosition = () => {
 document.getElementById("pgn-reset").addEventListener("click", () => {
  initialPosition()});
};


const playNextMove = (chess, cg, moves) => {
  document.getElementById("next-move").addEventListener("click", () => {
    console.log("next");
    console.log(moves.length-1);
    if (i <= moves.length) {
      console.log(i);
      chess.move(moves[i].innerText);
      cg.set( { fen: chess.fen() } );
      if (i< moves.length) {
        i += 1;
        console.log(i);
      }
      return cg;
    };
  });
};

const playPreviousMove = (chess, cg, moves) => {
  document.getElementById("previous-move").addEventListener("click", () => {
    console.log("previous");
    if (i > 0) {
      console.log(moves[i].innerText);
      chess.undo();
      cg.set( { fen: chess.fen() } );
      console.log(i)
      i -= 1;
      return cg;
    }
  });
};

let i = 0;
const arrowControls = () => {
  const moves = document.querySelectorAll(".moves");
  const chess = new Chess();
  const cg = Chessground(document.getElementById("chessgame"));
  playNextMove(chess, cg, moves);
  playPreviousMove(chess, cg, moves);
}

export { toggleBoardOrientation };
export { displayGameInitialPosition };
export { initialPosition };
export { arrowControls };










