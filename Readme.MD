# Boxing robot DTP
## Description
This repo defines formal grammar for exchanging boxing robot state information. The data is exchanged as raw c_str.

## Grammar
```
START -> INIT | STATE

INIT -> "==INIT==" ':' INTEGER ':' (COMBO ';' )*

COMBO -> INTEGER ',' (MOVE ',')*

MOVE -> 'H' | 'J' | 'K' | 'L'

STATE -> ("Start" ':' INTEGER ':' DOUBLE) | "Stop"

INTEGER -> [0-9]+
DOUBLE -> [0-9]+.[0-9]+
```

### Examples of valid messages:

```
"Start: 2 : 10.4" or "Stop", where 10.4 is the speed and combo with index 2 is played.
"4,H,J,K,L" Is a valid combo with 4 moves.
"==INIT==: 4: 4,H,J,K,L; 3,H,J,K; 2,H,J; 1,H" Is a valid init message which initialized the robot with 4 combos.
```

### Other characters
`\n` `\r` `\t` `SPACE` are ignored.
Use of any other character leads to syntax errors.

- H -> Left punch
- J -> Left Vertical punch
- K -> Right Vertical punch
- L -> Right punch
## Response messages

- `"OK"`: The message was successfully parsed.
- `"ERROR"`: The message was not successfully parsed.
- `"ARRAY OOB"`: The index of the combo is out of bounds. The app must resend the  INIT message on this error.
