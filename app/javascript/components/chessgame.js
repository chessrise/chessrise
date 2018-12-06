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
    console.log(moves[i].innerText);
    chess.move(moves[i].innerText);
    cg.set( { fen: chess.fen() } );
    i += 1;
    return cg;
    });
};

const playPreviousMove = (chess, cg, moves) => {
  document.getElementById("previous-move").addEventListener("click", () => {
    console.log(moves[i].innerText);
    // chess.move(moves[i].innerText);
    chess.undo();
    cg.set( { fen: chess.fen() } );
    i -= 1;
    return cg;
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

// const makeTextMove = (chess, cg, move) => {
//   chess.move(move.innerText);
//   cg.set( {fen: chess.fen() } );
//   return cg;
// };


// const printMoves = () => {
//   const chess = new Chess();
//   const chessgame = Chessground(document.getElementById("chessgame"));
//   const moves = document.querySelectorAll(".moves");
//   moves.forEach( move => {
//     setInterval( makeTextMove(chess, chessgame, move ), 3000 );
//   });
// };


export { toggleBoardOrientation };
export { displayGameInitialPosition };
export { initialPosition };
// export { playNextMove };
// export { playPreviousMove };
export { arrowControls };
// export { printMoves };









