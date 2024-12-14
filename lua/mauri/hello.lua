-- print("Hello from mauri folder")
-- z={x=1, y=2}

function fact (n)
  if n == 0 then
    return 1
  else
    return n * fact (n-1)
  end
end

-- print("enter a number: ")
-- a = io.read("*number")
-- print(fact(a))

function Add(opts)
    return opts.x + opts.y
end

local function TestPrint()
    print("hello from inside a function")
end

co = coroutine.create(function (x)
  print(x) --> 10
  x = coroutine.yield(20)
  print(x) --> 30
  return 40
end)
print(coroutine.resume(co, 10)) --> 20
-- print(coroutine.resume(co, 30)) --> 40
