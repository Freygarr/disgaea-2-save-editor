class Character < BaseData
  include Structure
  SIZE = 3072
  
  structure(
    [:experience,         :uint64],
    #[:unknown01,          [:unknown,2512]],
    [:unknown01,          [:unknown,1024]],
    [:name,               [:string,41]],
    [:tunknown,           [:unknown,1443]],
    [:stats,              Stats],
    [:base_stats_maybe,   Stats],
    [:unknown02,          [:unknown,32]],
    [:mana,               :uint32],
    [:unknown03,          [:unknown,78]],
    [:felonies_total,     Int16],
    [:felonies_displayed, Int16],
    [:unknown04,          [:unknown,374]]
  )

end