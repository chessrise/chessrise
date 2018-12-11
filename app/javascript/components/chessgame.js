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
    i += 1;
    console.log(i);
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
    chess.move(moves[i].innerText.replace(" ",""));
    moves[i].classList.add("current-move")
    if (i !== 0) {
      moves[i-1].classList.remove("current-move")
    }
    cg.set( { fen: chess.fen() } );
    i += 1;
  };
};

const playPrevious = (chess, cg, moves) => {
  if (i > 0) {
    chess.undo();
    cg.set( { fen: chess.fen() } );
    if (i >= 3) {
      moves[i-1].classList.remove("current-move")
      moves[i-2].classList.add("current-move")
    }
    i -= 1;
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
  // const moves = document.querySelectorAll(".moves");
  document.getElementById("next-move").addEventListener("click", () => {
    const tests = document.querySelectorAll(".moves");
    playNext(chess, cg, tests)
  });
  document.getElementById("previous-move").addEventListener("click", () => {
    const tests = document.querySelectorAll(".moves");
    playPrevious(chess, cg, tests);
  });
  document.getElementById("board-toggle").addEventListener("click", () => {
    toggleBoard(cg);
  });
  document.getElementById("first-move").addEventListener("click", () => {
    const tests = document.querySelectorAll(".moves");
    resetBoard(chess,cg, tests);
  });
  document.getElementById("last-move").addEventListener("click", () => {
    const tests = document.querySelectorAll(".moves");
    for (i; i < tests.length; i++) {
      chess.move(tests[i].innerText.replace(" ",""));
    };
    removeCurrentMoves(tests);
    cg.set( {fen: chess.fen()});
    tests[i-1].classList.add("current-move");
  });
};

let i = 0;
const initChessground = () =>{
  i = 0;
  if (document.getElementById("chessgame")) {
    const chess = new Chess();
    const cg = initialPosition(chess, "chessgame");
    chessBoxControls(chess, cg);
  }
}

const initChessgroundInput = () => {
  i = 0
  if (document.getElementById("chessgame-input")) {
    const chess = new Chess();
    const cg = initialPosition(chess, "chessgame-input");
    chessBoxControls(chess, cg);
    if (document.getElementById("find-game-button")) {
      document.getElementById("find-game-button").addEventListener("click", () => {
        return chess.fen();
      })
    }

  }
};

const initChessgroundFind = () => {
  i = 0
  if (document.getElementById("chessgame-find")) {
    const chess = new Chess();
    const cg = initialPosition(chess, "chessgame-find");
    chessBoxControls(chess, cg);
    if (document.getElementById("find-game-button")) {
      document.getElementById("find-game-button").addEventListener("click", () => {
        const fen = chess.fen();
        console.log(fen);
        $.ajax( {
          url: "/search_by_fen",
          method: "GET",
          headers: { "X-CSRF-Token": token },
          dataType: "script",
          data: {fen: fen}
              })
      })
    }
  }
};



export { initChessground };
export { initChessgroundInput };
export { initChessgroundFind };








