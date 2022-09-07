# Payment
loan_amount = 756000.00
interest_rate = 0.05375
monthly_payment = 4233.38
estimated_total_monthly = 4971.07
estimated_taxes = 760.69

# 1003 Uniform Residential
first_mortgage = 4233.38
ho_insurance = 110.33
prop_taxes = 627.36
hoa  = 23

puts [first_mortgage, ho_insurance, prop_taxes, hoa].sum 
puts [first_mortgage, ho_insurance, prop_taxes, hoa].sum * 0.33
exit



# Closing
closing_costs = 16200.91
cash_to_close = 178594.72

shad_chx = 32483
shad_sav = 71970
con_sav = 122725

avail = shad_chx + shad_sav + con_sav
to_close = -178594
earnest = 28000

puts to_close + avail #+ earnest
