# This file should contain all the record creation needed to
# seed the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lehane_books = [
  {
    title: "A Drink Before the War",
    description: "Private Investigators Kenzie and Gennaro are tasked to|
    retrieve missing documents by a trio of politicians. The trail leads|
      them into the midst of a gang war and reveals an act of child abuse.|
      Kenzie struggles with memories of his own past while Gennaro deals|
        with her abusive marriage.",
    published_at: rand(DateTime.new(1994)..DateTime.new(1995)) #23.years.ago
  },
  {
    title: "Darkness, Take My Hand",
    description: "When Detectives Patrick Kenzie and Angela Gennaro agree|
    to protect the son of a prominent psychiatrist they soon find bodies|
      are piling up around them. What's more, all the clues point to an|
      unlikely suspect - a serial killer who has been in prison for twenty|
      years, so he can't be killing again, can he?

    As the duo try to find out what kind of human being could perform|
    such horrifying acts of mutilation, torture and dismemberment,|
    they discover that the killer's motive is disturbingly rooted in|
    their own past. In a series of heart-stopping climaxes that grow|
    ever more bloody, ever more terrifying, the two detectives work|
      frantically to capture the killer before they become victims themselves.",
    published_at: rand(DateTime.new(1996)..DateTime.new(1997))
  },
  {
    title: "Sacred",
    description: "Patrick Kenzie and Angela Gennaro are hired by a dying|
    billionaire to find his daughter, Desiree, after the previous|
      detective working the case, Jay Becker, disappeared.",
    published_at: rand(DateTime.new(1997)..DateTime.new(1998))
  },
  {
    title: "Gone, Baby, Gone",
    description: "Boston-based lovers and private investigators Patrick |
    Kenzie and Angie Gennaro are hired by a woman to look into the |
    case of her niece, Amanda McCready, whose disappearance has become |
    an important local news story. They take the case despite the |
    seeming reluctance of the girl's uncle, Lionel. During the investigation |
    they quickly come to the conclusion that Amanda's mother, Helene, who has |
    been prominently featured in the news stories about the case, is a |
    degenerate and neglectful parent. At the time of Amanda's |
    disappearance, Helene had left her alone for several hours while she |
    partied at a local dive bar. ",
    published_at: rand(DateTime.new(1998)..DateTime.new(1999))
  },
  {
    title: "Prayers for Rain",
    description: "After the shattering consequences of their last case|
    (Gone, Baby, Gone), Lehane's PI partners Patrick Kenzie and Angela Gennaro |
    are back, but not together. Estranged from Angie personally and |
    professionally, Patrick works the old Boston neighborhood--with the |
    occasional help of his loyal and happily homicidal pal Bubba |
    Rogowski--while Angie has moved uptown to a blue-chip corporate security |
    firm. Enter Karen Nichols, a nice, hard-working sort who's being stalked. ",
    published_at: rand(DateTime.new(1999)..DateTime.new(2000))
  },
  { 
    title: "Moonlight Mile",
    description: "An old case takes on new dimensions in Lehane's sixth crime |
    novel to feature Boston PIs Patrick Kenzie and Angie Gennaro, last seen in |
    1999's Prayers for Rain. Twelve years earlier, in 1998's Gone, Baby, Gone, |
    Patrick and Angie investigated the kidnapping of four-year-old Amanda |
    McCready. The case drove a temporary wedge between the pair after Patrick |
    returned Amanda to her mother's neglectful care. Now Patrick and Angie are |
    married, the parents of four-year-old Gabriella, and barely making ends |
    meet with Patrick's PI gigs while Angie finishes graduate school. But |
    when Amanda's aunt comes to Patrick and tells him that Amanda, now a |
    16-year-old honor student, is once again missing, he vows to find the |
    girl, even if it means confronting the consequences of choices he made |
    that have haunted him for years. ",
    published_at: rand(DateTime.new(2010)..DateTime.new(2011))
  },
  {
    title: "Mystic River",
    description: "Lehane ventures beyond his acclaimed private eye series with |
    this emotionally wrenching crime drama about the effects of a savage |
    killing on a tightly knit, blue-collar Boston neighborhood. Written with a |
    sensitivity toward character that exceeds his previous efforts, the story |
    tracks the friendship of three boys from a defining moment in their |
    childhood, when 11-year-old Dave Boyle was abducted off the streets of |
    East Buckingham and sexually molested by two men before managing to |
    escape. Boyle, Jimmy Marcus and Sean Devine grow apart as the years pass, |
    but a quarter century later they are thrust back together when Marcus's |
    19-year-old daughter, Katie, is murdered in a local park.",
    published_at: rand(DateTime.new(2001)..DateTime.new(2002))
  },
  {
    title: "Shutter Island",
    description: "Know this: Lehane's new novel, his first since the highly |
    praised and bestselling Mystic River, carries an ending so shocking yet so |
    faithful to what has come before, that it will go down as one of the most |
    aesthetically right resolutions ever written. But as anyone who has read |
    him knows, Lehane, despite his mastery of the mechanics of suspense, is |
    about much more than twists; here, he's in pursuit of the nature of |
    self-knowledge and self-deception, and the ways in which both can be |
    warped by violence and evil. In summer 1954, two U.S. marshals, |
    protagonist Teddy Daniels and his new partner, Chuck Aule, arrive on |
    Shutter Island, not far from Boston, to investigate the disappearance of |
    patient Rachel Solando from the prison/hospital for the criminally insane |
    that dominates the island. The marshals' digging gets them nowhere fast as |
    they learn of Rachel's apparently miraculous escape past locked doors and |
    myriad guards, and as they encounter roadblocks and lies strewn across |
    their path—most notably by the hospital's chief physician, the enigmatic |
    J. Cawley—and pick up hints of illegal brain surgery performed at |
    the hospital.",
    published_at: rand(DateTime.new(2003)..DateTime.new(2004))
  },
  {
    title: "The Given Day",
    description: "Lehane combines 20th-century American history, a gripping |
    story of a family torn by pride and the strictures of the Catholic |
    Church, and the plot of a multifaceted thriller. Set in Boston during |
    and after WWI, this engrossing epic brings alive a pivotal period in our |
    cultural maturation through a pulsing narrative that exposes social |
    turmoil, political chicanery and racial prejudice, and encompasses the |
    Spanish flu pandemic, the Boston police strike of 1919 and red-baiting |
    and anti-union violence. Danny Coughlin, son of police captain Thomas |
    Coughlin, is a devoted young beat cop in Boston's teeming North End. |
    Anxious to prove himself worthy of his legendary father, he agrees to go |
    undercover to infiltrate the Bolsheviks and anarchists who are recruiting |
    the city's poverty-stricken immigrants.",
    published_at: rand(DateTime.new(2008)..DateTime.new(2009))
  },
  {
    title: "Live by Night",
    description: "Bestseller Lehane (The Given Day) chronicles the |
    Prohibition-era rise of Joe Coughlin, an Irish-American gangster, in this |
    masterful crime epic. While most hard-working stiffs are earning their |
    wages by day in 1926 Boston, 19-year-old Joe and his friends live by |
    night, catering to the demand for prostitution, narcotics, and bootleg |
    alcohol. When Joe falls for a competing mobster’s gun moll, he sets in |
    motion a chain of events that land him in prison, with the girl missing |
    and presumed dead. In the joint, Joe meets aging Mafia don Thomaso |
    “Maso” Pescatore, who becomes his mentor. ",
    published_at: rand(DateTime.new(2012)..DateTime.new(2013))
  }
]

lehane_books.each do |book|
  Book.create(book)
end

30.times do
  name = Faker::Name.first_name
  email = name + "@example.com"
  password = "password"
  password_confirmation = "password"
  User.create(name: name,
              email: email,
              password: password,
              password_confirmation: password_confirmation)
end

POSTS = 
  [
    "Good lord, I was not expecting that! Heck of a good read, in my book! Dennis Lehane's Shutter Island started off well for me and my tastes. Federal Marshals going into an insane asylum/prison on an inescapable island in Massachusetts during post-WWII to find a missing crazy woman, who apparently escaped. Love the setting, the characters, everything!",
    "Epic Psychological thriller. Great writing, great theme, great pace of story. Psycho-lovers should read it once, they would never be upset or disappointed with it.Book Comprised about the experiment was used by Nazis around II WW with the Human brain. Love it. Enjoyed it alot.",
    "The Given Day is my first Dennis LaHane book. The story was interesting but I had a hard time keeping up with who-was-who. It did jump around a bit too much. Just when I got interested in one character, he'd switch to someone else. I had to make myself finish the book. Don't think I'll read the others in this series.",
    "Only three fourths finished, this book and author are spectacular. As much as Follett's Fall of Giants was great and sweeping and insightful, The Given Day is easily twice all that. It nails class struggle with rare perception through its beautifully drawn characters. Even Babe Ruth being included to show a historical angle as well as an unsophisticated view of the powerful events unfolding is clever without being artsy. It's a 10 book",
    "Drink before the war - Incredibly wordy, even for a character study of three interesting youths who grow into their late 30s. At least a hundred pages could be removed by deleting all mention of one character's marriage and its problems. Drop the needless dream sequences, and the remaining text of 400 pages would be engrossing and compelling -- and a much better read..",
    "Cataloguing Dennis Lehane as a 'mystery writer' is, to me, sort of like classifying LeBron James as just a basketball player. Yes, Lehane writes books that have a mystery/thriller component to them, but, just as James's ability now defines the game of basketball, Lehane's ability goes far beyond a genre also. I would challenge all readers to undertake any of today's top names in the field (Patterson, Baldacci, Grisham...) and read their top works side by side with Lehane's and I'd wager that a marked literary difference would be not only immediately noticeable, but profound.",
    "Fans of Dennis Lehane might have been a bit apprehensive upon hearing that his latest book, \"Mystic River,\" would have no traces of detectives Patrick Kenzie and Angie Gennaro. Well, fear not, because Lehane, in his usual phenomenal style, draws us into the world of three childhood friends forever splintered by the events of a summer's day in 1975, when one is abducted by child molesters posing as police officers.",
    "Decided to give this Leanne series a shot and I'm glad I did. A tad over the top with the noir patter, but I like both Patrick & Angie characters, and I'll read book 2 for sure. Decent story. Characters a bit stereotypical, but par for the course for this type novel.",
    "Lehane is a master suspense writer with a gift for giving us what we least suspect at the most unexpected moment.",
    "Lehane is now my favorite author. I love his sense of humor, and he keeps the sex fairly clean and romantic. Not a lot of curse words, but what is there fits the circumstance.",
    "I have just loaded up on Lehane books, so I won't be running out anytime soon. Thank you Dennis for giving me a much better option than television propaganda.",
    "Graphic Boston crime story of a private eye and his trusted female assistant. A throwback to the whodunnits of the 50s and 60s",
    "As a huge Lee Child and Robert Crais fan, I wasn't sure I'd enjoy Kenzie/Genarro, especially with the sometimes mixed reviews. This one is dated and often made me very uncomfortable with the subject matter, but it is very well-written and the character development is exactly what I miss in the Reacher series. Kenzie and Genarro are more like gritty street-fighters, but the small-town neighborhood and childhood-friends background adds a welcome comfort level to the narrative.",
    "I've read a number of Lehane's novels and I enjoyed them all. This is just escape fiction I read to relax."
  ]
  
POSTS.each do |post_content|
  user = User.all.sample
  title = post_content.split.first(2).join(" ")
  content = post_content.split.drop(2).join(" ")
  user.posts.create(content: content, title: title)
end
  
# 100.times do
#   user = User.all.sample
#   title = Faker::Hipster.sentence
#   content = Faker::Hipster.paragraph(2)
#   @post = user.posts.build(content: content, title: title)
#   @post.save
# end

COMMENTS = {
  "A Drink Before the War" => 
    [ "Terrific dialogue, witty and well worth a very late night reading this story. Very sorry to see it end! I hope these characters return again and again.",
      "Having been a social worker in Boston, working with inner city offenders and gang members I can attest that Mr. Lehane writes a gripping truth which would shock many readers. \"A Drink\" is tough, charming, emotional, outrageous novel which is loaded with truth.",
      "Dennis Lehane's debut novel featuring the PI team of Patrick Kenzie and Angela Gennaro is a solid, well written thriller about buried secrets and those who like to keep them buried. But in telling the tale, Lehane offers us a view inside the SOUL of his main characters, and their own reactions to the kind of evil and prejudice they uncover.",
      "I don't usually read murder mysteries but this was chosen for book club. I did enjoy the book. Through all the dark parts there was a lot of light and hope too. Well written book just a little realistic at times.",
      "Lehane is phenomenal as always. Great characters with realistic flaws and a story that draws you in and doesn't let go.",
      "I always like a book that can put you right in the moment, with an intelligent, well-paced plot and plenty of down-to-earth, complex characters. Most books I attempt to read always lack at least one of these characteristics, so I was pleasantly surprised to find that this book remained gripping even past the sample pages. I am glad I found another author whose catalog I can raid."
    ],
  "Darkness, Take My Hand" => 
    [
      "Dennis Lehane has done something here no mystery writer has done in a long, long time. He scared the hell out of me! I enjoyed his first book (\"A Drink Before the War\") very much, and was looking forward to reading this, his second. I got more than I bargained for in almost every sense of the word.",
      "Well this is certainly Lehane's most violent and gorey book with much to much detail in torture. That said, i found this book really well written and scary and funny at the same time, Patrick Kenzies One Liners, be it said aloud or only in his head keep a certain level of humor to the book.",
      "Boy, can Dennis Lehane craft a story! DARKNESS, TAKE MY HAND is the second in the Kenzie/Gennaro series, and it certainly does not disappoint! It is a fast-paced thriller that leaves you sorry that you have to put it down for something as trivial as eating or sleeping. As Patrick and Angie unravel clues, Patrick's past with his violent father and with Angie and Renee, his ex-wife, becomes clearer to the reader. Lehane is the most exciting and hip writer to come along in some time, and I wish him a long career. More Kenzie and Gennaro, Please!",
      "I found myself reading well after midnight, long after I should have turned the light out, but I found it difficult to leave Patrick and Angie and their incredibly dangerous situation. I tend to prefer cozies, stories which are lighter and not nearly as violent as this, but Lehane hooked me and I couldn't turn away. I've now read the first three in the series, and I will continue.",
      "Outstanding. A nice spin on a long-term serial killer. I could hear the gunshots, feel the pain from victims and even felt the cold steel and oozing blood from a stiletto. WOW! I read this right aftwer \"Mystic River\" but I will take the advice of another reviewer and now read the rest of his work in order. My only dilemma will be either read them slowly or quickly. I don't want his work to end."
    ],
  "Sacred" =>
    [
      "If you like Michael Connelly's thrillers, you will love this one. Don't miss it.",
      "Dennis Lehane is the new master of the suspense novel. SACRED again brings us the detective team of Patrick Kenzie and Angie Gennaro in yet another fast-paced, witty page turner. His writing and dialogue are so believable, you are convinced that Patrick and Angie are real people, and I love how their love affair has evolved with each book. Theirs is a relationship between true equals who not only like each other, but love each other...I can't get enough!",
      "I liked this book - a lot of twists & turns. I also like the bantering between the two main characters. I'm not that prolific when it comes to book reviews...but I did like this & have purchased a few more Dennis Lehane novels (with the same two main characters) and am anxious to begin reading them.",
      "Another book by Dennis Lahane - ended up buying all I didn't have so that I can share with a friend of mine. The author takes you right to the Boston area and I stayed there until I finished the entire book. Bookseller service again was excellent.",
      "This story keeps you moving. Who is the real bad guy? Who's the victim? Who should die and who should live? How can Lehane top this one? It's my favorite so far!"
    ],
  "Gone, Baby, Gone" =>
    [
      "All of the books I have read have kept me up for many late nights, because they were too good to put down. It's great reading a book when you're from that neighborhood and can see the places you're reading in your head. Keep up the great work.",
      "The plot is tightly woven and completely convincing. There are no clumsily invented characters who are present only to make an otherwise-illogical event seem plausible.",
      "Lehane writes best when writing about the escapades of the kenzie/gennaro team, and this book is at the top of the five he has written about them so far. the action is relentless, the suspense is biting, and the humor is suffocating. a must-have.",
      "\"Gone, Baby, Gone\" is hands down the best of the first four (4) books in the Patrick Kenzie and Angela Gennaro series. Lehane certainly comes back strong after a weaker effort in \"Sacred\", the third book in the series.",
      "I could not put this book down. Its compelling, fast paced, makes you HAVE to know what happened. If you're on the fence on whether or not to read it by all means READ THIS BOOK. It's a quick read and you're gonna think about it for a long time after finishing it.",
      "If you have not yet ridden the Lehane Express, jump on board and begin at the beginning. The mystery/detective series with Angela Gennaro and Patrick Kenzie might be the best and most consistent in the genre. Again Lehane is at the top of his form and brings to the fore a terrific story with characters that just keep coming at you. The subtle undertones of the story give it depth and engage the reader from the first pages through the last."
    ],
  "Prayers for Rain" => 
    [
      "Dennis Lehane is a prolific and talented author of prose fiction dealing with crime, criminals, victims, and those trying to set things straight. The quality of his novels ranges from really good, as in Live by Night, to one-of-the-best-ever, as in The Drop. Prayers for Rain is comfortably situated somewhere between the two, roughly comparable to Gone, Baby, Gone.",
      "Fast paced, action filled. Great plot twists. Lehane is one of my favorites because of this series. Not quite on par with his first three, Drink Before the War, Darkness, Take my Hand, and Sacred, but not far off.",
      "Once again I have neglected reponsibilities to read a Dennis Lehane mystery. Every one of his books takes you right in to the action with him, Angela Gennaro, and Bubba Rogowski. \"Prayers for Rain\" continues the tradition of excellent phrasing and insightful observation of life as a private investigator in Boston. This is a book for all of you who enjoy great characterization and a believable story. I look forward to the next one from Dennis Lehane.",
      "Dennis Lehane has quickly become one of my favorite authors. His characters (gotta love that gun toting Bubba) and story lines are well developed are simply reach out and grab your attention. Every books seems to get progressively better, though no book has been in the least bit bad."
    ],
  "Moonlight Mile" => 
    [
      "Lehane is a wonderful writer who really captures Boston and its environs. He makes us think and doesn't let us off the hook with easy moralizing.",
      "Dennis Lehane is a great story teller. This was one of those books you simply cannot put down. A roller coaster ride from beginning to end.",
      "Denis Lehane's writing style just seems to suit my reading pleasure perfectly. It is always moving forward, always interesting and has just the right mix of intrigue, mystery, passion and flow. It was great to revisit Patrick and Angie after a little time off! One of my favorite authors I think it will be an enjoyable read even for 1st time Lehanians!"
    ],
  "Mystic River" => 
    [
      "I'm glad to see that most people liked and appreciated this novel, because it's not only wonderfully written, but a great story. For those of you who want more of his series, you have to understand how tiresome it gets for an author to keep writing about the same people. I know. The man most likely had to take a break and what a break he took. This writer is only 35 years old and has written an amazing book.",
      "With 'Mystic River', Dennis Lehane has not only broken away from his excellent previous novels, he's broken away from the pack of genre big-boys. It's only a matter of time before he comes full circle and laps the field. Tough, clear and uncompromising, 'Mystic River' brings us to a time and place so vivid and harrowing that long after you've put it down, you'll find you're still carrying it with you. A bold and provocative book.",
      "Terrific book, terrific story, terrific author! This is such a magnificent story, very gripping and quite a mental ride. If you're looking for something to read that is different as well as a page turner. The story is about a murder and there is no way that the reader can figure out who, why or was it really an accident. Very good book and a real page turner.",
      "\"Mystic River\" is the first of Dennis Lehane's books I have read. I was intrigued after reading the positive reviews posted here, and I was not disappointed. Lehane writes with an intensity I have not experienced from other mystery writers. I was mesmerized by all aspects of this book. Plot was well developed and the characters were well drawn. As the novel resolves itself you know exactly where the character's intent comes from.",
      "Just when I thought he couldn't get any better, Lehane has surprised me with this wonderfully written story about friendships and a darkness that lies just beneath the surface in all of us. I read this book in record speed and closed this book with wide eyes surprise. You don't want to miss this one."
    ],
  "Shutter Island" => 
    [
      "I was under the impression that Lehane could not not outdo 'Darkness, Take My Hand' or 'Mystic River,' but this novel is simply brilliant. It is a mystey that will shock you throughout and leave you gasping for air with the twist at the end. What a novel!!!",
      "I was initially disappointed that Lehand had deviated from his Boston detective duo twice in a row (following Mystic River), but a few sentences into Shutter island, I forgot all about Patrick and Angie. The writing is atmospheric and spooky, and while those who've read many thrillers (or seen many film thrillers) may figure out the twist early on, the development of the characters and the quality of the writing prevent any disappointment.",
      "Best way I can describe is mind bending and disturbing. In Mystic River, Lehane dealt with a lot of moral ambiguity and gray areas. In Shutter Island, the question is whose reality and set of facts to believe. Any description of the plot would give too much away. You won't be able to put this down but if you like nice, tidy endings this is not for you. Lehane is simply a great, unique writer.",
      "Shutter Island is a sneaky one, I have to tell you from the start. Two US Marshalls arrive at the isolated mental institution to find the missing patient and things go in strange directions from then on. Obviously, I won't tell you how it ends, but I didn't see it coming!"
    ],
  "The Given Day" => 
    [
      "The Given Day is not the type of book I normally read. I came home with an armload from the library and this book was in the stack. I almost didn't open it but when I did, it was impossible to close. The writing is exceptionally smooth and the depth of character development very unusual for an \"action thriller\". Let me repeat, not my usual book, I dislike \"action thrillers\", \"shoot em ups\" or whatever",
      "I loved this book -- the history, the detail, the characters, the emotion. And what an incredible setting. I've never been to Boston, but after reading several of Mr. Lehane's novels, I think it's a city I'll have to visit sometime soon. The writing had such energy, such beauty. Highly recommended.",
      "Although it doesn't quite measure up to \"Mystic River\" it's one of the best books I've read in years -- a true epic. I thought the Babe Ruth angle was particularly effective and the chapters about the Boston police strike were fascinating and exciting. The only drawback in my mind -- and it is minor -- is the ending. There were too many convenient coincidences and an overdose of melodrama."
    ],
  "Live by Night" => 
    [
      "I really enjoyed this one, good story and excellent character development. Held my interest throughout. A good read and I highly recommend it.",
      "A little trite but all in all a fast paced,well developed story. This is a highly entertaining read about a gangster with a soul.",
      "Dennis Lehane does it again! A fabulous historical thriller that grabs the reader from the first page and doesn't let go. When I finished the book I felt as if my best friend had moved away.",
      "I couldn't put this book down! I thought it was better than its prequel, The Given Day. I love Lehane. And this time period is very interesting to me. I couldn't help but think about Boardwalk Empire (one of my favorite shows) while I was reading it, which was a good thing!",
      "Lehane has again written a fascinating, compelling period novel featuring the Coughlins of Boston. I couldn't put it down. Most other writers pale by comparison.",
      "I do not not normally like novels set in this era. Having been a long time reader of Dennis Lahane, I decided to take a chance. I made the right decision! The book is a page turner and I truly enjoyed it",
      "It held my attention from start to finish. I could not put it down. Very well and tightly written, great cast of characters. I never saw the end coming."
    ]
}

COMMENTS.each do |book, comments|
  user = User.all.sample
  book = Book.find_by(title: book)
  comments.each do |content|
    new_comment = book.comments.build(content: content)
    new_comment.user_id = user.id
    new_comment.save
  end
end

# Book.first(4).each do |book|
#   10.times do
#     user = User.all.sample
#     content = Faker::Hipster.paragraph(2)
#     @comment = book.comments.build(content: content)
#     @comment.user_id = user.id
#     @comment.save
#   end
# end

# 100.times do
#   user = User.all.sample
#   title = Faker::Hipster.sentence
#   content = Faker::Hipster.paragraph(2)
#   @post = user.posts.build(content: content, title: title)
#   @post.save
# end

# Comment.all.each do |comment|
#   comment.destroy
# end
