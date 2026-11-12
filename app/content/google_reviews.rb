module GoogleReviews
  PROFILE_URL = "https://www.google.com/maps/place/Trucks+of+Nevada/data=!4m5!3m4!1s0x80c8c3a9ef9f49d1:0xae845d6b3c2bd27d!8m2!3d36.2160197!4d-115.1426189".freeze
  RATING = 4.8
  COUNT = 99

  def self.reviews
    @reviews ||= RAW.map do |author, rating, date, body|
      {
        author: author,
        rating: rating,
        date: date,
        body: body.sub(/[…\s]+$/, "")
      }
    end
  end

  RAW = [
    ["Fleet Pro Solutions", 5, "2026-03-16", "Best of the Best ever guys thank you for you incredible service, a specially for Evgeniy for sure we will come back. Highly recommend"],
    ["Василь Мартин", 5, "2026-03-14", "The best service in Las Vegas. Thank you very much to Evgeny for your help; he helped me quickly and professionally."],
    ["Tekin Şentürk", 5, "2026-03-03", "I had an oil leak coming from the oil pan area of my truck. I took it to three different mechanics, and all of them claimed the problem was the fuel pump, giving me extremely high repair estimates. Finally, I brought my truck to Trucks of …"],
    ["Erkinai Taalaibekova", 5, "2026-03-02", "We've never met a master like Evgeniy in America. He's incredibly responsive, knows his stuff, and is simply THE BEST."],
    ["Taras Yevtushyk", 5, "2026-02-24", "These guys did an outstanding job—fast, professional, and reasonably priced. They were very polite, kept me informed every step of the way, and made the whole process smooth and stress-free. Easily one of the best shops I’ve ever been to. Great service —highly recommend!!!"],
    ["Mars Teltaev", 5, "2026-02-18", "The guys here are very friendly and, most importantly, professionals in their field, they do all kinds of work; I recommend stopping by!!!"],
    ["Romeo Lun", 5, "2026-02-18", "Hi Everybody . I need to write about That Service. I had a three problems with My Truck. two sensors was died: Oil pressure sensor and Coolant level sensor. And My oil pump was not working properly.That Man’s did it that very fast for 3 hours and changed that sensors for new. Great Job …"],
    ["Ikechukwu Anichebe", 5, "2026-02-18", "Thank you Eugene, u deserve more than 5star. You really take care of my truck"],
    ["Melford Maxie", 5, "2026-01-21", "Excellent service! I would definitely recommend this place for truck repairs."],
    ["MikeLine LLC", 5, "2025-12-13", "Need reprogramming.No problem. Idling timer, speed, cruise speed, and more. Short turnaround time. Low price. Thank you guys!!! …"],
    ["Alexandru Chireu", 5, "2025-12-06", "Great service, professional team and they know their craft! Highly recommend! …"],
    ["Constantin Cascaval", 5, "2025-10-28", "I had a great experience at this service center. The staff was very nice and highly competent. They quickly identified and fixed the problem with my truck. I’m very satisfied with their work and would definitely recommend them."],
    ["Alex Frolov", 5, "2025-09-29", "I came to them with a problem of engine faults P0194, P0193. I was admitted without waiting. My truck was diagnosed, they determined the cause of what happened, I was explained the cause-and-effect relationship of this issues in an …"]
  ].freeze
end
