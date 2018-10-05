#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'


require 'strscan'

class Parser < Racc::Parser

module_eval(<<'...end parse.y/module_eval...', 'parse.y', 160)

def initialize(src)
  @ss = StringScanner.new(src)
end

def scan
  until @ss.eos?
    if (tok = @ss.scan /\s+/)
      # nothing to do
    elsif (tok = @ss.scan /(if|while|end|else|def)/)
      yield [tok, tok]
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
...end parse.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    28,    29,    30,    26,    27,    31,    32,    33,    45,    78,
    24,    67,    57,    28,    29,    30,    26,    27,    31,    32,
    34,     7,    21,    18,    69,    88,    84,     8,    85,     9,
    19,    20,    22,    34,    68,    23,    28,    29,    30,    26,
    27,    31,    32,    33,    47,     7,    21,    18,    28,    29,
    30,     8,    91,     9,    19,    20,    59,    34,    35,    23,
    28,    29,    30,    26,    27,    31,    32,    33,    34,     7,
    21,    18,    34,    34,    67,     8,   nil,     9,    19,    20,
    59,    66,   nil,    23,    28,    29,    30,    26,    27,    31,
    32,    33,    28,    29,    30,    26,    27,    31,    32,    33,
    73,   nil,    71,   nil,    34,   nil,    79,   nil,   nil,   nil,
   nil,   nil,    34,    70,    28,    29,    30,    26,    27,    31,
    32,    33,    28,    29,    30,    26,    27,    31,    32,    33,
    28,    29,    30,   nil,    34,    70,    28,    29,    30,    26,
    27,   nil,    34,    28,    29,    30,    26,    27,    39,   nil,
    34,    40,   nil,   nil,   nil,   nil,    34,   nil,   nil,   nil,
    41,   nil,   nil,    34,    28,    29,    30,    26,    27,    31,
    32,    33,   nil,    28,    29,    30,    26,    27,    31,    32,
    33,   nil,   nil,   nil,    34,    61,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    34,    28,    29,    30,    26,    27,    31,
    32,    33,    28,    29,    30,    26,    27,    31,    32,    33,
   nil,   nil,   nil,   nil,    34,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    34,    28,    29,    30,    26,    27,    31,    32,
    33,    28,    29,    30,    26,    27,    31,    32,    33,   nil,
   nil,   nil,   nil,    34,     7,    21,    18,   nil,    89,   nil,
     8,    34,     9,    19,    20,    22,   nil,   nil,    23,     7,
    21,    18,   nil,    74,   nil,     8,    75,     9,    19,    20,
    22,   nil,   nil,    23,     7,    21,    18,   nil,    77,   nil,
     8,   nil,     9,    19,    20,    22,   nil,   nil,    23,     7,
    21,    18,   nil,   nil,   nil,     8,   nil,     9,    19,    20,
    22,   nil,   nil,    23,     7,    21,    18,   nil,   nil,   nil,
     8,   nil,     9,    19,    20,    22,   nil,   nil,    23,     7,
    21,    18,   nil,   nil,   nil,     8,   nil,     9,    19,    20,
    22,   nil,   nil,    23,     7,    21,    18,   nil,   nil,   nil,
     8,   nil,     9,    19,    20,    22,   nil,   nil,    23,     7,
    21,    18,   nil,    92,   nil,     8,   nil,     9,    19,    20,
    22,   nil,   nil,    23,     7,    21,    18,   nil,    94,   nil,
     8,   nil,     9,    19,    20,    22,    21,    18,    23,   nil,
   nil,   nil,    21,    18,    19,    20,    22,   nil,   nil,    23,
    19,    20,    22,    43,   nil,    23,    21,    18,   nil,   nil,
   nil,   nil,    21,    18,    19,    20,    22,   nil,   nil,    23,
    19,    20,    22,    43,   nil,    23,    21,    18,   nil,   nil,
   nil,   nil,    21,    18,    19,    20,    22,   nil,   nil,    23,
    19,    20,    22,    21,    18,    23,   nil,   nil,   nil,    21,
    18,    19,    20,    22,   nil,   nil,    23,    19,    20,    22,
    21,    18,    23,   nil,   nil,   nil,    21,    18,    19,    20,
    22,   nil,   nil,    23,    19,    20,    22,    21,    18,    23,
   nil,   nil,   nil,    21,    18,    19,    20,    22,   nil,   nil,
    23,    19,    20,    22,    21,    18,    23,   nil,   nil,   nil,
   nil,   nil,    19,    20,    22,   nil,   nil,    23,    21,    18,
    63,   nil,   nil,   nil,    21,    18,    19,    20,    22,   nil,
   nil,    23,    19,    20,    22,    21,    18,    23,   nil,   nil,
   nil,    21,    18,    19,    20,    22,   nil,   nil,    23,    19,
    20,    22,    21,    18,    23,   nil,   nil,   nil,    21,    18,
    19,    20,    22,   nil,   nil,    23,    19,    20,    22,    21,
    18,    23,   nil,   nil,   nil,    21,    18,    19,    20,    22,
   nil,   nil,    23,    19,    20,    22,   nil,   nil,    23 ]

racc_action_check = [
    81,    81,    81,    81,    81,    81,    81,    81,    23,    64,
     1,    64,    35,    55,    55,    55,    55,    55,    55,    55,
    81,     1,     1,     1,    46,    81,    72,     1,    72,     1,
     1,     1,     1,    55,    46,     1,    36,    36,    36,    36,
    36,    36,    36,    36,    24,    36,    36,    36,    49,    49,
    49,    36,    85,    36,    36,    36,    36,    50,     7,    36,
    37,    37,    37,    37,    37,    37,    37,    37,    49,    37,
    37,    37,    51,    52,    44,    37,   nil,    37,    37,    37,
    37,    44,   nil,    37,    65,    65,    65,    65,    65,    65,
    65,    65,    56,    56,    56,    56,    56,    56,    56,    56,
    57,   nil,    57,   nil,    65,   nil,    65,   nil,   nil,   nil,
   nil,   nil,    56,    56,    76,    76,    76,    76,    76,    76,
    76,    76,    62,    62,    62,    62,    62,    62,    62,    62,
    48,    48,    48,   nil,    76,    76,    54,    54,    54,    54,
    54,   nil,    62,    53,    53,    53,    53,    53,    21,   nil,
    48,    21,   nil,   nil,   nil,   nil,    54,   nil,   nil,   nil,
    21,   nil,   nil,    53,    42,    42,    42,    42,    42,    42,
    42,    42,   nil,    38,    38,    38,    38,    38,    38,    38,
    38,   nil,   nil,   nil,    42,    38,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    38,    87,    87,    87,    87,    87,    87,
    87,    87,    93,    93,    93,    93,    93,    93,    93,    93,
   nil,   nil,   nil,   nil,    87,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    93,     6,     6,     6,     6,     6,     6,     6,
     6,    80,    80,    80,    80,    80,    80,    80,    80,   nil,
   nil,   nil,   nil,     6,    83,    83,    83,   nil,    83,   nil,
    83,    80,    83,    83,    83,    83,   nil,   nil,    83,    58,
    58,    58,   nil,    58,   nil,    58,    58,    58,    58,    58,
    58,   nil,   nil,    58,    60,    60,    60,   nil,    60,   nil,
    60,   nil,    60,    60,    60,    60,   nil,   nil,    60,    71,
    71,    71,   nil,   nil,   nil,    71,   nil,    71,    71,    71,
    71,   nil,   nil,    71,    75,    75,    75,   nil,   nil,   nil,
    75,   nil,    75,    75,    75,    75,   nil,   nil,    75,     0,
     0,     0,   nil,   nil,   nil,     0,   nil,     0,     0,     0,
     0,   nil,   nil,     0,    84,    84,    84,   nil,   nil,   nil,
    84,   nil,    84,    84,    84,    84,   nil,   nil,    84,    86,
    86,    86,   nil,    86,   nil,    86,   nil,    86,    86,    86,
    86,   nil,   nil,    86,    90,    90,    90,   nil,    90,   nil,
    90,   nil,    90,    90,    90,    90,    31,    31,    90,   nil,
   nil,   nil,    59,    59,    31,    31,    31,   nil,   nil,    31,
    59,    59,    59,    59,   nil,    59,    88,    88,   nil,   nil,
   nil,   nil,    22,    22,    88,    88,    88,   nil,   nil,    88,
    22,    22,    22,    22,   nil,    22,    67,    67,   nil,   nil,
   nil,   nil,    69,    69,    67,    67,    67,   nil,   nil,    67,
    69,    69,    69,    79,    79,    69,   nil,   nil,   nil,    18,
    18,    79,    79,    79,   nil,   nil,    79,    18,    18,    18,
     9,     9,    18,   nil,   nil,   nil,    34,    34,     9,     9,
     9,   nil,   nil,     9,    34,    34,    34,    33,    33,    34,
   nil,   nil,   nil,    32,    32,    33,    33,    33,   nil,   nil,
    33,    32,    32,    32,    39,    39,    32,   nil,   nil,   nil,
   nil,   nil,    39,    39,    39,   nil,   nil,    39,    40,    40,
    40,   nil,   nil,   nil,    41,    41,    40,    40,    40,   nil,
   nil,    40,    41,    41,    41,    30,    30,    41,   nil,   nil,
   nil,    29,    29,    30,    30,    30,   nil,   nil,    30,    29,
    29,    29,    28,    28,    29,   nil,   nil,   nil,    27,    27,
    28,    28,    28,   nil,   nil,    28,    27,    27,    27,    26,
    26,    27,   nil,   nil,   nil,     8,     8,    26,    26,    26,
   nil,   nil,    26,     8,     8,     8,   nil,   nil,     8 ]

racc_action_pointer = [
   308,    10,   nil,   nil,   nil,   nil,   221,    46,   543,   438,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   427,   nil,
   nil,   138,   390,   -18,    44,   nil,   537,   526,   520,   509,
   503,   364,   461,   455,   444,    -1,    34,    58,   171,   472,
   486,   492,   162,   nil,    58,   nil,     8,   nil,   128,    46,
    35,    50,    51,   141,   134,    11,    90,    88,   248,   370,
   263,   nil,   120,   nil,    -5,    82,   nil,   404,   nil,   410,
   nil,   278,    12,   nil,   nil,   293,   112,   nil,   nil,   421,
   229,    -2,   nil,   233,   323,    40,   338,   192,   384,   nil,
   353,   nil,   nil,   200,   nil ]

racc_action_default = [
   -48,   -48,    -1,    -3,    -4,    -5,    -6,   -48,   -48,   -48,
   -14,   -15,   -16,   -17,   -18,   -19,   -20,   -21,   -48,   -31,
   -32,   -33,   -48,   -45,   -48,    -2,   -48,   -48,   -48,   -48,
   -48,   -48,   -48,   -48,   -48,   -48,   -48,   -48,   -48,   -48,
   -48,   -48,   -43,   -37,   -48,   -41,   -48,    95,   -23,   -24,
   -25,   -26,   -27,   -28,   -29,   -30,   -48,   -48,   -48,   -48,
   -48,   -22,   -34,   -35,   -48,   -48,   -38,   -48,   -42,   -48,
   -39,   -48,   -48,    -9,   -11,   -48,   -43,   -13,   -36,   -48,
   -44,   -48,   -46,   -48,   -48,   -48,   -48,   -40,   -48,    -7,
   -48,   -10,   -12,   -47,    -8 ]

racc_goto_table = [
    25,    72,     1,    36,    37,    64,    46,    82,   nil,   nil,
   nil,   nil,   nil,    38,   nil,   nil,   nil,    42,   nil,   nil,
   nil,    48,    49,    50,    51,    52,    53,    54,    55,    56,
   nil,   nil,   nil,   nil,    62,    42,    65,   nil,    58,    60,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    76,   nil,   nil,    25,   nil,    25,
   nil,   nil,    80,   nil,    81,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    83,    87,   nil,   nil,    86,   nil,   nil,
   nil,   nil,    25,    93,   nil,    25,    90,   nil,   nil,    25 ]

racc_goto_check = [
     2,     7,     1,     6,     6,    16,    17,    18,   nil,   nil,
   nil,   nil,   nil,     6,   nil,   nil,   nil,     6,   nil,   nil,
   nil,     6,     6,     6,     6,     6,     6,     6,     6,     6,
   nil,   nil,   nil,   nil,     6,     6,     6,   nil,     1,     1,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     6,   nil,   nil,     2,   nil,     2,
   nil,   nil,     6,   nil,     6,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,     1,     6,   nil,   nil,     1,   nil,   nil,
   nil,   nil,     2,     6,   nil,     2,     1,   nil,   nil,     2 ]

racc_goto_pointer = [
   nil,     2,    -1,   nil,   nil,   nil,    -5,   -56,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   -35,   -17,   -62 ]

racc_goto_default = [
   nil,   nil,     2,     3,     4,     5,     6,   nil,    10,    11,
    12,    13,    14,    15,    16,    17,    44,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 29, :_reduce_1,
  2, 29, :_reduce_2,
  1, 30, :_reduce_3,
  1, 30, :_reduce_4,
  1, 30, :_reduce_5,
  1, 30, :_reduce_6,
  6, 31, :_reduce_7,
  7, 31, :_reduce_8,
  1, 35, :_reduce_9,
  3, 35, :_reduce_10,
  4, 32, :_reduce_11,
  6, 32, :_reduce_12,
  4, 33, :_reduce_13,
  1, 34, :_reduce_14,
  1, 34, :_reduce_15,
  1, 34, :_reduce_16,
  1, 34, :_reduce_17,
  1, 34, :_reduce_18,
  1, 34, :_reduce_19,
  1, 34, :_reduce_20,
  1, 34, :_reduce_21,
  3, 34, :_reduce_22,
  3, 34, :_reduce_23,
  3, 34, :_reduce_24,
  3, 34, :_reduce_25,
  3, 34, :_reduce_26,
  3, 34, :_reduce_27,
  3, 34, :_reduce_28,
  3, 34, :_reduce_29,
  3, 34, :_reduce_30,
  1, 36, :_reduce_31,
  1, 36, :_reduce_32,
  1, 37, :_reduce_33,
  3, 38, :_reduce_34,
  3, 39, :_reduce_35,
  4, 39, :_reduce_36,
  2, 40, :_reduce_37,
  3, 40, :_reduce_38,
  4, 41, :_reduce_39,
  5, 42, :_reduce_40,
  2, 43, :_reduce_41,
  3, 43, :_reduce_42,
  1, 44, :_reduce_43,
  3, 44, :_reduce_44,
  0, 45, :_reduce_45,
  3, 45, :_reduce_46,
  3, 46, :_reduce_47 ]

racc_reduce_n = 48

racc_shift_n = 95

racc_token_table = {
  false => 0,
  :error => 1,
  "*" => 2,
  "/" => 3,
  "%" => 4,
  "+" => 5,
  "-" => 6,
  ">" => 7,
  "<" => 8,
  "==" => 9,
  "=" => 10,
  "def" => 11,
  :IDENTIFIER => 12,
  "(" => 13,
  ")" => 14,
  "end" => 15,
  "," => 16,
  "if" => 17,
  "else" => 18,
  "while" => 19,
  :NUMBER => 20,
  :STRING => 21,
  "[" => 22,
  "]" => 23,
  "]=" => 24,
  "{" => 25,
  "}" => 26,
  "=>" => 27 }

racc_nt_base = 28

racc_use_result_var = false

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "\"*\"",
  "\"/\"",
  "\"%\"",
  "\"+\"",
  "\"-\"",
  "\">\"",
  "\"<\"",
  "\"==\"",
  "\"=\"",
  "\"def\"",
  "IDENTIFIER",
  "\"(\"",
  "\")\"",
  "\"end\"",
  "\",\"",
  "\"if\"",
  "\"else\"",
  "\"while\"",
  "NUMBER",
  "STRING",
  "\"[\"",
  "\"]\"",
  "\"]=\"",
  "\"{\"",
  "\"}\"",
  "\"=>\"",
  "$start",
  "stmts",
  "stmt",
  "func_def",
  "if_stmt",
  "while_stmt",
  "expr",
  "arg_vars",
  "literal",
  "var_ref",
  "var_assign",
  "func_call",
  "ary_new",
  "ary_ref",
  "ary_assign",
  "hash_new",
  "exprs",
  "pairs",
  "pair" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'parse.y', 12)
  def _reduce_1(val, _values)
                  ["stmts", val.fetch(0)]
            
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 16)
  def _reduce_2(val, _values)
                  ["stmts", *val.fetch(0)[1..-1], val.fetch(1)]
            
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 19)
  def _reduce_3(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 20)
  def _reduce_4(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 21)
  def _reduce_5(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 22)
  def _reduce_6(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 26)
  def _reduce_7(val, _values)
                     ["func_def", val.fetch(1), [], val.fetch(4)]
               
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 30)
  def _reduce_8(val, _values)
                     ["func_def", val.fetch(1), val.fetch(3), val.fetch(5)]
               
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 35)
  def _reduce_9(val, _values)
                     [val.fetch(0)]
               
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 39)
  def _reduce_10(val, _values)
                     val.fetch(0) + [val.fetch(2)]
               
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 44)
  def _reduce_11(val, _values)
                    ["if", val.fetch(1), val.fetch(2)]
              
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 48)
  def _reduce_12(val, _values)
                    ["if", val.fetch(1), val.fetch(2), val.fetch(4)]
              
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 53)
  def _reduce_13(val, _values)
                       ["while", val.fetch(1), val.fetch(2)]
                 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 56)
  def _reduce_14(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 57)
  def _reduce_15(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 58)
  def _reduce_16(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 59)
  def _reduce_17(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 60)
  def _reduce_18(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 61)
  def _reduce_19(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 62)
  def _reduce_20(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 63)
  def _reduce_21(val, _values)
     val.fetch(0) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 64)
  def _reduce_22(val, _values)
     val.fetch(1) 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 65)
  def _reduce_23(val, _values)
     [val.fetch(1), val.fetch(0), val.fetch(2)] 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 66)
  def _reduce_24(val, _values)
     [val.fetch(1), val.fetch(0), val.fetch(2)] 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 67)
  def _reduce_25(val, _values)
     [val.fetch(1), val.fetch(0), val.fetch(2)] 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 68)
  def _reduce_26(val, _values)
     [val.fetch(1), val.fetch(0), val.fetch(2)] 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 69)
  def _reduce_27(val, _values)
     [val.fetch(1), val.fetch(0), val.fetch(2)] 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 70)
  def _reduce_28(val, _values)
     [val.fetch(1), val.fetch(0), val.fetch(2)] 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 71)
  def _reduce_29(val, _values)
     [val.fetch(1), val.fetch(0), val.fetch(2)] 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 72)
  def _reduce_30(val, _values)
     [val.fetch(1), val.fetch(0), val.fetch(2)] 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 76)
  def _reduce_31(val, _values)
                    ["lit", val.fetch(0)]
              
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 80)
  def _reduce_32(val, _values)
                    ["lit", val.fetch(0)]
              
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 85)
  def _reduce_33(val, _values)
                    ["var_ref", val.fetch(0)]
              
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 90)
  def _reduce_34(val, _values)
                       ["var_assign", val.fetch(0), val.fetch(2)]
                 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 95)
  def _reduce_35(val, _values)
                      ["func_call", val.fetch(0), []]
                
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 100)
  def _reduce_36(val, _values)
                      ["func_call", val.fetch(0), val.fetch(2)]
                
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 105)
  def _reduce_37(val, _values)
                    ["ary_new", []]
              
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 109)
  def _reduce_38(val, _values)
                    ["ary_new", val.fetch(1)]
              
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 114)
  def _reduce_39(val, _values)
                    ["ary_ref", val.fetch(0), val.fetch(2)]
              
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 119)
  def _reduce_40(val, _values)
                       ["ary_assign", val.fetch(0), val.fetch(2), val.fetch(5)]
                 
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 124)
  def _reduce_41(val, _values)
                     ["hash_new", []]
               
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 128)
  def _reduce_42(val, _values)
                     ["hash_new", val.fetch(1)]
               
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 133)
  def _reduce_43(val, _values)
                  val.fetch(0)
            
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 137)
  def _reduce_44(val, _values)
                  val.fetch(2) + [val.fetch(0)]
            
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 142)
  def _reduce_45(val, _values)
                  val.fetch(0)
            
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 146)
  def _reduce_46(val, _values)
                  val.fetch(0) + val.fetch(2)
            
  end
.,.,

module_eval(<<'.,.,', 'parse.y', 151)
  def _reduce_47(val, _values)
                 [val.fetch(0), val.fetch(2)]
           
  end
.,.,

def _reduce_none(val, _values)
  val[0]
end

end   # class Parser
