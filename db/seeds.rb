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
    published_at: 1994 #23.years.ago
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
    published_at: 1996 #21.years.ago
  },
  {
    title: "Sacred",
    description: "Patrick Kenzie and Angela Gennaro are hired by a dying|
     billionaire to find his daughter, Desiree, after the previous|
      detective working the case, Jay Becker, disappeared.",
    published_at: 1997 #20.years.ago
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
    published_at: 1998 #19.years.ago
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
    published_at: 1999 #18.years.ago
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
    published_at: 2010
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
    published_at: 2001
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
    published_at: 2003
  },
  {
    title: "The Given Day",
    description: "",
    published_at: 
    
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

Book.first(4).each do |book|
  10.times do
    user = User.all.sample
    content = Faker::Hipster.paragraph(2)
    @comment = book.comments.build(content: content)
    @comment.user_id = user.id
    @comment.save
  end
end

100.times do
  user = User.all.sample
  title = Faker::Hipster.sentence
  content = Faker::Hipster.paragraph(2)
  @post = user.posts.build(content: content, title: title)
  @post.save
end

# Comment.all.each do |comment|
#   comment.destroy
# end
