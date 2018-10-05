require "minruby"
require "./parse.tab.rb"

# An implementation of the evaluator
def evaluate(exp, env)
  # exp: A current node of AST
  # env: An environment (explained later)

  case exp[0]

#
## Problem 1: Arithmetics
#

  when "lit"
    exp[1] # return the immediate value as is

  when "+"
    evaluate(exp[1], env) + evaluate(exp[2], env)
  when "-"
    evaluate(exp[1], env) - evaluate(exp[2], env)
  when "*"
    evaluate(exp[1], env) * evaluate(exp[2], env)
  when "/"
    evaluate(exp[1], env) / evaluate(exp[2], env)
  when "%"
    evaluate(exp[1], env) % evaluate(exp[2], env)
  when ">"
    evaluate(exp[1], env) > evaluate(exp[2], env)
  when "<"
    evaluate(exp[1], env) < evaluate(exp[2], env)
  when "=="
    evaluate(exp[1], env) == evaluate(exp[2], env)
  # ... Implement other operators that you need


#
## Problem 2: Statements and variables
#

  when "stmts"
    exp[1..-1].map do |stmt|
      evaluate(stmt, env)
    end

  # The second argument of this method, `env`, is an "environement" that
  # keeps track of the values stored to variables.
  # It is a Hash object whose key is a variable name and whose value is a
  # value stored to the corresponded variable.

  when "var_ref"
    env[exp[1]]

  when "var_assign"
    env[exp[1]] = evaluate(exp[2], env)


#
## Problem 3: Branchs and loops
#

  when "if"
    if evaluate(exp[1], env)
      evaluate(exp[2], env)
    else
      evaluate(exp[3], env)
    end

  when "while"
    while evaluate(exp[1], env)
      evaluate(exp[2], env)
    end


#
## Problem 4: Function calls
#

  when "func_call"
    # Lookup the function definition by the given function name.
    func = $function_definitions[exp[1]]

    if func.nil?
      # We couldn't find a user-defined function definition;
      # it should be a builtin function.
      # Dispatch upon the given function name, and do paticular tasks.
      case exp[1]
      when "p"
        # MinRuby's `p` method is implemented by Ruby's `p` method.
        p(evaluate(exp[2], env))
      # ... Problem 4
      when "Integer"
        Integer(evaluate(exp[2], env))
      when "fizzbuzz"
        i = evaluate(exp[2], env)

        if i % 15 == 0
          "FizzBuzz"
        elsif i % 3 == 0
          "Fizz"
        elsif i % 5 == 0
          "Buzz"
        else
          i
        end
      else
        raise("unknown builtin function")
      end
    else


#
## Problem 5: Function definition
#

      func = $function_definitions[exp[1]]
      arg_vars = func[0]
      arg_vals = exp[2..-1]

      if arg_vars.length != arg_vals.length
        raise("wrong number of arguments (given #{arg_vals.length}, expected #{arg_vars.length})")
      end

      local_env = env.dup

      arg_vars.zip(arg_vals).each do |var, val|
        local_env[var] = evaluate(val, env)
      end

      retval = nil

      func[1..-1].each do |e|
        retval = evaluate(e, local_env)
      end

      retval
    end

  when "func_def"
    $function_definitions[exp[1]] = exp[2..-1]


#
## Problem 6: Arrays and Hashes
#

  # You don't need advices anymore, do you?
  when "ary_new"
    exp[1..-1].map do |e|
      evaluate(e, exp)
    end

  when "ary_ref"
    ary = evaluate(exp[1], env)
    ary[evaluate(exp[2], env)]

  when "ary_assign"
    ary = evaluate(exp[1], env)
    ary[evaluate(exp[2], env)] = evaluate(exp[3], env)

  when "hash_new"
    exp[1..-1].each_slice(2).map {|key, val|
      [evaluate(key, env), evaluate(val, env)]
    }.to_h

  else
    p("error")
    pp(exp)
    raise("unknown node")
  end
end


$function_definitions = {}
env = {}

# `minruby_load()` == `File.read(ARGV.shift)`
# `minruby_parse(str)` parses a program text given, and returns its AST

prog = File.read(ARGV.shift)

p Parser.parse(prog)

#puts prog
p minruby_parse(prog)
#evaluate(minruby_parse(arg), env)
