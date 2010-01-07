#All this is reverse-engineered from the calculator below
#http://disgaea.gamexploiter.com/calcs/d2_enext.php
class Character
  module ExpToLevel
    
    module ClassMethods
      def base_exp_next_for_level(level)
        level = level.to_f
        case level
        when 2000..9999
          ( (level - 0.608) * 305.040 ).floor
        when 1000...2000
          ( (level - 0.597) * 305.038 ).floor
        when 600...1000
          ( (level - 0.514) * 305.010 ).floor
        when 550...600
          ( (level - 0.495) * 305.000 ).floor
        when 450...550
          ( (level - 0.423) * 304.960 ).floor
        end
          
#        if (Level >= 2000) {Base_Enext = Math.floor((Level - 0.608) * (305.04))}
#(Level >= 1000 && Level <= 2000) {Base_Enext = Math.floor((Level - 0.597) * (305.038))}
#(Level >= 600 && Level <= 1000) {Base_Enext = Math.floor((Level - 0.514) * (305.01))}
#(Level >= 550 && Level <= 600) {Base_Enext = Math.floor((Level - 0.495) * (305.00))}
#(Level >= 450 && Level <= 550) {Base_Enext = Math.floor((Level - 0.423) * (304.96))}
#(Level >= 400 && Level <= 450) {Base_Enext = Math.floor((Level - 0.305) * (304.88))}
#(Level >= 350 && Level <= 400) {Base_Enext = Math.floor((Level - 0.200) * (304.80))}
#(Level >= 300 && Level <= 350) {Base_Enext = Math.floor((Level + 0.007) * (304.62))}
#(Level >= 280 && Level <= 300) {Base_Enext = Math.floor((Level + 0.273) * (304.35))}
#(Level >= 260 && Level <= 280) {Base_Enext = Math.floor((Level + 0.411) * (304.20))}
#(Level >= 250 && Level <= 260) {Base_Enext = Math.floor((Level + 0.754) * (303.80))}
        
      end
    end
    
    module InstanceMethods
      
    end
  end
  
  def base_exp
    experience / exp_rate
  end
  
  #FIXME: Needs to work on levels >= 255, possible off-by-one error?
  def level
    LEVELS_TO_EXP.keys.sort.each do |level|
      exp = LEVELS_TO_EXP[level]
      if exp >= base_exp
        return level - 1
      end
    end
    nil
  end
  
  BASE_EXP_NEXT_PER_LEVEL = {
    1 => 3,
    2 => 6,
    3 => 13,
    4 => 21,
    5 => 32,
    6 => 46,
    7 => 63,
    8 => 83,
    9 => 106,
    10 => 135,
    11 => 165,
    12 => 202,
    13 => 242,
    14 => 286,
    15 => 337,
    16 => 392,
    17 => 453,
    18 => 519,
    19 => 591,
    20 => 670,
    21 => 755,
    22 => 847,
    23 => 944,
    24 => 1051,
    25 => 1164,
    26 => 1284,
    27 => 1412,
    28 => 1549,
    29 => 1694,
    30 => 1848,
    31 => 2010,
    32 => 2181,
    33 => 2362,
    34 => 2552,
    35 => 2753,
    36 => 2962,
    37 => 3182,
    38 => 3414,
    39 => 3744,
    40 => 3908,
    41 => 4171,
    42 => 4446,
    43 => 4733,
    44 => 5032,
    45 => 5343,
    46 => 5666,
    47 => 6003,
    48 => 6351,
    49 => 6713,
    50 => 7090,
    51 => 7478,
    52 => 7881,
    53 => 8298,
    54 => 8729,
    55 => 9176,
    56 => 9637,
    57 => 10112,
    58 => 10603,
    59 => 11110,
    60 => 11633,
    61 => 12171,
    62 => 12726,
    63 => 13298,
    64 => 13885,
    65 => 14502,
    66 => 15113,
    67 => 15752,
    68 => 16410,
    69 => 17084,
    70 => 17778,
    71 => 18490,
    72 => 19221,
    73 => 19970,
    74 => 20739,
    75 => 21528,
    76 => 22334,
    77 => 23162,
    78 => 24010,
    79 => 24877,
    80 => 25767,
    81 => 26675,
    82 => 27606,
    83 => 28557,
    84 => 29531,
    85 => 30525,
    86 => 31542,
    87 => 32582,
    88 => 33644,
    89 => 34728,
    90 => 35836,
    91 => 36967,
    92 => 38121,
    93 => 39298,
    94 => 40500,
    95 => 41726,
    96 => 42977,
    97 => 44252,
    98 => 45551,
    99 => 98301,
    100 => 37047,
    101 => 36768,
    102 => 36560,
    103 => 36414,
    104 => 36321,
    105 => 36272,
    106 => 36260,
    107 => 36282,
    108 => 36331,
    109 => 36406,
    110 => 36502,
    111 => 36617,
    112 => 36749,
    113 => 36896,
    114 => 37055,
    115 => 37227,
    116 => 37409,
    117 => 37601,
    118 => 37801,
    119 => 38009,
    120 => 38223,
    121 => 38445,
    122 => 38671,
    123 => 38904,
    124 => 39140,
    125 => 39381,
    126 => 39627,
    127 => 39875,
    128 => 40127,
    129 => 40383,
    130 => 40640,
    131 => 40902,
    132 => 41165,
    133 => 41430,
    134 => 41698,
    135 => 41968,
    136 => 42239,
    137 => 42512,
    138 => 42787,
    139 => 43063,
    140 => 43341,
    141 => 43619,
    142 => 43900,
    143 => 44182,
    144 => 44463,
    145 => 44747,
    146 => 45032,
    147 => 45316,
    148 => 45603,
    149 => 45890,
    150 => 46177,
    151 => 46466,
    152 => 46754,
    153 => 47045,
    154 => 47334,
    155 => 47626,
    156 => 47917,
    157 => 48209,
    158 => 48501,
    159 => 48795,
    160 => 49086,
    161 => 49382,
    162 => 49675,
    163 => 49970,
    164 => 50265,
    165 => 50560,
    166 => 50856,
    167 => 51152,
    168 => 51448,
    169 => 51744,
    170 => 52042,
    171 => 52338,
    172 => 52635,
    173 => 52934,
    174 => 53231,
    175 => 53529,
    176 => 53827,
    177 => 54125,
    178 => 54425,
    179 => 54723,
    180 => 55022,
    181 => 55321,
    182 => 55621,
    183 => 55920,
    184 => 56219,
    185 => 56520,
    186 => 56820,
    187 => 57119,
    188 => 57420,
    189 => 57720,
    190 => 58021,
    191 => 58322,
    192 => 58622,
    193 => 58923,
    194 => 59223,
    195 => 59525,
    196 => 59827,
    197 => 60127,
    198 => 60429,
    199 => 60730,
    200 => 61031,
    201 => 61334,
    202 => 61635,
    203 => 61936,
    204 => 62239,
    205 => 62541,
    206 => 62842,
    207 => 63145,
    208 => 63447,
    209 => 63749,
    210 => 64051,
    211 => 64353,
    212 => 64656,
    213 => 64959,
    214 => 65261,
    215 => 65563,
    216 => 65867,
    217 => 66168,
    218 => 66472,
    219 => 66774,
    220 => 67077,
    221 => 67380,
    222 => 67683,
    223 => 67986,
    224 => 68289,
    225 => 68592,
    226 => 68895,
    227 => 69198,
    228 => 69501,
    229 => 69805,
    230 => 70108,
    231 => 70411,
    232 => 70714,
    233 => 71018,
    234 => 71321,
    235 => 71624,
    236 => 71928,
    237 => 72231,
    238 => 72535,
    239 => 72838,
    240 => 73142,
    241 => 73445,
    242 => 73749,
    243 => 74053,
    244 => 74356,
    245 => 74660,
    246 => 74964,
    247 => 75268,
    248 => 75571,
    249 => 75875,
    250 => 76179
  }
  
  LEVELS_TO_EXP = {}
  total_exp = 0
  BASE_EXP_NEXT_PER_LEVEL.keys.sort.each do |level|
    next_exp = BASE_EXP_NEXT_PER_LEVEL[level]
    LEVELS_TO_EXP[level] = total_exp
    total_exp += next_exp
  end

end