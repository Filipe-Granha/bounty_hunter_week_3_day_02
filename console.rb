 require ("pry-byebug")
 require_relative("bounty_hunter")

 bounty_hunter_1 = BountyHunter.new({
"name" => "Filipe",
"bounty_value" => 10,
"favourite_weapon" => "laser",
"danger_level" => "high"
})


  bounty_hunter_2 = BountyHunter.new({
 "name" => "Ciaran",
 "bounty_value" => 15,
 "favourite_weapon" => "super-laser",
 "danger_level" => "super-high"
 })

bounty_hunter_1.save()
bounty_hunter_2.save()





binding.pry
nil