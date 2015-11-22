library(shiny)

#needed calls
suppressPackageStartupMessages(library(plyr,quietly = TRUE,warn.conflicts = TRUE))
suppressPackageStartupMessages(library(data.table,quietly = TRUE,warn.conflicts = TRUE))
suppressPackageStartupMessages(library(dplyr,quietly = TRUE,warn.conflicts = TRUE))


#establish Lexicons for Real, Nonsense, and Banned Words for OG Level I
#Real Lexicon includes properly spelled, age-appropriate, meaningful English
# words which follow the rules for a short vowel between two consonants.

RealLexicon<-c(" abs"," ack", " ads", " all", " ash", " at", "Babs", "back",
               "backs", "bad", "bag", "bags", "ball", "balls", "bang", "bank",
               "bash", "bass", "bat", "batch", "bath", "baths", "bats", "Beck",
               "bed", "beds", "beg", "begs", "bell", "bells", "Bess", "bet",
               "Beth", "bets", "bib", "bibs", "bid", "bids", "Biff", "big",
               "bill", "bills", "bing", "bit", "bits", "Bob", "bobs", "bog",
               "bogs", "bop", "bops", "bosh", "boss", "bot", "botch", "bots",
               "Bub", "buck", "bucks", "bud", "buds", "buff", "buffs", "bug",
               "bugs", "bull", "bulls", "bung", "bunk", "buss", "but", "buzz",
               "Chad", "chaff", "chaffs", "Chang", "chap", "chaps", "chat",
               "chats", "check", "checks", "Cheng", "chess", "Chet", "chill",
               "chills", "chip", "chips", "chit", "chits", "chock", "chocks",
               "chop", "chops", "Chuck", "chucks", "chug", "chugs", "Chung",
               "chunk", "Eb", "Ed", " ell", " ells", " etch", "fab", "fad",
               "fads", "fall", "falls", "fang", "fat", "fats", "fed", "feds",
               "fell", "fetch", "fez", "fib", "fibs", "fig", "figs", "fill",
               "fills", "fink", "finks", "fish", "fit", "fits", "fizz", "fob",
               "fobs", "fog", "fogs", "fop", "fops", "fuss", "fuzz", "hab",
               "habs", "hack", "hacks", "had", "hag", "hags", "hall", "halls",
               "hang", "hank", "hash", "hat", "hatch", "hath", "hats", "heck",
               "hick", "hicks", "hid", "hill", "hills", "hip", "hips", "hiss",
               "hit", "hitch", "hits", "hob", "hobs", "hock", "hod", "hods",
               "hog", "hogs", "honk", "hop", "hops", "hot", "hub", "huck",
               "huff", "huffs", "hug", "hugs", "hull", "hulls", "hung",
               "hunk", "hush", "hut", "hutch", "", "Hoth", "hubs", " ick",
               " ill", " ills", " ink", " it", " itch", " its", "jab", "jabs",
               "jack", "jacks", "jag", "jags", "jazz", "Jeb", "Jed","Jeff", "Jess",
               "jet", "jets", "jib", "jibs", "jiff", "jiffs", "jig", "jigs",
               "Jill", "job", "jobs", "jog", "jogs", "jot", "jots", "Jud",
               "jug", "jugs", "junk", "lab", "labs", "lack", "lacks", "lad",
               "lads", "lag", "lags", "lank", "lap", "laps", "lash", "lass",
               "latch", "led", "leg", "legs", "less", "let", "lick", "licks",
               "lid", "lids", "link", "lip", "lips", "lit", "lob", "lobs",
               "lock", "locks", "log", "logs", "loll", "lolls", "long", "lop",
               "lops", "loss", "lot", "lots", "luck", "lug", "lugs", "lull",
               "lulls", "lung", "lunk", "lush", "mad", "mall", "malls", "map",
               "maps", "mash", "mass", "mat", "match", "math", "mats", "Meg",
               "mesh", "mess", "met", "Mets", "mid", "miff", "miffs", "MiG",
               "MiGs", "mill", "mills", "Ming", "mink", "miss", "Mitch", "mob",
               "mobs", "mock", "mocks", "mod", "mods", "moll", "molls", "monk",
               "mop", "mops", "mosh", "moss", "moth", "moths", "much", "muck",
               "mucks", "mud", "mug", "mugs", "mull", "mulls", "mush", "muss",
               "nag", "nags", "nap", "naps", "nash", "Nats", "Ned", "Nell", "net",
               "nets", "nib", "nibs", "Nick", "nip", "nips", "nit", "nits",
               "nock", "nocks", "nod", "nods", "nog", "nogs", "nosh", "not",
               "notch", "nub", "nubs", "null", "nulls", "nut", "nuts", " off",
               "quack", "quacks", "quell", "quells", "quick", "quicks", "quid",
               "quids", "quill", "quills", "quip", "quips", "quit", "quiz", "rack",
               "racks", "rad", "rag", "rags", "rang", "rank", "rap", "raps",
               "rash", "rat", "rats", "razz", "red", "Reds", "ref", "refs",
               "rep", "reps", "retch", "rib", "ribs", "rich", "Rick", "rid",
               "rids", "riff", "riffs", "rig", "rigs", "rill", "rills", "ring",
               "rink", "rip", "rips", "rob", "robs", "rock", "rocks", "rod",
               "rods", "Ross", "rot", "Roth", "rots", "rub", "rubs", "ruff",
               "ruffs", "rug", "rugs", "rung", "rush", "Russ", "rut", "ruts",
               "sack", "sacks", "sad", "sag", "sags", "sang", "sank", "sap",
               "saps", "sash", "sass", "sat", "sell", "sells", "set", "Seth",
               "sets", "shack", "shacks", "shad", "shads", "shank", "shed",
               "sheds", "shell", "shells", "shill", "shills", "ship", "ships",
               "shock", "shocks", "shod", "shop", "shops", "shot", "shots",
               "shuck", "shucks", "shush", "shut", "shuts", "sib", "sibs",
               "sick", "sicks", "Sid", "sill", "sills", "sing", "sink", "sip",
               "sips", "sit", "Sith", "Siths", "sits", "sob", "sobs", "sock",
               "socks", "sod", "sods", "song", "sop", "sops", "sub", "subs",
               "such", "suds", "sung", "sunk", "sup", "sups", "suss", "Thad",
               "that", "thick", "thing", "think", "thong", "Thoth", "thug",
               "thugs", "thus", " up", "whack", "whacks", "whet", "whets",
               "which", "whiff", "whiffs", "Whig", "Whigs", "whip", "whips",
               "whit", "whizz")

#Nonsense Lexicon includes nonsense words which have only one possible correct
# pronunciation according to the rules for a short vowel between two consonants.

NonsenseLexicon<- c("ab", " acks", " ad", " aff", " affs", " ag", " ags", " ang",
                    " ank", " ap", " aps", " atch", " ath", " aths", " azz", "bab", "baff", "baffs", "bap", "baps",
                    "bazz", "beb", "bebs", "becks", "beff", "beffs", "bep", "beps", "besh",
                    "betch", "beths", "bezz", "bick", "bicks", "biffs", "bink", "bip", "bips",
                    "bish", "biss", "bith", "biths", "bizz", "boch", "bock", "bocks", "bonk",
                    "boths", "bozz", "bubs", "bup", "bups", "buth", "buths", "buts", "chab",
                    "chabs", "chach", "chack", "chacks", "chads", "chag", "chags", "chall",
                    "challs", "chank", "chash", "chass", "chatch", "chath", "chaths", "chazz",
                    "cheb", "chebs", "ched", "cheds", "cheff", "cheffs", "cheg", "chegs",
                    "chell", "chells", "chenk", "chep", "cheps", "chesh", "chetch", "cheth",
                    "cheths", "chets", "chezz", "chib", "chibs", "chick", "chicks", "chid",
                    "chids", "chiff", "chiffs", "chig", "chigs", "ching", "chish", "chiss", "chitch",
                    "chith", "chiths", "chizz", "chob", "chobs", "chod", "chods", "choff",
                    "choffs", "chog", "chogs", "choll", "cholls", "chong", "chonk", "chosh",
                    "choss", "chot", "chotch", "choth", "choths", "chots", "chozz", "chud",
                    "chuds", "chuff", "chuffs", "chull", "chulls", "chup", "chups", "chush",
                    "chuss", "chut", "chutch", "chuth", "chuths", "chuts", "chuzz", " eck", "
                    ecks", " eff", " effs", " eng", " enk", " ep", " eps", " esh", " ess", " eth", "
                    eths", " ets", " ezz", "fabs", "fank", "fash", "fass", "fatch", "fath", "faths",
                    "fazz", "feb", "febs", "feff", "feffs", "feg", "fegs", "fells", "feng", "fenk",
                    "fep", "feps", "fesh", "fess", "fet", "feth", "feths", "fets", "fezz", "fid",
                    "fids", "fiff", "fiffs", "fing", "fip", "fips", "fiss", "fitch", "fod", "fods", "foff",
                    "foffs", "foll", "folls", "fong", "fonk", "fosh", "foss", "fot", "fotch", "foth",
                    "foths", "fots", "fozz", "fub", "fubs", "fud", "fuds", "fuff", "fuffs", "full",
                    "fulls", "fung", "funk", "fup", "fups", "fush", "fut", "futch", "futh", "fuths",
                    "hads", "haff", "haffs", "hap", "haps", "hass", "haths", "hazz", "heb",
                    "hebs", "hech", "hecks", "heff", "heffs", "heg", "hegs", "hep", "heps",
                    "hesh", "hess", "het", "hetch", "heth", "heths", "hets", "hezz", "hib",
                    "hibs", "hich", "hids", "hiff", "hiffs", "hig", "higs", "hing", "hink", "hish",
                    "hith", "hiths", "hizz", "hoch", "hocks", "hoff", "hoffs", "holl", "holls",
                    "hong", "hosh", "hoss", "hotch", "hoths", "hots", "hozz", "huch", "hucks",
                    "hud", "huds", "hup", "hups", "huss", "huth", "huths", "huts", "huzz", "
                    ib", " ibs", " id", " ids", " iffs", " ig", " igs", " ing", " ip",
                    " ips", " iss", " ith", " iths", " izz", "jad", "jads", "jaff",
                    "jaffs", "jall", "jalls", "jang", "jank", "jash",
                    "jass", "jat", "jatch", "jath", "jaths", "jats", "jebs", "jeck", "jecks",
                    "jeds", "jeffs", "jeg", "jegs", "jeng", "jenk", "jep", "jeps", "jesh", "jetch",
                    "jeth", "jeths", "jezz", "jich", "jick", "jicks", "jid", "jids", "jills", "jing",
                    "jink", "jish", "jiss", "jit", "jitch", "jith", "jiths", "jits", "jod", "jods", "joff",
                    "joffs", "joll", "jolls", "jong", "jonk", "jop", "jops", "josh", "joss", "jotch",
                    "joth", "joths", "jozz", "jub", "jubs", "juch", "juck", "jucks", "juds", "juff",
                    "juffs", "jull", "julls", "jup", "jups", "jush", "juss", "jut", "jutch", "juts",
                    "juzz", "lach", "lang", "lat", "lath", "laths", "lats", "lazz", "leb", "lebs",
                    "leck", "lecks", "leds", "leff", "leffs", "lell", "lells", "lep", "leps", "lesh",
                    "leth", "leths", "liff", "liffs", "lig", "ligs", "lill", "lills", "ling", "lish", "liss",
                    "litch", "lith", "liths", "lits", "lizz", "lod", "lods", "loff", "loffs", "lonk",
                    "losh", "lotch", "loth", "loths", "lozz", "lub", "lubs", "lucks", "lud", "luds",
                    "luff", "luffs", "lup", "lups", "luss", "lut", "lutch", "luts", "luzz", "mab",
                    "mabs", "mack", "macks", "mads", "maff", "maffs", "mag", "mags",
                    "mang", "mank", "mazz", "meb", "mebs", "meck", "mecks", "meff",
                    "meffs", "mell", "mells", "mep", "meps", "metch", "mezz", "mib", "mibs",
                    "mip", "mips", "mish", "mizz", "moff", "moffs", "mog", "mogs", "mong",
                    "motch", "mozz", "mub", "mubs", "mung", "munk", "mup", "mups",
                    "mut", "mutch", "muzz", "nab", "nabs", "nall", "nalls", "nang", "nank",
                    "nass", "nat", "natch", "nath", "naths", "nazz", "neb", "nebs", "neck",
                    "necks", "ned", "neff", "neffs", "nep", "neps", "nesh", "ness", "netch",
                    "neth", "neths", "nezz", "nich", "nid", "nids", "niff", "niffs", "nill", "nills",
                    "ning", "nink", "nish", "niss", "nith", "niths", "nizz", "nob", "nobs", "noff",
                    "noffs", "nong", "nonk", "nop", "nops", "noss", "noth", "noths", "nozz",
                    "nuck", "nucks", "nud", "nuds", "nug", "nugs", "nung", "nunk", "nup",
                    "nups", "nush", "nuss", "nutch", "nuzz", " ob", " obs", " ock", " ocks", "
                    og", " ogs", " ong", " onk", " op", " ops", " osh", " oss", " ot", " otch", "
                    oth", " oths", " ots", " ozz", "quall", "qualls", "queb", "quebs", "queck",
                    "quecks", "qued", "queds", "queff", "queffs", "queg", "quegs", "quep",
                    "queps", "quesh", "quess", "quet", "quetch", "queth", "queths", "quets",
                    "quezz", "quib", "quibs", "quig", "quigs", "quing", "quink", "quish",
                    "quiss", "quitch", "quith", "quiths", "quob", "quobs", "quock", "quocks",
                    "quoff", "quoffs", "quog", "quogs", "quoll", "quolls", "quong", "quonk",
                    "quop", "quops", "quosh", "quoss", "quotch", "quozz", "rab", "rabs",
                    "raff", "raffs", "rall", "ralls", "rass", "ratch", "rath", "raths", "rell", "rells",
                    "resh", "ress", "ret", "reth", "reths", "rets", "rezz", "rish", "riss", "rit",
                    "rith", "riths", "rits", "rizz", "roff", "roffs", "rog", "rogs", "ronk", "rop",
                    "rops", "rosh", "rotch", "rozz", "ruck", "rucks", "rud", "ruds", "rull",
                    "rulls", "runk", "rup", "rups", "rutch", "ruzz", "sab", "sabs", "saff", "saffs",
                    "sall", "salls", "satch", "sath", "saths", "sats", "sazz", "seb", "sebs", "seck",
                    "secks", "sed", "seds", "seff", "seffs", "seg", "segs", "sep", "seps", "sesh",
                    "sess", "setch", "sezz", "shab", "shabs", "shaff", "shaffs", "shang", "shap",
                    "shaps", "shash", "shass", "shatch", "shath", "shaths", "shazz", "sheb",
                    "shebs", "sheck", "shecks", "sheff", "sheffs", "sheg", "shegs", "shep",
                    "sheps", "shesh", "shess", "shet", "shetch", "sheth", "sheths", "shets",
                    "shezz", "shib", "shibs", "shick", "shicks", "shid", "shids", "shiff", "shiffs",
                    "shig", "shigs", "shing", "shink", "shish", "shiss", "shitch", "shith", "shiths",
                    "shob", "shobs", "shoff", "shoffs", "shog", "shogs", "sholl", "sholls",
                    "shong", "shonk", "shosh", "shoss", "shotch", "shoth", "shoths", "shozz",
                    "shub", "shubs", "shuff", "shuffs", "shug", "shugs", "shull", "shulls",
                    "shung", "shunk", "shup", "shups", "shutch", "shuzz", "sish", "siss",
                    "sitch", "sizz", "soff", "soffs", "sog", "sogs", "sonk", "sotch", "sozz", "suff",
                    "suffs", "sull", "sulls", "sush", "sut", "suts", "suzz", "thab", "thabs",
                    "thack", "thacks", "thaff", "thaffs", "thag", "thags", "thall", "thalls",
                    "thank", "thap", "thaps", "thash", "thass", "thatch", "thath", "thaths",
                    "thazz", "theb", "thebs", "theck", "thecks", "thed", "theds", "theff",
                    "theffs", "theg", "thegs", "thell", "thells", "thep", "theps", "thesh",
                    "thess", "thet", "thetch", "theth", "theths", "thets", "thezz", "thib",
                    "thibs", "thid", "thids", "thiff", "thiffs", "thig", "thigs", "thill", "thills",
                    "thip", "thips", "thish", "thiss", "thit", "thitch", "thith", "thiths", "thits",
                    "thizz", "thob", "thobs", "thock", "thocks", "thod", "thods", "thoff",
                    "thoffs", "thog", "thogs", "tholl", "tholls", "thonk", "thop", "thops",
                    "thosh", "thoss", "thotch", "thozz", "thub", "thubs", "thuck", "thucks",
                    "thud", "thuds", "thuff", "thuffs", "thull", "thulls", "thung", "thunk",
                    "thup", "thups", "thush", "thut", "thutch", "thuts", "thuzz", " ub", " ubs",
                    " uck", " ucks", " ud", " uds", " uff", " uffs", " ull", " ulls",
                    " ung", " unk", " ush", " ut", " utch", " uth", " uths", " uts", " uzz", "whad", "whads",
                    "whaff", "whaffs", "whag", "whags", "whall", "whalls", "whap", "whaps",
                    "whazz", "wheck", "whecks", "wheds", "wheff", "wheffs", "wheg",
                    "whegs", "whep", "wheps", "whesh", "whess", "whetch", "wheth",
                    "wheths", "whezz", "whib", "whibs", "whid", "whids", "whills", "whish",
                    "whiss", "whock", "whocks", "whoff", "whoffs", "whonk", "whozz",
                    "whub", "whubs", "whuch", "whuck", "whucks", "whud", "whuds",
                    "whuff", "whuffs", "whug", "whugs", "whull", "whulls", "whung",
                    "whunk", "whush", "whutch", "whuzz")

#Banned Lexicon includes obscenities, insults, things pronounced like obscenities and insults,
#common English words that are not pronounced according to the rules for short vowels between
#consonants, pronounceable misspellings of real words, letter combinations that do not occur
#in English, and a passel of other things that might confuse a new reader, all of which might
# be generated by the randomizing process

BannedLexicon<-c("ach", " alls", " ass", " ats", "bach", "bads",
                 "bech", "beng", "benk", "bich", "bigs", "bitch", "bod", "bods", "boff",
                 "boffs", "boll", "bolls", "bong", "both", "buch", "bush", "butch",
                 "chech", "chich", "chink", "choch", "chub", "chubs", "chuch", " ebs",
                 " ech", " eds", " eg", " egs", " et", "fach", "fack", "facks", "faff", "faffs",
                 "fag", "fags", "fap", "faps", "fech", "feck", "fecks", "fich", "fick", "ficks",
                 "fith", "fiths", "foch", "fock", "focks", "fuch", "fuck", "fucks", "fug",
                 "fugs", "futs", "hach", "hed", "heds", "hell", "hells", "heng", "henk",
                 " ich", " icks", " iff", " ish", "jach", "jap", "japs", "jech", "jell", "jells",
                 "jip", "jips", "jizz", "joch", "jock", "jocks", "jung", "juth", "juths", "laff",
                 "laffs", "lall", "lalls", "lech", "leng", "lenk", "letch", "lets", "lezz", "lib",
                 "libs", "lich", "loch", "luch", "luth", "luths", "mach", "maths", "mech",
                 "med", "meds", "megs", "meng", "menk", "meth", "meths", "mich",
                 "mick", "micks", "mids", "mit", "mith", "miths", "mits", "moch", "mot",
                 "mots", "muds", "muff", "muffs", "muth", "muths", "muts", "nach",
                 "nack", "nacks", "nad", "nads", "naff", "naffs", "nech", "neds", "neg",
                 "negs", "nells", "neng", "nenk", "nicks", "nig", "nigs", "nitch", "noch",
                 "noll", "nolls", "nots", "nuch", "nuff", "nuffs", "nuth", "nuths", " och",
                 " od", " ods", " offs", " oll", " olls", "quab", "quabs", "quach", "quad",
                 "quads", "quaff", "quaffs", "quag", "quags", "quang", "quank", "quap",
                 "quaps", "quash", "quass", "quat", "quatch", "quath", "quaths",
                 "quats", "quazz", "quech", "queng", "quenk", "quich", "quiff", "quiffs",
                 "quits", "quizz", "quoch", "quod", "quods", "quot", "quoth", "quoths",
                 "quots", "quub", "quubs", "quuch", "quuck", "quucks", "quud",
                 "quuds", "quuff", "quuffs", "quug", "quugs", "quull", "quulls", "quung",
                 "quunk", "quup", "quups", "quush", "quuss", "quut", "quutch",
                 "quuth", "quuths", "quuts", "quuzz", "rach", "rads", "reb", "rebs",
                 "rech", "reck", "recks", "reff", "reffs", "reg", "regs", "reng", "renk",
                 "ricks", "ritch", "roch", "roll", "rolls", "rong", "roths", "ruch", "Ruth",
                 "ruths", "sach", "sads", "sech", "seng", "senk", "seths", "shach",
                 "shag", "shags", "shall", "shalls", "shat", "shats", "shech", "sheng",
                 "shenk", "shich", "shit", "shits", "shizz", "shoch", "shods", "shuch",
                 "shud", "shuds", "shuss", "shuth", "shuths", "sich", "sids", "siff", "siffs",
                 "sig", "sigs", "soch", "soll", "solls", "sosh", "soss", "sot", "soth", "soths",
                 "sots", "suck", "sucks", "sud", "sug", "sugs", "sutch", "suth", "suths",
                 "thach", "thads", "thang", "thats", "thech", "theng", "thenk", "thich",
                 "thicks", "thoch", "thot", "thoths", "thots", "thuch", "thuss", "thuth",
                 "thuths", " uch", " ug", " ugs", " ups", " uss", "whab", "whabs",
                 "whach", "whang", "whank", "whash", "whass", "what", "whatch",
                 "whath", "whaths", "whats", "wheb", "whebs", "whech", "whed",
                 "whell", "whells", "wheng", "whenk", "whick", "whicks", "whill",
                 "whing", "whink", "whitch", "whith", "whiths", "whits", "whob",
                 "whobs", "whoch", "whod", "whods", "whog", "whogs", "wholl",
                 "wholls", "whong", "whop", "whops", "whosh", "whoss", "whot",
                 "whotch", "whoth", "whoths", "whots", "whup", "whups", "whuss",
                 "whut", "whuth", "whuths", "whuts")


# Define server logic required to generate OG wordlists
shinyServer(function(input, output) {
observeEvent(input$RunButton,{
#initialize consonant and vowel choice vectors, ImpossibleFlag, ImpossibleMessages,
#Rule9FinalVector,
InitialVector<-character()
MiddleVector<-character()
FinalVector<-character()
Rule9FinalVector<-character()
ImpossibleFlag<-FALSE
ImpossibleMessage0<-" "
ImpossibleMessage1<-" "
ImpossibleMessage2<-" "
ImpossibleMessage3<-" "
ImpossibleMessage4<-" "


#set up working variables from input data
#Move input values into working variables
Seed<-ifelse(is.numeric(input$Seed),Seed<-input$Seed,Seed<-sample(c(1:99999),1))
set.seed(Seed)
NumberOfWords<-input$NumberOfWords
FractionOfNonsense<-input$FractionOfNonsense
Rule01<-"Rule01" %in% input$RulesToApply
Rule02<-"Rule02" %in% input$RulesToApply
Rule03<-"Rule03" %in% input$RulesToApply
Rule04<-"Rule04" %in% input$RulesToApply
Rule05<-"Rule05" %in% input$RulesToApply
Rule06<-"Rule06" %in% input$RulesToApply
Rule07<-"Rule07" %in% input$RulesToApply
Rule08<-"Rule08" %in% input$RulesToApply
Rule09<-"Rule09" %in% input$RulesToApply
Rule10<-"Rule10" %in% input$RulesToApply


#verify that the requested word list is constructable, flag if not
HasInitial<- Rule01 | Rule02  | Rule05 | Rule06
HasMiddle<- Rule01 | Rule02  | Rule04
HasFinal<- Rule01 | Rule02  | Rule05 | Rule07 | Rule08  | Rule10
CanGenerateWords<-HasInitial & HasMiddle & HasFinal
ImpossibleFlag<-!CanGenerateWords
if(ImpossibleFlag) {
      ImpossibleMessage0<-"Word list cannot be constructed with present output"
      }else{ImpossibleMessage0<-" "}
if(!HasInitial) {
      ImpossibleMessage1<-"Rules you have selected don't provide for initial consonant. Select Rule 1, 2, 5, or 6 in addition."
      }else{ImpossibleMessage1<-" "}
if(!HasMiddle) {
      ImpossibleMessage2<-"Rules you have selected don't provide for vowel. Select Rule 1, 2, or 4 in addition."
      }else{ImpossibleMessage2<-" "}
if(!HasFinal) {
      ImpossibleMessage3<-"Rules you have selected don't provide for final consonant. Select Rule 1, 2, 5, 7, 8, or 10 in addition."
      }else{ImpossibleMessage3<-" "}

#Construct Initial, Middle, and Final Vectors of possible values for word construction
      if(Rule01) {InitialVector<-append(InitialVector, c("f","l","m","n","r","s"))
            MiddleVector<-append(MiddleVector,c("a","i","o"))
            FinalVector<-append(FinalVector,c("d","g","p","t"))
            Rule9FinalVector <- append(Rule9FinalVector, c("ds","gs","ps","ts"))
      }
      if(Rule02) {InitialVector<-append(InitialVector, c("b","sh","h","j"))
            MiddleVector<-append(MiddleVector,c("u"))
            FinalVector<-append(FinalVector,c("b","sh"))
            Rule9FinalVector<- append(Rule9FinalVector,c("bs"))
      }
      if(Rule03) {FinalVector<-append(FinalVector,c("ck"))
      Rule9FinalVector<-append(Rule9FinalVector,c("cks"))
      }
      if(Rule04) MiddleVector<-append(MiddleVector,c("e"))
      if(Rule05) {InitialVector<-append(InitialVector, c("ch","th"))
            FinalVector<-append(FinalVector,c("ch","th","tch"))
            Rule9FinalVector<-append(Rule9FinalVector,c("ths","tchs"))
      }
      if(Rule06) InitialVector<-append(InitialVector,c("qu","wh"))
      if(Rule07){FinalVector<-append(FinalVector,c("all"))
            Rule9FinalVector<-append(Rule9FinalVector,c("alls"))
      }
      if(Rule08){FinalVector<-append(FinalVector,c("ff","ll","ss","zz"))
            Rule9FinalVector<-append(Rule9FinalVector,c("ffs","lls"))
      }
      if(Rule10){FinalVector<-append(FinalVector,c("ng","nk"))
            Rule9FinalVector<-append(Rule9FinalVector,c("ngs","nks"))
      }
      if(Rule09) FinalVector<-append(FinalVector,Rule9FinalVector)


#Create empty Words Lists with appropriate numbers of slots; "Vzxyc" is filler because
#it can't be generated by the rules for Level I, so clearly marks a cell that has not been
#filled in yet
SuggestedMaximumRealWords<-length(InitialVector)*length(MiddleVector)*length(FinalVector)/4
NumberOfNonsense<-as.integer(FractionOfNonsense*NumberOfWords)
NumberOfRealWords<-as.integer(NumberOfWords-NumberOfNonsense)
NonsenseWordsList<-as.character(c(rep("Vzxyc",NumberOfNonsense)))
RealWordsList<-c(rep("Vzxyc",NumberOfRealWords))
if(NumberOfRealWords>SuggestedMaximumRealWords) {ImpossibleFlag<-TRUE
                  ImpossibleMessage0<-"Word list cannot be constructed with present output"
                  ImpossibleMessage4<-"Too few rules or letters selected for number of words requested. Please select more rules and letters, or reduce requested number of words"
                  }else{ImpossibleMessage0<-" "
                        ImpossibleMessage4<-" "
                  }

if(!ImpossibleFlag){
#Fill slots in RealWordsList
for (k in 1:NumberOfRealWords) {
      while ("Vzxyc" %in% RealWordsList[k]) {
            #construct CandidateWord
            Init<-sample(InitialVector,1,replace=TRUE)
            Mid<-sample(MiddleVector,1,replace=TRUE)
            Fin<-sample(FinalVector,1,replace=TRUE)
            CandidateWord<-paste(Init,Mid,Fin,sep="")
            #Establish CandidateWord is not banned
            Clean<-!(CandidateWord %in% BannedLexicon)
            #Establish CandidateWord is a real word
            Real<- sum(grepl(CandidateWord,RealLexicon,ignore.case=TRUE))>0
            #Establish CandidateWord is not already in RealWordsList
            Unused<-sum(grepl(CandidateWord,RealWordsList,ignore.case=TRUE))==0
            #
            #If all three conditions are met, copies from Lexicon to preserve
            #capitalization, moves into open slot,  and continues
            if(Clean & Real & Unused) RealWordsList[k]<-grep(CandidateWord,
                                                             RealLexicon,
                                                             ignore.case=TRUE,
                                                             value=TRUE)
      }
}


#Fill slots in NonsenseWordsList
for (j in 1:NumberOfNonsense) {
      while ("Vzxyc" %in% NonsenseWordsList[j]) {
            #construct CandidateWord
            Init<-sample(InitialVector,1,replace=TRUE)
            Mid<-sample(MiddleVector,1,replace=TRUE)
            Fin<-sample(FinalVector,1,replace=TRUE)
            CandidateWord<-paste(Init,Mid,Fin,sep="")
            #Establish CandidateWord is not banned
            Clean<-!(CandidateWord %in% BannedLexicon)
            #Establish CandidateWord is nonsense
            Nonsense<-CandidateWord %in% NonsenseLexicon
            #Establish CandidateWord is not already in NonsenseWordsList
            Unused<-!(CandidateWord %in% NonsenseWordsList)
            #If all three conditions are met, move into open slot and continue
            if(Clean & Nonsense & Unused) NonsenseWordsList[j]<-CandidateWord
      }
}
      RealWordHeading<-"Real words that fit the checked rules"
      NonsenseWordHeading<-"Nonsense words to be pronounced according to checked rules"
      ImpossibleMessage0<-" "
      ImpossibleMessage1<-" "
      ImpossibleMessage2<-" "
      ImpossibleMessage3<-" "
      ImpossibleMessage4<-" "
}

if(ImpossibleFlag) {RealWordsList<-" "
                  NonsenseWordsList<-" "
                  RealWordHeading<-" "
                  NonsenseWordHeading<-" "}

output$RealWordsList<-renderText({RealWordsList})
output$NonsenseWordsList<-renderText({NonsenseWordsList})
output$NonsenseWordHeading<-renderText({NonsenseWordHeading})
output$RealWordHeading<-renderText({RealWordHeading})


output$ImpossibleMessage0<-renderText({ImpossibleMessage0})
output$ImpossibleMessage1<-renderText({ImpossibleMessage1})
output$ImpossibleMessage2<-renderText({ImpossibleMessage2})
output$ImpossibleMessage3<-renderText({ImpossibleMessage3})
output$ImpossibleMessage4<-renderText({ImpossibleMessage4})

MainWordListFooter<-reactive({paste("For use as ",input$Use,". Generated with serial number ",Seed,".")})
MainWordListHeader<-reactive({paste("Word List at Level 1 for ", input$Student, " for ", input$Date)})
output$MainWordListFooter<-renderText({MainWordListFooter()})
output$MainWordListHeader<-renderText({MainWordListHeader()})

})
})