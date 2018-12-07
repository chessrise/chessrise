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

const displayMoveNumber = (ply_count) => {
  let moveNumber = ""
  if (ply_count === 1) {
    moveNumber = `<span class="moves-bold">${1.}</span>`;
  } else if (ply_count % 2 !==0) {
    moveNumber = `<span class="moves-bold"> ${(ply_count+1)/2}.</span>`;
  }
  else {
    moveNumber = "";
  }
  return moveNumber;
};

const displayChessMoves = (chess) => {
  const displayedMoves = [];
  chess.history().forEach( (move, index) => {
    let moveNumber = displayMoveNumber(index+1);
    let movePly = `<span class="moves moves-bold"> ${move} </span>`;
    displayedMoves.push(`${moveNumber} ${movePly}`);
  });
  return displayedMoves.join("");
};

const playOtherSide = (cg, chess) => {
  return (orig, dest, metadata) => {
    chess.move({from: orig, to: dest});
    const movesInput =  document.querySelector(".moves-input");
    movesInput.innerHTML = "";
    movesInput.innerHTML = displayChessMoves(chess);
    cg.set({
      turnColor: toColor(chess),
      movable: {
        color: toColor(chess),
        dests: toDests(chess)
      }
    });
  };
}

const initialPosition = (chess, id) => {
  const cg = Chessground(document.getElementById(id),
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
      console.log(chess.fen());
      console.log(moves);
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

const chessBoxControls = (chess, cg) => {
  const moves = document.querySelectorAll(".moves");
  document.getElementById("next-move").addEventListener("click", () => {
    playNext(chess, cg, moves)
  });
  document.getElementById("previous-move").addEventListener("click", () => {
    const tests = document.querySelectorAll(".moves");
    i = tests.length;
    console.log("previous");
    playPrevious(chess, cg, tests);
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
};

let i = 0;
const initChessground = () =>{
  i = 0;
  const chess = new Chess();
  const cg = initialPosition(chess, "chessgame");
  chessBoxControls(chess, cg);
}


const initChessgroundInput = () => {
  const chess = new Chess();
  const cg = initialPosition(chess, "chessgame-input");
  chessBoxControls(chess, cg);
};

export { initChessground };
export { initChessgroundInput };









