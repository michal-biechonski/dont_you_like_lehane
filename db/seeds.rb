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
    published_at: "Lehane combines 20th-century American history, a gripping |
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
      "Dennis Lehane has done something here no mystery writer has done in a long, long time. He scared the hell out of me! I enjoyed his first book ("A Drink Before the War") very much, and was looking forward to reading this, his second. I got more than I bargained for in almost every sense of the word.",
      "Well this is certainly Lehane's most violent and gorey book with much to much detail in torture. That said, i found this book really well written and scary and funny at the same time, Patrick Kenzies One Liners, be it said aloud or only in his head keep a certain level of humor to the book.",
      "Boy, can Dennis Lehane craft a story! DARKNESS, TAKE MY HAND is the second in the Kenzie/Gennaro series, and it certainly does not disappoint! It is a fast-paced thriller that leaves you sorry that you have to put it down for something as trivial as eating or sleeping. As Patrick and Angie unravel clues, Patrick's past with his violent father and with Angie and Renee, his ex-wife, becomes clearer to the reader. Lehane is the most exciting and hip writer to come along in some time, and I wish him a long career. More Kenzie and Gennaro, Please!",
      "I found myself reading well after midnight, long after I should have turned the light out, but I found it difficult to leave Patrick and Angie and their incredibly dangerous situation. I tend to prefer cozies, stories which are lighter and not nearly as violent as this, but Lehane hooked me and I couldn't turn away. I've now read the first three in the series, and I will continue.",
      "Outstanding. A nice spin on a long-term serial killer. I could hear the gunshots, feel the pain from victims and even felt the cold steel and oozing blood from a stiletto. WOW! I read this right aftwer "Mystic River" but I will take the advice of another reviewer and now read the rest of his work in order. My only dilemma will be either read them slowly or quickly. I don't want his work to end."
    ],
  "Sacred" => [],
  "Gone, Baby, Gone" => [],
  "Prayers for Rain" => [],
  "Moonlight Mile" => [],
  "Mystic River" => [],
  "Shutter Island" => [],
  "The Given Day" => [],
  "Live by Night" => []
}

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
