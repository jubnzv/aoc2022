open Core

module Part1 = struct
  In_channel.with_file "day01/input.txt" ~f:(fun ic ->
      In_channel.fold_lines ic ~init:(0, 0) ~f:(fun (cur, max) line ->
          if String.is_empty line then (0, Int.max max cur)
          else (cur + int_of_string line, max))
      |> fun (_, max) -> Printf.printf "Part 1: %d\n" max)
end

module Part2 = struct
  In_channel.with_file "day01/input.txt" ~f:(fun ic ->
      In_channel.fold_lines ic ~init:(0, []) ~f:(fun (cur, acc) line ->
          if String.is_empty line then (0, acc @ [ cur ])
          else (cur + int_of_string line, acc))
      |> fun (_, vs) ->
      let (a :: b :: c :: _) = List.sort vs ~compare:Int.descending in
      Printf.printf "Part 2: %d\n" (a + b + c))
end [@warning "-8"]
