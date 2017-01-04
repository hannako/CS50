#### First challenge:
Random array generator which can be seeded: generate.rb

#### Second challenge:
Implement a linear search. It expects a single command-line argument a "needle" to search for in a "haystack" of values.
Prompt to provide some hay (i.e, integers) one "straw" at a time.

```
needle = ARGV.first(&:to_i)
hay = []
loop do
  puts 'hay?'
  straw = STDIN.gets.chomp
  hay << straw
  break if straw == ''
end
Finder.linear_search(needle, hay)
```

#### Third challenge:
Hay can be piped in to the linear_search from generate.rb via the command-line.
```
ruby p_sets/3/generate.rb 10 10| ruby p_sets/3/find.rb 21
```

#### Fourth challenge:
Implement a function that sorts from smallest to largest
the array of numbers that its passed, in such a way that its running time is in `O(n2)`, where `n` is the array's size.
Odds are you'll want to implement bubble sort, selection sort, or insertion sort.
Take care not to alter our declaration of sort. Its prototype must remain:
```
void sort(int values[], int n)
```

#### Fifth challenge:
Refactor the Finder module to use binary search
