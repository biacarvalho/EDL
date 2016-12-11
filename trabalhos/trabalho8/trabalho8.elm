import Html exposing (text)

-----códigos base para o programa lang-02 e lang-03
------https://github.com/elm-lang/elm-compiler/blob/0.18.0/hints/missing-patterns.md
------http://elm-lang.org/docs/syntax
-----INTERPRETADOR SIMPLES

type alias Env = (String -> Int)
zero : Env
zero = \ask -> 0

type Exp =   Add Exp Exp
            | Sub Exp Exp
            | Mult Exp Exp
            | Div Exp Exp
            | Mod Exp Exp
            | Num Int
            | Var String
            | Const String
           

type Prog = Attr String Exp
          | Seq Prog Prog
          | If Exp Prog Prog
          | While Exp Prog
       

evalExp : Exp -> Env -> Int
evalExp exp env =
    case exp of
        Add exp1 exp2  -> (evalExp exp1 env) + (evalExp exp2 env)
        Num v          -> v
        Var var        -> (env var)
        Const constante    -> (env constante)
        Sub exp1 exp2       -> (evalExp exp1 env) - (evalExp exp2 env)        
        Mult exp1 exp2      -> (evalExp exp1 env) * (evalExp exp2 env)
        Mod exp1 exp2       -> (evalExp exp1 env) % (evalExp exp2 env)
        Div exp1 exp2        ->
                if ((evalExp exp1 env) /= 0) && ((evalExp exp2 env) /= 0) then
                    
                      (evalExp exp1 env) // (evalExp exp2 env)
                else
                    0
        

evalProg : Prog -> Env -> Env
evalProg s env =
    case s of
        Seq s1 s2       ->
            (evalProg s2 (evalProg s1 env))
        Attr var exp    ->
            let
                val = (evalExp exp env)
            in
                \ask -> if ask == var then val else (env ask) 
         
        If cond p1 p2   ->
                if (evalExp cond env) /= 0 then
                    (evalProg p1 env)
                else
                    (evalProg p2 env)
                    
        While teste p   ->
                if (evalExp teste env) /= 0 then
                    env
                else
                    (evalProg (Seq p s) env)
        
        
        

lang : Prog -> Int
lang p = ((evalProg p zero) "ret")

p1 : Prog
p1 = (Attr "ret" (Add (Num 11) (Num 9)))

p2 : Prog
p2 = Seq
        (Attr "x" (Sub (Mult (Num 2) (Div (Num 20) (Num 4))) (Num 5)))
        (Attr "ret" (Mod (Add (Var "x") (Num 17)) (Num 3)))

p3 = (Attr "ret" (Mod (Num 4) (Num 2)))
p4 = (Attr "ret" (Div (Num 30) (Num 15)))



p5 = (Seq 

        (Attr "x" (Add (Num 11) (Num 9)))
        (If (Var "x")
            (Attr "ret" (Var "x" ))
            (Attr "ret" (Num 100 ))))
            


p6 = (Attr "ret" (Sub (Num 11) (Num 9)))

p7 = (Attr "ret" (Mult (Num 11) (Num 9)))



main = text (toString (lang p7))
