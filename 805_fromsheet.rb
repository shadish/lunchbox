# From statements
closing_costs = 16200.91
cash_to_close = 178594.72

# From sheets
c = 118676.11
s1 = 28000
s2 = 60000

# Cash to close
calculated = c + s1 + s2
puts calculated
puts closing_costs + cash_to_close

discrepency = calculated - (closing_costs + cash_to_close)
puts discrepency.round 2
exit

tot_third = calculated * 0.333

c_owe = (tot_third - s1 - s2).round 2

puts "Owed: $#{c_owe}"