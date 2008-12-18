# Services seed data
Service.seed do |s|
  s.title = "Carpet Cleaning"
  s.body = ""
  s.account_id = account.id
  s.active = 1
end

Service.seed do |s|
  s.title = "Upholstery Cleaning"
  s.body = ""
  s.account_id = account.id
  s.active = 1
end

Service.seed do |s|
  s.title = "Tile & Grout"
  s.body = ""
  s.account_id = account.id
  s.active = 0
end

Service.seed do |s|
  s.title = "Window Washing"
  s.body = ""
  s.account_id = account.id
  s.active = 0
end

Service.seed do |s|
  s.title = "Oriental Rug Cleaning"
  s.body = ""
  s.account_id = account.id
  s.active = 0
end

Service.seed do |s|
  s.title = "Hardwood Floor Detailing"
  s.body = ""
  s.account_id = account.id
  s.active = 0
end
