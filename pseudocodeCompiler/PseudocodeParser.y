{
module PseudocodeParser (parsePSC) where
import Ast
import Tokens
}

%name parsePSC
%tokentype { Token }
%error { parseError }

%token
    if      { TokenIf }
    then    { TokenThen }
    else    { TokenElse }
    fi      { TokenFi }
    while   { TokenWhile }
    do      { TokenDo }
    od      { TokenOd }
    for     { TokenFor }
    to      { TokenTo }
    downto  { TokenDownto }
    ';'     { TokenSemicolon}
    '.'     { TokenDot }
    ','     { TokenComma }
    '('     { TokenRBOpen }
    ')'     { TokenRBClose }
    '{'     { TokenCBOpen }
    '}'     { TokenCBClose }
    '['     { TokenSBOpen }
    ']'     { TokenSBClose }
    "<-"    { TokenLeftarrow }
    "=="    { TokenEq }
    "!="    { TokenNeq }
    '!'     { TokenNot }
    "&&"    { TokenAnd }
    "||"    { TokenOr }
    "<="    { TokenLeq }
    '<'     { TokenLt }
    ">="    { TokenGeq }
    '>'     { TokenGt }
    "++"    { TokenInc }
    "--"    { TokenDec }
    '+'     { TokenPlus }
    '-'     { TokenMinus }
    '*'     { TokenMult }
    '/'     { TokenDiv }
    '%'     { TokenMod }
    '='     { TokenEqualSign }
    '"'     { TokenQuote}
    int     { TokenInt $$ }
    word    { TokenWord $$ }

%left ','
%right "<-"
%left "||"
%left "&&"
%left "==" "!="
%left '>' ">="
%left '<' "<="
%left '+' '-'
%left '*' '/' '%'
%right '!'
%left '.'
%left '[' ']'
%left '(' ')'
%left "++" "--"

%%

Statement :: { Statement }
          : StatementIf    { $1 }
          | StatementWhile { $1 }
          | StatementFor   { StatementFor $1 }
          | Expression ';' { StatementExpr $1 }

StatementIf :: { Statement }
            : if Expression ';' then Block else Block fi { StatementIf $2 $5 $7 }
            | if Expression ';' then Block fi            { StatementIf $2 $5 [] }

StatementWhile :: { Statement }
StatementWhile : while Expression ';' do Block od { StatementWhile $2 $5 }

StatementFor :: { StatementFor }
             : for word '=' int to int do Block od     { ForTo $2 $4 $6 $8 }
             | for word '=' int downto int do Block od { ForDownto $2 $4 $6 $8 }

Block :: { Block }
Block : {- empty -}         { [] }
      | Statement           { $1:[] }
      | '{' Stmts '}'       { $2 }

Stmts :: { [Statement] }
      : Statement { $1:[] }
      | Stmts Statement { $2:$1 }

Expression :: { Expression }
            : '(' Expression ')' { $2 }

            {- Constants -}
            | '"' word '"'  { ExprConst (Vs $2) }
            | int           { ExprConst (Vi $1) }

            {- Assign and lookup -}
            | word                            { ExprLookup $1 }
            | word "<-" Expression            { ExprAssign $1 $3 }
            | Expression '[' Expression ']'   { ExprArrayAccess $1 $3 }
            | Expression '.' word             { ExprMemberAccess $1 $3 }
            | Expression '(' Expression ')'   { ExprFunctionCall $1 $3 }
            | Expression ',' Expression       { ExprCollection $1 $3 }

            {- Comparison -}
            | Expression "==" Expression {ExprCompEq $1 $3}
            | Expression "!=" Expression {ExprCompNeq $1 $3}
            | Expression "<=" Expression {ExprCompLeq $1 $3}
            | Expression ">=" Expression {ExprCompGeq $1 $3}
            | Expression '<' Expression  {ExprCompLt $1 $3}
            | Expression '>' Expression  {ExprCompGt $1 $3}

            {- Logic -}
            | '!' Expression             { ExprNot $2 }
            | Expression "&&" Expression { ExprAnd $1 $3 }
            | Expression "||" Expression { ExprOr $1 $3 }

            {- Arithmetic -}
            | Expression '+' Expression { ExprPlus $1 $3 }
            | Expression '-' Expression { ExprMinus $1 $3 }
            | Expression '*' Expression { ExprMult $1 $3 }
            | Expression '/' Expression { ExprDiv $1 $3 }
            | Expression '%' Expression { ExprMod $1 $3 }
            | Expression "++"           { ExprInc $1 }
            | Expression "--"           { ExprDec $1 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

}
