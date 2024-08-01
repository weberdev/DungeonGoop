⍝FORTH in APL

⍝We begin with a quote:
⍝"The geometry of the place was all wrong too, and I could see that the walls and floor and ceiling were covered with cryptical carvings and symbols that only a diseased fancy could conceive."
⍝-HP Lovecraft, The Call of Cthulhu

⍝HPL was incredibly verbose. APL is not. One letter makes all the difference.

⍝The stack is set as prelude. Furthermore, we define a basic dictionary of FORTH words, and a similar dictionary of FORTH operators.

global ← ⎕NS''
global.stack←⍬
global.stackTop ← 0 
global.dictionaryOfWords ← 'MOD' 'DUP' 'SWAP' 'DUMP' 'DROP' 'OVER' 'EMIT' 'CR' 'AND' 'OR' 'XOR' 'INVERT'
dictionaryOfOps ← '+' '*' '-' '/' '.' '<' '>' '=' ':' '."' '".'

PUSH←{global.stringHolder←''⋄global.stack,←⊂⍵}

POP←{returnVal ← global.stack[≢global.stack] ⋄  global.stack ← ¯1↓global.stack ⋄ global.stackTop ← ≢global.stack ⋄ ⊃returnVal}
numPop←{numVal ← POP''  ⋄ checkIfNumbest numVal: numVal ⋄ ⍎numVal}
checkIfNumbest ←{drType ←⍵ ⋄ drType ←⎕DR drType ⋄  drType = 83: 1 ⋄ drType = 163: 1 ⋄ drType = 323: 1 ⋄ drType = 1287: 1 ⋄ drType = 645: 1 ⋄  0}

global.stringHolder ←''
global.newWordHolder ←''
global.workingWith ← 0

restart ←{global.stack←⍬ ⋄ global.stackTop ← 0 ⋄ global.stringHolder ←'' ⋄ global.newWordHolder ←'' ⋄ global.workingWith ← 0 ⋄ global.dictionaryOfWords ← 'MOD' 'DUP' 'SWAP' 'DUMP' 'DROP' 'OVER' 'EMIT' 'CR' 'AND' 'OR' 'XOR' 'INVERT' ⋄ interpreterLoopStart''} 

⍝We begin with the basic arithmetic operations. Begin is a dubious claim, given that we've already defined two dictionaries, a basic function, and two global variables.
⍝"Never explain anything."
⍝-HP Lovecraft
PLUS←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← numPop'' ⋄ second ← numPop'' ⋄  result ← first+second ⋄ PUSH result }
MULT←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← numPop'' ⋄ second ← numPop'' ⋄  result ← first×second ⋄ PUSH result }
MINUS←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← numPop'' ⋄ second ← numPop'' ⋄  result ← first-second ⋄ PUSH result }
DIV←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← numPop'' ⋄ second ← numPop'' ⋄ second = 0: errorMessage 'error: kindly refrain from attempting to divide by zero, thanks!' ⋄ second = 0: 0 ⋄ result ← first/second ⋄ PUSH result }
MOD←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← numPop'' ⋄ second ← numPop'' ⋄ second = 0: errorMessage 'error: kindly refrain from attempting to divide by zero, and this goes for modular division too, thanks!' ⋄ second = 0: 0 ⋄ result ← first|second ⋄ PUSH result }


⍝Following that, we continue to the more FORTHian operators:
⍝"Non- Euclidean calculus and quantum physics are enough to stretch any brain; and when one mixes them with folklore, and tries to trace a strange background of multi-dimensional reality behind the ghoulish hints of Gothic tales and the wild whispers of the chimney-corner, one can hardly expect to be wholly free from mental tension."
⍝-HP Lovecraft, Dreams in the Witch House
DUP←{elements ←≢global.stack ⋄ elements<1: errorMessage 'error: empty stack' ⋄ elements<1: 0 ⋄ duplicateValue ← POP'' ⋄ holder ← PUSH duplicateValue ⋄ PUSH duplicateValue}
SWAP←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← POP'' ⋄ second ← POP'' ⋄ garbageHolder ← PUSH first ⋄ PUSH second}
DROP←{elements ←≢global.stack ⋄ elements < 1: errorMessage 'error: insufficient stack' ⋄ elements < 1: 0 ⋄ POP''} 
DUMP←{⎕←'[',⍕¨global.stack ']' }
OVER←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← POP'' ⋄ second ← POP'' ⋄ garbageHolder ← PUSH second ⋄ garbageHolder ← PUSH first ⋄ PUSH second}
DOT←{elements ←≢global.stack ⋄ elements < 1: errorMessage 'error: insufficient stack' ⋄ elements < 1: 0 ⋄ numRep ← POP'' ⋄ ⎕← numRep }
EMIT←{elements ←≢global.stack ⋄ elements < 1: errorMessage 'error: insufficient stack' ⋄ elements < 1: 0 ⋄ charRep ← POP'' ⋄ charRep ← ⎕UCS charRep ⋄ ⎕← charRep }
CR←{⎕←''}

⍝Basic comparison operators.
⍝“I like coffee exceedingly...” 
⍝― H.P. Lovecraft

EQUALS←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← POP'' ⋄ second ← POP'' ⋄ result ← first=second ⋄ PUSH 0-result}
LESS←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← numPop'' ⋄ second ← numPop'' ⋄ result ← first<second ⋄ PUSH 0-result}
GREATER←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← numPop'' ⋄ second ← numPop'' ⋄ result ← first>second ⋄ PUSH 0-result}

⍝We continue to bitwise operations.
⍝"I am writing this under an appreciable mental strain..."
⍝-HP Lovecraft, Dagon

binary ← {(2∘⊥⍣¯1)⍵} ⍝All credit to APLCart

AND←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← numPop'' ⋄ second ← numPop'' ⋄ higher ← first⌈second ⋄ largerBinary ← ≢binary higher ⋄ first ←  largerBinary⍴2 ⊥ first ⋄ second ←  largerBinary⍴2 ⊥ second ⋄ result ← first ∧ second ⋄ PUSH result }
OR←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← numPop'' ⋄ second ← numPop'' ⋄ higher ← first⌈second ⋄ largerBinary ← ≢binary higher ⋄ first ←  largerBinary⍴2 ⊥ first ⋄ second ←  largerBinary⍴2 ⊥ second ⋄ result ← first ∨ second ⋄ PUSH result}
XOR←{elements ←≢global.stack ⋄ elements < 2: errorMessage 'error: insufficient stack' ⋄ elements < 2: 0 ⋄ first ← numPop'' ⋄ second ← numPop'' ⋄ higher ← first⌈second ⋄ largerBinary ← ≢binary higher ⋄ first ←  largerBinary⍴2 ⊥ first ⋄ second ←  largerBinary⍴2 ⊥ second ⋄ result ← first ∨ second ⋄ PUSH result}
INVERT←{(≢global.stack)<1: (errorMessage 'error: empty') ⋄ global.stack[1]←¯1+2|global.stack[1]}

⍝END FIRST CUT HERE

⍝Let's set up the loop for FORTH processing.
⍝“He never spoke save in the debased patois of his environment...”
⍝-HP Lovecraft, Beyond the Wall of Sleep

toUpper ←{1∘⎕C⍵} ⍝Thanks APLcart!

checkIfNumber ←{drType ←⍵ ⋄ drType ←⎕DR drType ⋄  drType = 83: 1 ⋄ drType = 163: 1 ⋄ drType = 323: 1 ⋄ drType = 1287: 1 ⋄ drType = 645: 1 ⋄ drType = 11 ⋄  0}

checkIfWord ← {wordBeingChecked ← toUpper ⍵ ⋄ processedWBC ← ⊂wordBeingChecked  ⋄ comparatorList ← processedWBC ∊ global.dictionaryOfWords   ⋄ ∧/comparatorList}
checkIfOperator ← {comparatorList ← ⍵ ∊ dictionaryOfOps ⋄ ∧/comparatorList}
handleWord ←{processedWord ← toUpper⍵ ⋄  callWord processedWord}
callWord ← {0=⍴⍴(⍎⍵) ⍴ 0}
	

callOperator ← {⍵='+': PLUS'' ⋄ ⍵='-': MINUS'' ⋄ ⍵='*': MULT'' ⋄ ⍵='/': DIV'' ⋄ ⍵='=': EQUALS'' ⋄ ⍵='>': LESS'' ⋄ ⍵='<': GREATER'' ⋄ ⍵='.': DOT''⋄  ⍵='".': concludeString'' ⋄ ⍵='."': global.workingWith ← 1 ⋄  ⍵=':': global.workingWith ← 2 ⋄ 0}
getTokenType ←{ isAWord ← checkIfWord ⍵ ⋄ isAWord=1:2 ⋄ isAnOp← checkIfOperator ⍵ ⋄ isAnOp=1: 3 ⋄  checkIfNumber ⍵ = 1: 4 ⋄ ⊃⍵=':': 5 ⋄ -1}
	
checkIsOpener ← { ⍵ = '."' }
checkIsCloser ← { ⍵ = '".' }



concludeDefinition ←{global.workingWith ← 0 ⋄  global.stringHolder ← global.stringHolder,' 0}' ⋄ ⎕← global.stringHolder ⋄ the ← callWord global.stringHolder ⋄ global.stringHolder ← ''}

concludeString ←{global.workingWith ← 0 ⋄ PUSH global.stringHolder⋄ 0}
concatString ←{global.workingWith ← 1 ⋄ global.stringHolder ← global.stringHolder,' ',⍵ ⋄ checkIsCloser global.stringHolder: concludeString global.stringHolder ⋄ 0}

initializeNewFunc ←{funcName ← toUpper ⍵ ⋄ global.stringHolder ← funcName,' ←{' ⋄ global.dictionaryOfWords ← global.dictionaryOfWords,' 'funcName} 

concatFunction ←{⊃⍵=';': concludeDefinition 'a' ⋄ beginning ← global.stringHolder≡'' ⋄ beginning: initializeNewFunc ⍵ ⋄ global.stringHolder ← global.stringHolder,'a ← prehandlingStringCheck ',⍕⍵, ' ⋄ ' ⋄ 0 }

errorMessage ←{⎕←⍵ ⋄ ⎕STOP}

⍝This is going to get confusing, is inelegant, and I'm not thrilled about it. However, it's a decent mockup for a first revision.
⍝tokenTypes are broken down as follows: 1 = string opener. 2 = FORTH word. 3 = FORTH operator. 4 = number. 
⍝The commented out version has a debug statement that prints the name and type of the input token.

⍝handleToken ←{ tokenType ← getTokenType ⍵  ⋄ debug ← tokenType displayToken ⍵ ⋄ tokenType = 1: concatString ⍵ ⋄ tokenType = 2: handleWord ⍵⋄ tokenType = 3: callOperator ⍵ ⋄ tokenType = 5: global.workingWith ← 2  ⋄ tokenType = 4: PUSH ⍵  ⋄ tokenType = -1: errorMessage 'error, invalid token'}

handleToken ←{ tokenType ← getTokenType ⍵   ⋄ tokenType = 1: concatString ⍵ ⋄ tokenType = 2: handleWord ⍵⋄ tokenType = 3: callOperator ⍵ ⋄ tokenType = 5: global.workingWith ← 2  ⋄ tokenType = 4: PUSH ⍵  ⋄ tokenType = -1: errorMessage 'error, invalid token'}

displayToken ←{⎕←'handling ',⍵,' which is a ',⍺ }

prehandlingStringCheck ←{ global.workingWith = 1: concatString ⍵ ⋄ global.workingWith = 2: concatFunction ⍵ ⋄ global.workingWith = 0: handleToken ⍵ ⋄ 0}

processWords ←{thisIsADishonorableWorkaround←prehandlingStringCheck¨⍵ ⋄ ⎕← 'ok' ⋄ interpreterLoopStart''}
interpreterLoopStart ← {wordString ← ⍞ ⋄ wordArray ← ' ' (≠⊆⊢)  wordString  ⋄ processWords wordArray}
interpreterLoopStart''