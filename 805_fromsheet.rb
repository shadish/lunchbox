# From statements
closing_costs = 16200.91
cash_to_close = 178594.72

# From sheets
c = 118676.11
s1 = 28000
s2 = 60000

# Cash to close
calculated = c + s1 + s2

discrepency = calculated - (closing_costs + cash_to_close)

tot_third = calculated/3

c_owe = (tot_third - s1 - s2).round(2)* -1

puts "For closing conleys owe shad: #{c_owe}"
puts "--------"

shad_gpay = 16589.06
shad_check = 6500
shad_total = shad_check + shad_gpay

alaska_total_deposit = 42055.91
best_buy_refund = 1562.64
alaska_total = (alaska_total_deposit - best_buy_refund).round(2)
con_total = (alaska_total_deposit - shad_total).round(2)

ak_third = (alaska_total/3).round(2)
con_acct_owed = (shad_total - ak_third).round(2)

puts "Shad contributed #{shad_total} of #{alaska_total}, so conleys contributed #{con_total}, owing shad #{con_acct_owed}"
puts "--------"
tot_shad = con_acct_owed + c_owe

puts "Total payment to shad: #{tot_shad}"