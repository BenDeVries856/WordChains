import 'words.dart';

List<String> getDailyWordChain(Words words, Difficulty difficulty){
  List wordList = [];
  if(difficulty == Difficulty.easy){
    wordList = easyList;
  }else if(difficulty == Difficulty.medium){
    wordList = mediumList;
  }else if(difficulty == Difficulty.hard){
    wordList = hardList;
  }else if(difficulty == Difficulty.marathon){
    wordList = marathonList;
  }
  // find the word chain for the current date
  DateTime today = DateTime.now();
  for(List<String> chain in wordList){
    DateTime dt = DateTime.parse(chain[0]);
    if(today.year == dt.year && today.month == dt.month && today.day == dt.day){
      return chain.sublist(1);
    }
  }
  // if no word chains for current date, find one for current month and day from previous year
  for(List<String> chain in wordList){
    DateTime dt = DateTime.parse(chain[0]);
    if(today.month == dt.month && today.day == dt.day){
      return chain.sublist(1);
    }
  }
  // last resort, generate a new chain randomly
  return words.getChainByDifficulty(difficulty);
}

var easyList = [
  ["2024-08-31", "the", "thy", "shy", "sly", "slay", ],
  ["2024-09-01", "brew", "blew", "slew", "stew", "strew", ],
  ["2024-09-02", "rite", "bite", "bile", "pile", ],
  ["2024-09-03", "dig", "die", "dire", "ire", "ere", ],
  ["2024-09-04", "rule", "rune", "runt", "aunt", "aunty", ],
  ["2024-09-05", "mew", "sew", "saw", "saws", "saps", ],
  ["2024-09-06", "pin", "tin", "tie", "tier", "trier", ],
  ["2024-09-07", "sob", "son", "song", "sung", "bung", ],
  ["2024-09-08", "doer", "doe", "foe", "fob", ],
  ["2024-09-09", "leak", "beak", "beam", "seam", "sea", ],
  ["2024-09-10", "maul", "haul", "hauls", "halls", "malls", ],
  ["2024-09-11", "burr", "purr", "pure", "sure", "surer", ],
  ["2024-09-12", "ash", "sash", "slash", "clash", "class", ],
  ["2024-09-13", "rid", "red", "reed", "need", "needs", ],
  ["2024-09-14", "char", "chap", "cap", "cape", ],
  ["2024-09-15", "snob", "sob", "cob", "cot", ],
  ["2024-09-16", "duke", "dupe", "dupes", "dunes", "dunces", ],
  ["2024-09-17", "ship", "hip", "kip", "kit", ],
  ["2024-09-18", "tell", "cell", "cello", "hello", "hellos", ],
  ["2024-09-19", "gym", "gum", "gut", "gout", ],
  ["2024-09-20", "balm", "palm", "pals", "palls", ],
  ["2024-09-21", "nick", "pick", "picks", "pecks", ],
  ["2024-09-22", "yank", "dank", "drank", "crank", ],
  ["2024-09-23", "cab", "cub", "cue", "cure", ],
  ["2024-09-24", "cons", "cos", "cop", "op", ],
  ["2024-09-25", "toe", "the", "then", "thin", ],
  ["2024-09-26", "rue", "sue", "sure", "sore", "bore", ],
  ["2024-09-27", "mid", "amid", "arid", "grid", ],
  ["2024-09-28", "cam", "cams", "cads", "fads", ],
  ["2024-09-29", "jug", "mug", "mud", "cud", "cur", ],
  ["2024-09-30", "fib", "fit", "lit", "lip", ],
  ["2024-10-01", "line", "lane", "late", "plate", ],
];

var mediumList = [
  ["2024-08-31", "ribs", "rib", "fib", "fix", "six", ],
  ["2024-09-01", "steak", "speak", "spear", "swear", "swears", "shears", ],
  ["2024-09-02", "fawned", "dawned", "darned", "earned", "earner", "learner", ],
  ["2024-09-03", "vita", "via", "vial", "veal", "real", "rear", "fear", ],
  ["2024-09-04", "oaks", "oafs", "oaf", "oar", "jar", "jay", "hay", ],
  ["2024-09-05", "neon", "noon", "goon", "gown", "own", "on", "ion", ],
  ["2024-09-06", "cloth", "cloths", "sloths", "slots", "shots", "hots", "tots", ],
  ["2024-09-07", "earl", "ear", "wear", "weir", "weirs", ],
  ["2024-09-08", "loins", "loans", "loafs", "loaf", "leaf", "lean", "wean", ],
  ["2024-09-09", "volley", "valley", "valleys", "alleys", "allays", ],
  ["2024-09-10", "poet", "post", "posh", "tosh", "toss", "toys", ],
  ["2024-09-11", "yobs", "bobs", "boss", "bass", "brass", ],
  ["2024-09-12", "flu", "fly", "sly", "spy", "spry", "pry", ],
  ["2024-09-13", "not", "snot", "snort", "sport", "spore", ],
  ["2024-09-14", "cable", "gable", "gale", "bale", "bile", "file", "fine", ],
  ["2024-09-15", "chases", "cases", "bases", "bashes", "mashes", ],
  ["2024-09-16", "shoved", "shovel", "shovels", "hovels", "hotels", "hostels", ],
  ["2024-09-17", "hue", "huge", "hugs", "pugs", "pegs", ],
  ["2024-09-18", "batons", "baton", "baron", "barn", "bark", "dark", "dare", ],
  ["2024-09-19", "lords", "words", "worms", "wormy", "worry", ],
  ["2024-09-20", "bulk", "bulb", "bulbs", "bulls", "culls", "cells", "wells", ],
  ["2024-09-21", "boil", "foil", "foils", "foals", "goals", ],
  ["2024-09-22", "speeds", "spends", "spend", "send", "seed", ],
  ["2024-09-23", "kisses", "kissed", "missed", "massed", "amassed", ],
  ["2024-09-24", "par", "oar", "oaf", "of", "on", "one", ],
  ["2024-09-25", "combed", "bombed", "bobbed", "lobbed", "lobbied", "lobbies", "hobbies", ],
  ["2024-09-26", "cads", "cats", "mats", "macs", "mack", "jack", ],
  ["2024-09-27", "atones", "tones", "bones", "bone", "bond", "fond", "find", ],
  ["2024-09-28", "arc", "arcs", "arms", "aims", "maims", "maim", ],
  ["2024-09-29", "five", "fife", "fifes", "fines", "finds", "fiends", ],
  ["2024-09-30", "wan", "fan", "fang", "sang", "sag", "sax", ],
  ["2024-10-01", "saves", "sales", "males", "mares", "wares", ],
];

var hardList = [
  ["2024-08-31", "augurs", "augur", "auger", "anger", "angler", "angled", "mangled", "mangle", "mingle", ],
  ["2024-09-01", "barks", "narks", "narcs", "arcs", "arts", "darts", "dart", "hart", ],
  ["2024-09-02", "snored", "snared", "scared", "cared", "cred", "creed", "freed", "freer", ],
  ["2024-09-03", "walled", "galled", "gabled", "gables", "cables", "cable", "able", "axle", ],
  ["2024-09-04", "yawns", "lawns", "laws", "law", "lab", "tab", "tat", "stat", "swat", ],
  ["2024-09-04", "hovers", "rovers", "rover", "river", "fiver", "fiber", "fibers", "fibbers", "libbers", ],
  ["2024-09-05", "called", "calmed", "palmed", "paled", "paged", "caged", "cased", "cases", "causes", ],
  ["2024-09-06", "revise", "revised", "reviled", "reviles", "revives", "relives", "relive", "relieve", ],
  ["2024-09-07", "levied", "levies", "levees", "levee", "lever", "never", "newer", "sewer", ],
  ["2024-09-08", "mangy", "mingy", "zingy", "zings", "rings", "rungs", "runs", ],
  ["2024-09-09", "bluer", "blue", "flue", "flume", "flumes", "flutes", "fluted", "flouted", ],
  ["2024-09-10", "skiers", "skies", "spies", "spikes", "spokes", "spoke", "spake", ],
  ["2024-09-11", "verve", "nerve", "nervy", "nerdy", "nerds", "needs", "feeds", ],
  ["2024-09-12", "ballet", "ballets", "pallets", "pullets", "mullets", "mullet", "millet", ],
  ["2024-09-13", "sounds", "founds", "funds", "finds", "hinds", "hind", "bind", ],
  ["2024-09-14", "charts", "chars", "char", "chap", "champ", "chump", "chums", ],
  ["2024-09-15", "corps", "cores", "chores", "shores", "snores", "snore", "swore", "wore", "gore", ],
  ["2024-09-16", "terse", "verse", "averse", "avers", "avert", "overt", "covert", "coverts", ],
  ["2024-09-17", "reaps", "reap", "ream", "cream", "cram", "clam", "clamp", "champ", "champs", ],
  ["2024-09-18", "shriek", "shrieks", "shrinks", "shrines", "shines", "shined", "shinned", "shunned", "stunned", ],
  ["2024-09-19", "stodge", "stodgy", "stogy", "story", "storm", "storms", "storks", "stocks", ],
  ["2024-09-20", "sights", "slights", "blights", "brights", "frights", "fright", "aright", ],
  ["2024-09-21", "waked", "faked", "fated", "bated", "based", "base", "bass", "boss", ],
  ["2024-09-22", "retry", "retro", "metro", "metre", "metres", "mitres", "litres", ],
  ["2024-09-23", "coves", "coxes", "coxed", "cooed", "cooled", "tooled", "tootled", "toothed", "soothed", ],
  ["2024-09-24", "pimped", "wimped", "wiped", "swiped", "sniped", "snipes", "snips", "sips", "sip", ],
  ["2024-09-25", "flumes", "flukes", "flakes", "slakes", "stakes", "staves", "shaves", ],
  ["2024-09-26", "hoods", "hoofs", "woofs", "woof", "woo", "roo", "root", "coot", "cool", ],
  ["2024-09-27", "spoke", "spake", "spate", "spats", "spams", "spam", "scam", "scar", ],
  ["2024-09-28", "lambed", "lamed", "lamer", "later", "lather", "lathers", "fathers", ],
  ["2024-09-29", "rappel", "rappels", "rappers", "zappers", "zippers", "nippers", "nipper", "ripper", ],
  ["2024-09-30", "maxima", "maxim", "maxi", "taxi", "taxis", "taxes", "tapes", ],
  ["2024-10-01", "feeds", "reeds", "reels", "revels", "reveals", "reveal", "repeal", "repel", ],
];

var marathonList = [
  ["2024-08-31", "lucks", "ducks", "duck", "ruck", "truck", "track", "tract", "tact", "tart", "hart", "halt", "hale", "dale", "dame", "dames", "damps", "ramps", "cramps", "craps", "traps", "trams", "grams", "gram", ],
  ["2024-09-01", "swore", "snore", "snores", "spores", "spares", "spare", "sparse", "parse", "purse", "nurse", "nursed", "cursed", "curved", "carved", "carped", "camped", "ramped", "rasped", "grasped", "grassed", "grossed", "groused", ],
  ["2024-09-03", "pugs", "jugs", "jogs", "hogs", "hos", "hose", "hove", "dove", "dole", "sole", "some", "come", "comes", "coves", "cover", "over", "overs", "rovers", "rogers", "roger", "rower", "rowed", "towed", ],
  ["2024-09-04", "scour", "scours", "sours", "soups", "soup", "soap", "sap", "say", "jay", "joy", "jot", "jet", "set", "sea", "ska", "ski", "skim", "slim", "slims", "slits", "splits", "splats", "splat", ],
  ["2024-09-05", "berk", "jerk", "jerky", "perky", "perks", "perms", "berms", "beams", "reams", "rears", "dears", "dear", "sear", "swear", "swears", "spears", "speaks", "specks", "specs", "spews", "pews", "pegs", "megs", "mega", ],
  ["2024-09-06", "bored", "pored", "poured", "soured", "souped", "soaped", "shaped", "shaded", "shades", "shakes", "shakers", "shavers", "savers", "saver", "save", "sake", "bake", "baker", "biker", "biked", "liked", "limed", ],
  ["2024-09-07", "cued", "sued", "sled", "bled", "baled", "bated", "batted", "batten", "bitten", "bittern", "bitters", "betters", "fetters", "fetter", "wetter", "wetted", "petted", "pitted", "pitied", "pities", "cities", "cites", ],
  ["2024-09-08", "ware", "wake", "woke", "toke", "tokes", "tykes", "tyres", "lyres", "lures", "lutes", "flutes", "flumes", "fumes", "fuzes", "fazes", "fares", "farces", "forces", "forges", "forger", "former", ],
  ["2024-09-09", "ibis", "iris", "irks", "irk", "ark", "dark", "dank", "drank", "frank", "flank", "plank", "plane", "plate", "palate", "palates", "palaces", "places", "placed", "played", "player", "layer", "gayer", "grayer", "grader", ],
  ["2024-09-10", "sink", "jink", "junk", "funk", "funks", "punks", "pucks", "pecks", "peaks", "pears", "gears", "gear", "sear", "shear", "sheer", "sheep", "sweep", "sweet", "sleet", "sleety", "sleepy", "sleeps", "seeps", "seeds", ],
  ["2024-09-11", "whey", "whet", "wet", "pet", "per", "pear", "sear", "shear", "shears", "sheers", "steers", "steels", "steel", "steed", "speed", "speedy", "seedy", "seeds", "feeds", "feds", "fads", "ads", "adz", ],
  ["2024-09-12", "moss", "mods", "gods", "gobs", "lobs", "lots", "bots", "bogs", "blogs", "slogs", "slog", "slot", "soot", "sort", "tort", "torn", "horn", "hon", "con", "cow", "crow", ],
  ["2024-09-13", "rests", "crests", "cress", "crews", "brews", "brew", "grew", "grow", "glow", "glows", "lows", "sows", "sow", "bow", "boy", "by", "bi", "bib", "bibs", "nibs", "nips", "yips", "yids", "aids", "ads", ],
  ["2024-09-14", "calm", "call", "hall", "hell", "helm", "helms", "hems", "hers", "heirs", "hairs", "fairs", "fairy", "dairy", "daisy", "dais", "dams", "dames", "dimes", "dives", "doves", "does", "dyes", "yes", "yen", "ten", ],
  ["2024-09-15", "ball", "balm", "balms", "alms", "aims", "airs", "airy", "hairy", "harry", "hardy", "handy", "bandy", "band", "bank", "banks", "bunks", "hunks", "hunts", "aunts", "taunts", "taints", "taint", "tint", "lint", "lilt", ],
  ["2024-09-16", "teals", "deals", "dials", "dial", "dual", "duel", "due", "dug", "rug", "rig", "ring", "wring", "wrings", "wrongs", "prongs", "pongs", "gongs", "gong", "going", "goring", "coring", "coxing", "coaxing", "coating", ],
  ["2024-09-17", "sewn", "sown", "own", "owe", "ewe", "ewes", "eyes", "eyed", "dyed", "deed", "weed", "wed", "led", "bled", "blend", "bland", "brand", "rand", "rant", "pant", "pans", "pens", "tens", ],
  ["2024-09-18", "whip", "whips", "chips", "chimps", "champs", "camps", "camp", "ramp", "ram", "ream", "rear", "ear", "err", "era", "bra", "brag", "crag", "crab", "grab", "gab", "gag", "mag", ],
  ["2024-09-19", "brew", "grew", "grow", "prow", "pros", "bros", "boos", "moos", "mobs", "yobs", "yob", "fob", "fop", "pop", "plop", "plot", "clot", "coot", "hoot", "shoot", "short", "shorty", "sporty", "spotty", ],
  ["2024-09-20", "desks", "desk", "disk", "dirk", "dirks", "irks", "inks", "sinks", "slinks", "clinks", "clanks", "flanks", "flunks", "flunk", "clunk", "clung", "slung", "sling", "sting", "stings", "swings", "swines", "twines", "tines", "lines", ],
  ["2024-09-21", "year", "hear", "shear", "spear", "spar", "spam", "spams", "spans", "spins", "shins", "shin", "thin", "than", "thaw", "thaws", "haws", "hawk", "hark", "hard", "hand", "hind", "mind", "mink", "pink", "punk", "puns", ],
  ["2024-09-22", "tries", "trims", "brims", "brim", "brig", "brag", "bra", "baa", "ban", "bang", "bangs", "hangs", "hands", "hand", "land", "lank", "blank", "blanks", "blinks", "blinds", "blends", "bends", "tends", "tents", "tent", "text", ],
  ["2024-09-23", "wooly", "woody", "woods", "foods", "fools", "fouls", "fours", "ours", "curs", "curt", "cut", "cute", "cube", "cubed", "cued", "coed", "toed", "teed", "steed", "steeds", "seeds", ],
  ["2024-09-24", "clad", "clan", "clang", "clung", "flung", "flunk", "slunk", "sunk", "gunk", "gunky", "funky", "funks", "punks", "puns", "runs", "runts", "rusts", "rusty", "crusty", "crust", "crest", "crept", "crepe", "crepes", "cripes", "crises", ],
  ["2024-09-25", "woke", "coke", "choke", "chore", "chores", "cores", "cures", "curds", "cuds", "puds", "pus", "us", "ups", "ops", "lops", "lobs", "robs", "roos", "roof", "proof", "prof", "prom", "pram", "pray", ],
  ["2024-09-26", "aloo", "aloe", "floe", "flop", "plop", "plow", "plows", "lows", "wows", "woes", "toes", "totes", "tote", "tot", "tom", "tomb", "tombs", "combs", "comas", "colas", "cola", "coda", "soda", ],
  ["2024-09-27", "dated", "date", "gate", "gaze", "haze", "hare", "bare", "bore", "bored", "boded", "bodged", "budged", "fudged", "fudges", "judges", "judge", "nudge", "nude", "nuke", "nukes", "dukes",],
  ["2024-09-28", "boxed", "bowed", "towed", "toned", "tones", "stones", "stone", "stove", "shove", "shave", "shaver", "shavers", "shivers", "shiners", "shiner", "whiner", "whines", "whinges", "whinge", "hinge", "binge", "bingo", "dingo", "dings", "kings", ],
  ["2024-09-29", "muss", "must", "musty", "rusty", "crusty", "crust", "trust", "thrust", "thrush", "thrash", "trash", "brash", "bash", "bask", "bark", "dark", "dork", "dory", "gory", "gore", "lore", "lord", "word", "worm", "corm", ],
  ["2024-09-30", "bloom", "boom", "room", "roof", "woof", "woos", "woks", "works", "work", "cork", "corm", "norm", "norms", "forms", "foams", "foamy", "loamy", "loam", "loaf", "loafs", "leafs", "leafy", "leaky", "leak", "weak", ],
  ["2024-10-01", "tripe", "stripe", "strip", "strap", "straw", "straws", "strays", "sprays", "spays", "spams", "spam", "swam", "swap", "sap", "sip", "nip", "nit", "it", "id", "ad", "lad", ],
];