# SubscriptionPlan.seed do |s|
#   s.id = 1
#   s.name = "Basic"
#   s.amount = 10    
#   s.renewal_period = 1
#   s.trial_period = 1
# end

SubscriptionPlan.seed do |s|
  s.id = 2
  s.name = "Basic"
  s.amount = 100    
  s.renewal_period = 12
  s.trial_period = 0
end

# SubscriptionPlan.seed do |s|
#   s.id = 3
#   s.name = "Plus"
#   s.amount = 20    
#   s.renewal_period = 1
#   s.trial_period = 1
# end

SubscriptionPlan.seed do |s|
  s.id = 4
  s.name = "Plus"
  s.amount = 200    
  s.renewal_period = 12
  s.trial_period = 0
end

# SubscriptionPlan.seed do |s|
#   s.id = 5
#   s.name = "Premium"
#   s.amount = 30    
#   s.renewal_period = 1
#   s.trial_period = 1
# end

SubscriptionPlan.seed do |s|
  s.id = 6
  s.name = "Premium"
  s.amount = 300    
  s.renewal_period = 12
  s.trial_period = 0
end