datatype assertionResult = Passed
                         | Failed of string

structure Assert =
struct
  fun equal (x, y) = if x = y then Passed
                     else Failed "expectation failed"

  fun greaterThan (x, y) = if x > y then Passed
                           else Failed "expectation failed"

  fun lessThan (x, y) = if x < y then Passed
                        else Failed "expectation failed"

  fun truthy x = if x then Passed
                 else Failed "expected false to be true"

  fun falsy x = if not x then Passed
                else Failed "expected true to be false"

  fun raises (f, e) =
    (f(); Failed "no exception was raised")
    handle e' => if exnName e = exnName e'
                 then Passed
                 else Failed ("expected "^exnName(e)^" to be raised but "^ exnName(e')^" was")
end

structure AssertInt =
struct
  fun equal (x, y) =
    if x = y then Passed
    else Failed ("expected "^Int.toString(x)^" to equal "^Int.toString(y))

  fun greaterThan (x, y) =
    if x > y then Passed
    else Failed ("expected "^Int.toString(x)^" to be greater than "^Int.toString(y))

  fun lessThan (x, y) =
    if x < y then Passed
    else Failed ("expected "^Int.toString(x)^" to equal "^Int.toString(y))
end

structure AssertReal =
struct
  fun equal (x, y) =
    if Real.compare(x, y) = EQUAL then Passed
    else Failed ("expected "^Real.toString(x)^" to equal "^Real.toString(y))

  fun greaterThan (x, y) =
    if Real.compare(x, y) = GREATER then Passed
    else Failed ("expected "^Real.toString(x)^" to be greater than "^Real.toString(y))

  fun lessThan (x, y) =
    if Real.compare(x, y) = LESS then Passed
    else Failed ("expected "^Real.toString(x)^" to be less than "^Real.toString(y))
end

structure AssertString =
struct
  fun equal (x, y) =
    if x = y then Passed
    else Failed ("expected \""^x^"\" to equal \""^y^"\"")
end

local
  fun removeLastChar "" = ""
    | removeLastChar s  =
      let val chars = explode(s)
      in implode (List.take (chars, length(chars)-1))
      end

  fun stringListToString l =
    let
      val values =
        removeLastChar(removeLastChar(foldl (fn (x, acc) => acc^"\""^x^"\""^", ") "" l))
    in
      "["^values^"]"
    end
in
  structure AssertStringList =
  struct
    fun equal (x, y) =
      if x = y then Passed
      else Failed ("expected "^stringListToString(x)^" to equal "^stringListToString(y))
  end

  fun intListToString l =
    let
      val values =
        removeLastChar(removeLastChar(foldl (fn (x, acc) =>
        acc^"\""^Int.toString(x)^"\""^", ") "" l))
    in
      "["^values^"]"
    end

  structure AssertIntList =
  struct
    fun equal (x, y) =
      if x = y then Passed
      else Failed ("expected "^intListToString(x)^" to equal "^intListToString(y))
  end
end
