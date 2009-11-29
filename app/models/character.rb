class Character < BaseData
  include Structure
  SIZE = 3072
  
  structure(
    [:experience,       :uint64],
    [:unknown01,        [:int8,2512]],
    [:stats,            Stats],
    [:base_stats_maybe, Stats],
    [:unknown02,        [:int32,8]],
    [:mana,             :uint32],
    [:unknown03,        [:int8,456]]
  )

end