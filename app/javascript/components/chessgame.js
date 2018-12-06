import { Chessground } from "chessground";
import Chess from 'chess.js'

const toggleBoard = (cg) => {
    cg.toggleOrientation();
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

const initialPosition = (chess) => {
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

const playNext = (chess, cg, moves) => {
    if (i < moves.length) {
      console.log(i);
      chess.move(moves[i].innerText);
      cg.set( { fen: chess.fen() } );
      i += 1;
    };
};

const playPrevious = (chess, cg, moves) => {
    if (i > 0) {
      chess.undo();
      cg.set( { fen: chess.fen() } );
      console.log(i)
      i -= 1;
    }
};

let i = 0;

function initChessground() {
  i = 0;
  const chess = new Chess();
  const cg = initialPosition(chess);
  const moves = document.querySelectorAll(".moves");
  document.getElementById("next-move").addEventListener("click", () => {
    playNext(chess, cg, moves)
  });
  document.getElementById("previous-move").addEventListener("click", () => {
    playPrevious(chess, cg, moves)
  });
  document.getElementById("board-toggle").addEventListener("click", () => {
    toggleBoard(cg)
  });
}

export { initChessground };










