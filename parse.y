class Parser
  options no_result_var
  prechigh
    left '*' '/'
    left '+' '-'
    right '='
  preclow
  rule
    stmts : stmt
            {
              ["stmts", val.fetch(0)]
            }
          | stmts stmt
            {
              ["stmts", *val.fetch(0)[1..-1], val.fetch(1)]
            }

    stmt : func_def { val.fetch(0) }
         | if_stmt { val.fetch(0) }
         | while_stmt { val.fetch(0) }
         | expr { val.fetch(0) }

    func_def : "def" IDENTIFIER "(" arg_vars ")" stmts "end"
               {
                 ["func_def", val.fetch(1), val.fetch(3), val.fetch(3)]
               }

    arg_vars :
             | arg_vars "," IDENTIFIER
               {
                 val.fetch(0) + [val.fetch(2)]
               }

    if_stmt : "if" expr stmts "end"
              {
                ["if", val.fetch(1), val.fetch(2)]
              }

    while_stmt : "while" expr stmts "end"
                 {
                   ["while", val.fetch(1), val.fetch(2)]
                 }

    expr : literal { val.fetch(0) }
         | var_ref { val.fetch(0) }
         | var_assign { val.fetch(0) }
         | func_call { val.fetch(0) }
         | ary_new { val.fetch(0) }
         | ary_ref { val.fetch(0) }
         | ary_assign { val.fetch(0) }
         | hash_new { val.fetch(0) }
         | expr "+" expr { [val.fetch(1), val.fetch(0), val.fetch(2)] }
         | expr "-" expr { [val.fetch(1), val.fetch(0), val.fetch(2)] }
         | expr "*" expr { [val.fetch(1), val.fetch(0), val.fetch(2)] }
         | expr "/" expr { [val.fetch(1), val.fetch(0), val.fetch(2)] }
         |  expr "%" expr { [val.fetch(1), val.fetch(0), val.fetch(2)] }
         | expr ">" expr { [val.fetch(1), val.fetch(0), val.fetch(2)] }
         | expr "<" expr { [val.fetch(1), val.fetch(0), val.fetch(2)] }
         | expr "=="expr  { [val.fetch(1), val.fetch(0), val.fetch(2)] }

    literal : NUMBER
              {
                ["lit", val.fetch(0)]
              }
            | STRING
              {
                ["lit", val.fetch(0)]
              }

    var_ref : IDENTIFIER
              {
                ["var_ref", val.fetch(0)]
              }

    var_assign : IDENTIFIER '=' expr
                 {
                   ["var_assign", val.fetch(0), val.fetch(2)]
                 }

    func_call : IDENTIFIER '(' ')'
                {
                  ["func_call", val.fetch(0), []]
                }
                func_call : IDENTIFIER '(' exprs ')'
                {

                  ["func_call", val.fetch(0), val.fetch(2)]
                }

    ary_new : '[' ']'
              {
                ["ary_new", []]
              }
            | '[' exprs ']'
              {
                ["ary_new", val.fetch(1)]
              }

    ary_ref : expr '[' expr ']'
              {
                ["ary_ref", val.fetch(0), val.fetch(2)]
              }

    ary_assign : IDENTIFIER '[' expr ']=' expr
                 {
                   ["ary_assign", val.fetch(0), val.fetch(2), val.fetch(5)]
                 }

    hash_new : '{' '}'
               {
                 ["hash_new", []]
               }
             | '{' pairs '}'
               {
                 ["hash_new", val.fetch(1)]
               }

    exprs : expr
            {
              val.fetch(0)
            }
          | exprs ',' expr
            {
              val.fetch(2) + [val.fetch(0)]
            }

    pairs :
            {
              val.fetch(0)
            }
          | pairs ',' pair
            {
              val.fetch(0) + val.fetch(2)
            }

    pair : expr '=>' expr
           {
             [val.fetch(0), val.fetch(2)]
           }

---- header

require 'strscan'

---- inner

def initialize(src)
  @ss = StringScanner.new(src)
end

def scan
  until @ss.eos?
    if (tok = @ss.scan /\s+/)
      # nothing to do
    elsif (tok = @ss.scan /,|\(|\)|\{|\}|=>|\+|\-|\*|\/|%|>|<|==|\]\s*=|\[|\]|=/)
      yield [tok, tok]
    elsif (tok = @ss.scan /"(?:[^"]|"")*"/)
      yield [:STRING, tok.slice(1...-1)]
    elsif (tok = @ss.scan /\d+/)
      yield [:NUMBER, tok.to_i]
    elsif (tok = @ss.scan /\w+/)
      yield [:IDENTIFIER, tok]
    elsif @ss.scan /#.*$/
      # nothing to do
    end
  end

  yield [false, '']
end

def parse
  yyparse self, :scan
end

def self.parse(src)
  self.new(src).parse
end
