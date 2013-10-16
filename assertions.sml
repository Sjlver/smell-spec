datatype assertionResult = Passed
                         | Failed of string

structure Assert =
struct
  fun equal (x, y) = if x = y then Passed
                     else Failed "expectation failed"
  (* fun greaterThan (x, y) = ("expectation failed", x > y) *)
  (* fun lessThan (x, y) = ("expectation failed", x < y) *)

  (* fun raises (f, e) = *)
  (*   (f(); ("no exception was raised", false)) *)
  (*   handle e' => if exnName e = exnName e' *)
  (*                then ("", true) *)
  (*                else ("expected "^exnName(e)^" to be raised but "^ *)
  (*                exnName(e')^" was", false) *)
end

(* structure AssertInt = *)
(* struct *)
(*   fun equal (x, y) = *)
(*     ("expected "^Int.toString(x)^" to equal "^Int.toString(y), x = y) *)

(*   fun greaterThan (x, y) = *)
(*     ("expected "^Int.toString(x)^" to be greater than "^Int.toString(y), x > y) *)

(*   fun lessThan (x, y) = *)
(*     ("expected "^Int.toString(x)^" to equal "^Int.toString(y), x < y) *)
(* end *)

(* structure AssertString = *)
(* struct *)
(*   fun equal (x, y) = *)
(*     ("expected \""^x^"\" to equal \""^y^"\"", x = y) *)
(* end *)

(* local *)
(*   fun removeLastChar "" = "" *)
(*     | removeLastChar s  = *)
(*       let val chars = explode(s) *)
(*       in implode (List.take (chars, length(chars)-1)) *)
(*       end *)

(*   fun stringListToString l = *)
(*     let *)
(*       val values = *)
(*         removeLastChar(removeLastChar(foldl (fn (x, acc) => acc^"\""^x^"\""^", ") "" l)) *)
(*     in *)
(*       "["^values^"]" *)
(*     end *)
(* in *)
(*   structure AssertStringList = *)
(*   struct *)
(*     fun equal (x, y) = *)
(*       ("expected "^stringListToString(x)^" to equal "^stringListToString(y), x = y) *)
(*   end *)

(*   fun intListToString l = *)
(*     let *)
(*       val values = *)
(*         removeLastChar(removeLastChar(foldl (fn (x, acc) => *)
(*         acc^"\""^Int.toString(x)^"\""^", ") "" l)) *)
(*     in *)
(*       "["^values^"]" *)
(*     end *)

(*   structure AssertIntList = *)
(*   struct *)
(*     fun equal (x, y) = *)
(*       ("expected "^intListToString(x)^" to equal "^intListToString(y), x = y) *)
(*   end *)
(* end *)
