def populate_defaults (account)
  Service.create do |s|
    s.title = "Carpet Cleaning"
    s.active = true
    s.photo_id = 3
    s.account_id = account
    s.body = "h1. Carpet Cleaning

We begin by removing all loose soil in the carpet by using a powerful dry vacuum system. Next, we remove individual stain spots with specific Heaven's Best sprays to properly treat each spot without bleaching or damaging the carpet. 

Then we lightly spray our unique Heaven's Best cleaning solution onto the carpet. This solution is a mild cleaning solution which immediately penetrates each carpet fiber, and starts breaking up the dirt trapped within.

We then go over the carpet with a floor buffer which has specially designed absorbent pads on the bottom. The buffer moves the carpet fibers around quickly allowing dirt and stains to be absorbed by the buffer pads, removing it from the carpet.

Finally, we groom the carpet fibers to create a speedy drying process and make the carpet look like new. The carpet will be totally dry in less than an hour after we finish.

h3. Heaven's Best carpet cleaning includes:

* Firm estimate with no hidden charges
* Convenient, on-time appointments
* Specially trained technicians
* Move most furniture
* Stain removal
* Carpet deodorant
* Optional stain resistant protectant
* Backed by a 100% satisfaction guarantee"
  end

  Service.create do |s|
    s.title = "Upholstery Cleaning"
    s.active = true
    s.photo_id = 1
    s.account_id = account
    s.body = "h1. Upholstery Cleaning

Heaven's Best has the expertise to clean virtually every type of upholstery fabric, including upholstery that is difficult to safely clean such as silk and velvet. We carefully inspect the fabric and construction of each piece before selecting the cleaning technique best suited to the material. Our unique Heaven's Best cleaning solution is formulated to provide the safest, most effective cleaning available to extend the life of your investment.

The upholstery is cleaned using an extraction unit. The cleaning solution is applied to the furniture then extracted from the furniture along with dirt and stains. Drying times vary depending on the type of fabric. Typical dry times are 6-8 hours, but drying may take up to 24 hours.

h3. Heaven's Best carpet cleaning includes:

* Firm estimate with no hidden charges
* Convenient, on-time appointments
* Specially trained technicians
* Move most furniture
* Stain removal
* Carpet deodorant
* Optional stain resistant protectant
* Backed by a 100% satisfaction guarantee"
  end

  Service.create do |s|
    s.title = "Hardwood Floor Detailing"
    s.active = false
    s.photo_id = 10
    s.account_id = account
    s.body = "h1. Hardwood Floor Detailing

Heaven's Best provide hardwood detailing that works wonders on any hardwood floor with a finish. We first remove the loose soil from the floor, then clean the floor with a specialized cleaning pad attached to a rotary machine. Last, we  polish the floor to help bring back the shine. 

This process cleans any type of hardwood floor, even prefinished, polyurethane sealed, and laminate floors. This is a cleaning and polishing process only and will not remove deep scratches and dents. If your floors have not been refinished in a long time, refinishing may be necessary.

h3. Heaven's Best hardwood floor detailing includes:
* Firm estimate with no hidden charges
* Convenient, on-time appointments
* Specially trained technicians
* Backed by a 100% satisfaction guarantee"
  end

  Service.create do |s|
    s.title = "Tile and Grout"
    s.active = false
    s.photo_id = 20
    s.account_id = account
    s.body = "h1. Tile and Grout

Our tile and grout cleaning service uses a newly developed equipment that will safely remove built up dirt and grime restoring your tile and grout surfaces to like new condition. We clean tile and grout with a Heaven's Best cleaning solution that is sprayed on the surface. Then, using a latest developed machine with a specially formulated grout cleaning attachment, heavily soiled areas are then cleaned. A grout brush is also used to get into those hard to reach areas. The excess solution is cleaned away, and the floor is buffed with a commercial buffer. Finally, a grout sealer is applied which will help maintain that fresh, new look.

h3. Heaven's Best tile and grout cleaning includes:
* Firm estimate with no hidden charges
* Convenient, on-time appointments
* Specially trained technicians
* Backed by a 100% satisfaction guarantee"
  end

  Service.create do |s|
    s.title = "Commercial Services"
    s.active = true
    s.photo_id = 19
    s.account_id = account
    s.body = "h1. Commercial Services

We provide carpet and upholstery cleaning with free follow up inspections for commercial businesses. We will work with you to determine the most cost effective cleaning cycle for your operation. We are available to clean 7 days per week, 24 hours a day so that your daily operations are not interrupted.

h3. Commercial service options include:  

* Complete carpet cleaning on a regular cycle
* Interim cleanings of high traffic-areas and stains
* Optional carpet and fabric protectants
* Commercial specific furniture, including partitions"
  end

  Service.create do |s|
    s.title = "Carpet & Fabric Protectants"
    s.active = true
    s.photo_id = 4
    s.account_id = account
    s.body = "h1. Carpet & Fabric Protectants

<div style='width: 350px; float: left; padding-right: 15px'>
Stain resistant carpets and upholstery fibers have been treated in the factory with a product to reduce the possibility of permanent staining. Over time, these products wear off, leaving your carpet and upholstery unprotected. 

Heaven's Best offers a superior carpet and fabric protectant that is safe for all fabric and carpet materials. It is a clear formula that is misted onto carpet or fabric after cleaning. Once the protectant dries, you will not see, feel, or smell it. 

The protectant secures your carpet and furniture from spills, spots, and everyday soiling. It also reduces sun fading and molding. Heaven's Best fabric protectant prevents spills from penetrating the fiber, giving you time to remove the spill before it becomes permanent. It makes carpet and upholstery easier to clean and reduces the risk of permanent staining. We recommend that stain guard be reapplied after each cleaning.

Ask your cleaning technician to demonstrate how the Heaven's Best fabric protectant works. 
</div>"
  end

#### Testimonials ####
  Testimonial.create do |s|
    s.name = "Glenda Foelsch"
    s.location = "Nederland, CO"
    s.quote = "As an office manager for a Real Estate Office, we are pleased with our Heaven’s Best Operator. His services are frequently required at the ‘last minute’ of which he has always been accommodating. Additionally, his attitude is positive, his results are far above other vendors attempting to provide the same services and his prices are reasonable."
    s.active = true
    s.account_id = account
  end

  Testimonial.create do |s|
    s.name = "Tim Smith"
    s.location = " Keizer, OR"
    s.quote = "Our local operator has been our exclusive carpet cleaning contractor for a number of years. He was originally given jobs at projects where my on-site mangers were dissatisfied with their existing contractors. He immediately won over these managers because of his professionalism. In a short period of time he was able to become our exclusive carpet cleaning company."
    s.active = true
    s.account_id = account
  end

  Testimonial.create do |s|
    s.name = "Max Drumheller"
    s.location = "San Diego, CA"
    s.quote = "For years I have had my carpet and sofa cleaned by companies that utilize steam and Chem-Dry methods. As a last resort I contacted Heaven’s Best because they promised a new image in carpet cleaning. Frankly, in view of my past experiences, my expectations were not very high, but I was in for a huge surprise. Heaven’s Best left a uniformly clean appearance that I never thought was possible. The odor in my home changed from musty to a refreshing citrus aroma. You have won a customer for life!"
    s.active = true
    s.account_id = account
  end

  Testimonial.create do |s|
    s.name = "Teresa Ardoin"
    s.location = "La Mirage Condos"
    s.quote = "Heaven’s Best has been cleaning carpet at La Mirage for over a year. We have tried several carpet cleaning companies in the past and have been unsatisfied until now. Heaven’s Best is professional, courteous, and prompt. We are completely satisfied with the services they have provided to us."
    s.active = true
    s.account_id = account
  end

  Testimonial.create do |s|
    s.name = "Barbara Grubbs"
    s.location = "Tobyhanna, PA"
    s.quote = "Today Heaven’s Best did the impossible with the carpet in a rental property that we own. When I saw how bad the tenants had left them, I really thought we would have to rip them out. I am so glad I called Heaven’s Best. I could not believe what I saw. I will definitely be recommending Heaven’s best to my friends and relatives."
    s.active = true
    s.account_id = account
  end

#### Specials ####
  Special.create do |s|
    s.title = "10% Off!"
    s.phone = "8885551234"
    s.body = "Get 10% off your total bill when you have any 3 or more rooms cleaned!"
    s.start = "2009-01-01"
    s.end = "2009-01-15"
    s.account_id = account
  end

  Special.create do |s|
    s.title = "$25 Off!"
    s.phone = "8885551234"
    s.body = "Get $25 off when you refer a neighbor or friend!"
    s.start = "2009-01-01"
    s.end = "2009-01-15"
    s.account_id = account
  end
end