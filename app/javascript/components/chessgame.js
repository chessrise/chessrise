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
      chess.move(moves[i].innerText);
      moves[i].classList.add("current-move")
      if (i !== 0) {
        moves[i-1].classList.remove("current-move")
      }
      cg.set( { fen: chess.fen() } );
      i += 1;
      console.log(i);
    };
};

const playPrevious = (chess, cg, moves) => {
    if (i > 0) {
      chess.undo();
      moves[i-1].classList.remove("current-move")
      moves[i-2].classList.add("current-move")
      cg.set( { fen: chess.fen() } );
      i -= 1;
      console.log(i)
    }
};

const resetBoard = (chess, cg, moves) => {
  chess.reset();
  removeCurrentMoves(moves);
  cg.set( {fen: chess.fen()});
  i = 0;
};

const removeCurrentMoves = (moves) => {
  moves.forEach((move) => {
    move.classList.remove("current-move");
  })
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
    playPrevious(chess, cg, moves);
  });
  document.getElementById("board-toggle").addEventListener("click", () => {
    toggleBoard(cg);
  });
  document.getElementById("first-move").addEventListener("click", () => {
    resetBoard(chess,cg, moves);
  });
  document.getElementById("last-move").addEventListener("click", () => {
    for (i; i < moves.length; i++) {
      console.log(i);
      console.log(moves[i].innerText);
      chess.move(moves[i].innerText);
    };
    removeCurrentMoves(moves);
    cg.set( {fen: chess.fen()});
    moves[i-1].classList.add("current-move");
  });
}

export { initChessground };










