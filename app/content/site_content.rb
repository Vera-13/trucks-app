class SiteContent
  Service = Struct.new(
    :slug, :name, :summary, :h1, :lede, :icon,
    :problems, :included, :faqs, :fleets, :steps, :showcase,
    keyword_init: true
  )

  def self.services
    SERVICES
  end

  def self.find!(slug)
    SERVICES.find { |service| service.slug == slug } ||
      raise(ActiveRecord::RecordNotFound, "No service #{slug}")
  end

  def self.featured
    %w[
      semi-truck-repair dpf-cleaning engine-repair
      trailer-repair electrical-battery-repair roadside-assistance
    ].map { |slug| find!(slug) }
  end

  SERVICES = [
    Service.new(
      slug: "semi-truck-repair",
      name: "Semi Truck Repair",
      icon: "fa-solid fa-truck",
      showcase: true,
      h1: "Semi Truck Repair in Las Vegas",
      summary: "Same-day semi truck repair in Las Vegas for owner-operators and fleets. Engine, electrical, transmission, trailer, DOT, and roadside.",
      lede: "Bring the truck to the shop in Las Vegas, or call if it's already down. Trucks of Nevada is a family-owned, owner-operated truck and trailer shop for owner-operators, fleets, and drivers passing through who need the truck moving today.",
      problems: [
        "The truck lost power, derated, or will not start",
        "A check-engine light came on before a pickup",
        "The transmission is slipping, missing a gear, or will not shift",
        "Lights, batteries, or wiring failed overnight",
        "The trailer has an air leak, bad brakes, or a dead circuit",
        "A DOT or CARB inspection is due",
        "The A/C quit before a desert run",
        "The truck is sitting on I-15, US-95, or US-93"
      ],
      included: [
        "Diagnosis before parts get thrown at the truck",
        "Engine, transmission, electrical, suspension, and brake work",
        "Trailer repairs for dry van, reefer, flatbed, and step deck",
        "DOT inspections, CARB inspections, and preventive maintenance",
        "Box trucks and motor homes, not only class 8 tractors",
        "Same-day repairs when the job and the parts allow it",
        "24/7 roadside dispatch within about 100 miles of the shop"
      ],
      fleets: "Fleets use the same shop and the same phone number. Call us for diagnostics, aftertreatment, roadside help, and repairs that don't fit a normal service interval. Tell us how many trucks you run, and we'll set up a simple way to get them in.",
      faqs: [
        ["Do I need an appointment?", "No. A call with your ETA still gets you in faster, so a tech is ready when you arrive."],
        ["Which trucks do you work on?", "Volvo, Freightliner, Kenworth, International, Peterbilt, Mack, and most other heavy-duty American makes, plus box trucks and motor homes."],
        ["How fast can you turn a truck around?", "Same-day is normal for diagnosis, inspections, and repairs we can finish with the truck in the bay. We will give you a time after we see it."]
      ]
    ),
    Service.new(
      slug: "dpf-cleaning",
      name: "DPF Cleaning",
      icon: "fa-solid fa-filter",
      h1: "DPF Cleaning in Las Vegas",
      summary: "DPF removal, cleaning, and reinstallation in Las Vegas, plus derate diagnostics for DEF, SCR, EGR, and NOx faults.",
      lede: "A forced regen is not a DPF cleaning. Trucks of Nevada removes, cleans, and reinstalls the filter, then looks for the reason it clogged, so the same light does not come back on the next grade outside Las Vegas.",
      problems: [
        "The DPF is clogged or full of soot",
        "Regeneration keeps failing or will not start",
        "The truck is in derate or low-power mode",
        "DEF, SCR, NOx, or EGR faults are on the dash",
        "The filter clogs again a short time after the last cleaning",
        "You need to know if the DPF can be cleaned or has to be replaced"
      ],
      steps: [
        "Diagnose the clog, the regen history, and the fault codes before anything comes off the truck.",
        "Run a forced (parked) regeneration only when that is actually the right fix.",
        "Remove the DPF, clean out ash and deposits a regen cannot burn off, and reinstall it.",
        "Check the DEF system, SCR, NOx sensors, and EGR when something else is causing the problem.",
        "Tell you whether the filter can go back on the truck or whether it is too far gone to clean."
      ],
      included: [
        "Complete DPF service: removal, professional cleaning, and reinstallation",
        "Forced regenerations and clogged-filter diagnostics",
        "Engine derate and check-engine-light troubleshooting",
        "DEF, SCR, EGR, and NOx sensor diagnostics and repairs",
        "Finding the cause, so the filter doesn't clog again right away"
      ],
      faqs: [
        ["Can you remove, clean, and reinstall my DPF?", "Yes. Cleaning here includes taking the filter off, cleaning it, and putting it back on."],
        ["Is DPF cleaning the same as a forced regeneration?", "No. Regeneration burns soot. A professional cleaning also removes ash and other deposits that a regen leaves behind."],
        ["Why does my DPF keep clogging?", "Repeat clogs often come from how the engine is running, a bad sensor, a regen that never finishes, or another aftertreatment fault. We look for that cause before we recommend the repair."],
        ["Can you fix my truck if it is in derate?", "Yes. We diagnose and repair the common causes, including DPF, DEF, SCR, and NOx sensor problems."],
        ["Can you perform a forced regeneration?", "Yes, when it is the right next step. A forced regen will not fix a filter packed with ash, or a mechanical problem upstream of the DPF."],
        ["How long does DPF cleaning take?", "It depends on the filter and on any other repairs the diagnosis turns up. You get an estimated finish time after we evaluate the truck."],
        ["Will cleaning the DPF turn off the check engine light?", "Not by itself, if the light is from a bad sensor, the DEF system, or another engine fault. Those need their own diagnosis."],
        ["Do I need to replace the DPF, or can it be cleaned?", "Many filters can be cleaned and reused. A cracked or worn-out filter may need replacement. We look at the filter before we tell you which one it is."]
      ]
    ),
    Service.new(
      slug: "trailer-repair",
      name: "Trailer Repair",
      icon: "fa-solid fa-truck-moving",
      h1: "Trailer Repair in Las Vegas",
      summary: "Dry van, reefer, flatbed, and step deck repairs in Las Vegas: brakes, suspension, air, and electrical.",
      lede: "Most trailer calls are brakes, air leaks, lights, or a suspension that started eating tires. We service dry vans, reefers, flatbeds, and step decks at the shop, and we can come to a breakdown around Las Vegas.",
      problems: [
        "The trailer pulls, hops, or feels loose under the load",
        "Air is leaking and the brakes will not hold a set",
        "Lights, ABS, or the seven-way cord failed",
        "Brake drums or pads are due before a DOT stop",
        "A reefer, flatbed, or step deck needs work before the next dispatch"
      ],
      included: [
        "Brake adjustments, inspections, drums, and pads",
        "Suspension repairs that keep the trailer tracking straight",
        "Air line and electrical repairs",
        "Work on dry van, reefer, flatbed, and step deck trailers"
      ],
      faqs: [
        ["Do you come to the trailer, or does it need to come in?", "Both. Yard and roadside calls are available. Bigger brake and suspension jobs are easier in the shop."],
        ["How long is a trailer brake inspection?", "A straightforward inspection is often done in a short shop visit. We will say so after we see the axles."]
      ]
    ),
    Service.new(
      slug: "transmission-repair",
      name: "Transmission Repair",
      icon: "fa-solid fa-gears",
      h1: "Transmission Repair in Las Vegas",
      summary: "Heavy-duty transmission diagnosis and repair for semis and box trucks in Las Vegas.",
      lede: "Slipping, a gear that will not catch, or a transmission that falls out of a range will park a truck faster than almost anything else. We diagnose the complaint on the truck before we open it up.",
      problems: [
        "It slips under load or will not hold a gear",
        "It will not go into high range or low range",
        "There is a grind, a whine, or a delay going into gear",
        "Fluid is low, burnt, or leaking onto the ground",
        "The truck was just derated and the transmission is part of the complaint"
      ],
      included: [
        "Road test and fault-code diagnosis",
        "Leak, clutch, and linkage checks",
        "Repairs to get the truck back out on a run"
      ],
      faqs: [
        ["Do you work on automated manuals?", "Yes. We diagnose both automated and manual heavy-duty transmissions and tell you what actually failed."],
        ["Can you look at it the same day?", "Call before you roll in. If a bay is open, same-day diagnosis is the goal."]
      ]
    ),
    Service.new(
      slug: "electrical-battery-repair",
      name: "Electrical & Battery Repair",
      icon: "fa-solid fa-car-battery",
      h1: "Truck Electrical and Battery Repair in Las Vegas",
      summary: "No-starts, charging faults, wiring, and battery repairs for semis, trailers, and box trucks in Las Vegas.",
      lede: "A truck that clicks once and then goes dark is usually batteries, cables, or a charging problem. We trace the draw, the connections, and the charging system so it starts the next morning too.",
      problems: [
        "Slow crank or a single click and nothing",
        "Batteries go dead while the truck sits",
        "The alternator is not charging",
        "Trailer lights, ABS, or liftgate power is out",
        "A repair somewhere else left wires twisted together"
      ],
      included: [
        "Battery, cable, and ground testing",
        "Charging-system diagnosis",
        "Wiring repairs on the tractor and the trailer",
        "Starting and no-crank diagnosis"
      ],
      faqs: [
        ["Will you just sell me batteries?", "Only if the batteries are the failure. We test the charging system and the cables first, because new batteries on a bad alternator are wasted money."],
        ["Do you chase wiring problems?", "Yes. Intermittent lights and parasitic draws are normal work here."]
      ]
    ),
    Service.new(
      slug: "engine-repair",
      name: "Engine Repair",
      icon: "fa-solid fa-gauge-high",
      h1: "Diesel Engine Repair in Las Vegas",
      summary: "Diesel engine diagnosis and repair for Volvo, Freightliner, Kenworth, Peterbilt, International, and Mack trucks in Las Vegas.",
      lede: "Low power, a knock, a fuel fault, or a light that will not stay off all start the same way. We find the cause, then we tell you how long the repair will take. The shop runs heavy-duty diagnostic software, including Volvo PTT and Cummins coverage, across a wide range of model years.",
      problems: [
        "Low power on grades outside Las Vegas",
        "Fuel pressure or injector faults",
        "Oil, coolant, or fuel leaks in the bay",
        "A misfire, knock, or rough idle",
        "Fault codes that were cleared and came right back"
      ],
      included: [
        "Electronic diagnosis, not a code clear",
        "Fuel, air, and cooling system repairs",
        "Aftertreatment faults that show up as an engine complaint",
        "A clear answer on whether we can finish it the same day"
      ],
      faqs: [
        ["Which engines do you diagnose?", "Most heavy-duty engines in Volvo, Freightliner, Kenworth, International, Peterbilt, and Mack trucks, including Cummins-powered trucks."],
        ["Do you clear codes and send the truck out?", "No. If the code is a symptom, clearing it does not fix the truck. We look for the cause."]
      ]
    ),
    Service.new(
      slug: "suspension-repair",
      name: "Suspension Repair",
      icon: "fa-solid fa-up-down",
      h1: "Truck Suspension Repair in Las Vegas",
      summary: "Air ride, leaf, and trailer suspension repairs that stop wandering, tire damage, and DOT write-ups.",
      lede: "A truck or trailer that wanders, leans, or wears out a set of tires usually has a bushing, air bag, or hanger that has failed. We repair the suspension so the truck tracks straight and is ready for the next inspection.",
      problems: [
        "The truck wanders or dives under braking",
        "An air bag will not hold height",
        "A trailer leans or hops when it is loaded",
        "Bushings, hangers, or torque rods are worn",
        "Tires are wearing because the suspension is loose"
      ],
      included: [
        "Air-ride and leaf-spring repairs on tractors",
        "Trailer suspension repairs",
        "Height-control and air-leak checks",
        "A look at related brake and frame hardware while it is in the bay"
      ],
      faqs: [
        ["Can a bad suspension fail a DOT inspection?", "Yes. Worn bushings, leaking bags, and loose components are common out-of-service items. We fix those, and we do the inspection itself if you need it."],
        ["Is this a tire or alignment shop?", "No. We don't do tires, alignment, or body work. If a bad suspension is wearing the tires out, we can fix that."]
      ]
    ),
    Service.new(
      slug: "preventive-maintenance",
      name: "Preventive Maintenance",
      icon: "fa-solid fa-oil-can",
      h1: "Truck Preventive Maintenance in Las Vegas",
      summary: "Oil changes and scheduled maintenance for semis, box trucks, and fleets at our Las Vegas shop.",
      lede: "A maintenance visit is the time to catch a leak, a loose suspension, or a filter before it puts the truck in derate. We handle oil changes and the other service that keeps a Las Vegas route from turning into a roadside call.",
      problems: [
        "The oil service is due and the truck cannot sit for a day",
        "A fleet needs trucks in and out on a schedule",
        "Small leaks and loose parts keep showing up on the road",
        "You want maintenance and an inspection in one stop"
      ],
      included: [
        "Oil and filter service",
        "A visual check of leaks, lights, belts, and air system",
        "Maintenance scheduled around your dispatch, not a week-long stay",
        "Repairs started the same visit if we find something that shouldn't wait"
      ],
      faqs: [
        ["Can you combine a PM with a DOT inspection?", "Yes. Tell us when you call and we will plan the bay time for both."],
        ["Do you offer same-day oil service?", "Often, if you call ahead with the truck's ETA. Walk-ins are welcome when a bay is open."]
      ]
    ),
    Service.new(
      slug: "dot-inspections",
      name: "DOT Inspections",
      icon: "fa-solid fa-clipboard-check",
      h1: "DOT Inspections in Las Vegas",
      summary: "Annual DOT inspections for tractors and trailers in Las Vegas, most of them finished in under an hour.",
      lede: "An annual inspection is where brakes, suspension, lights, air, and steering get caught before a scale house does. Most tractor and trailer inspections here are finished in less than an hour, and you leave knowing exactly what failed.",
      problems: [
        "The annual inspection is due before the next load",
        "A roadside inspection wrote the truck up",
        "You want the tractor and the trailer inspected together",
        "Lights, air leaks, or brakes are already a known problem"
      ],
      included: [
        "Tractor and trailer annual inspections",
        "Brakes, suspension, steering, lights, air system, glass, and warning devices",
        "A clear list of failures, and the repairs if you want them done here",
        "Most inspections completed in under an hour"
      ],
      faqs: [
        ["Do I need an appointment?", "No. Calling with an ETA lets a tech be ready when you arrive."],
        ["What if it fails?", "We tell you what failed and we can repair brakes, lights, suspension, and electrical here. We do not do tires, alignment, or body work."]
      ]
    ),
    Service.new(
      slug: "carb-inspections",
      name: "CARB Inspections",
      icon: "fa-solid fa-leaf",
      h1: "CARB Inspections in Las Vegas",
      summary: "CARB clean-truck inspections for carriers running from Las Vegas into California.",
      lede: "If the truck runs into California, a CARB problem can stop the trip. We inspect the emissions equipment California checks, and we repair the DPF, DEF, and related faults that would cause a failure.",
      problems: [
        "A California-bound truck needs a clean-truck inspection",
        "The truck failed a CARB check and has to be cleared",
        "Emissions equipment was tampered with or removed by a previous owner",
        "DPF or DEF faults will show up the moment it is tested"
      ],
      included: [
        "Inspection of the emissions equipment CARB looks for",
        "Diagnosis of DPF, DEF, SCR, and related faults before the trip",
        "Repairs when the inspection finds a real failure",
        "A direct answer if the truck is not ready for California"
      ],
      faqs: [
        ["Do you only inspect, or do you fix what fails?", "Both. The point of doing it here is that the same shop can repair the aftertreatment problem the inspection finds."],
        ["Is this the same as a DPF cleaning?", "No. An inspection tells you where you stand. Cleaning or a repair is the next step if the filter or the sensors are the reason it would fail."]
      ]
    ),
    Service.new(
      slug: "ac-repair",
      name: "A/C Repair",
      icon: "fa-solid fa-snowflake",
      h1: "Truck A/C Repair in Las Vegas",
      summary: "Cab air conditioning repair for semis and box trucks before a Las Vegas summer dispatch.",
      lede: "In this heat, a cab that won't cool can shut a truck down for the day. We find the leak, the compressor problem, or the electrical fault and get cold air back in the cab.",
      problems: [
        "The cab blows warm air",
        "The compressor cycles or will not kick on",
        "A leak left dye all over the condenser",
        "The A/C died at the same time as a charging or electrical complaint"
      ],
      included: [
        "Diagnosis of cooling, airflow, and compressor problems",
        "Leak checks and component repairs",
        "Electrical faults that keep the system from powering up"
      ],
      faqs: [
        ["Can you look at it before a summer dispatch?", "Yes. Call with the truck's ETA. A/C jobs that do not need back-ordered parts are scheduled as same-day work whenever a bay is open."],
        ["Do you just recharge the system?", "No. We find out why the charge was lost before the truck goes back into 110-degree heat."]
      ]
    ),
    Service.new(
      slug: "brake-adjustment-inspection",
      name: "Brake Adjustment & Inspection",
      icon: "fa-solid fa-circle-dot",
      h1: "Truck Brake Adjustment and Inspection in Las Vegas",
      summary: "Brake adjustments and inspections for tractors and trailers, before a DOT stop writes you up.",
      lede: "Brakes out of adjustment are one of the fastest ways to get parked at a scale. We adjust and inspect tractor and trailer brakes, and we tell you when an adjustment is no longer enough and the drums or pads need work.",
      problems: [
        "The brakes are out of adjustment",
        "A trailer pulls or the stroke is too long",
        "You want the brakes checked before a DOT inspection",
        "There is an air leak at a chamber or valve"
      ],
      included: [
        "Brake adjustment on tractors and trailers",
        "Stroke and component inspection",
        "Air-leak checks at the chambers and lines",
        "Drum and pad repairs when an adjustment will not hold"
      ],
      faqs: [
        ["Is an adjustment going to hide a bad brake?", "No. If the lining or the drum is the problem, we say so. Adjusting a worn-out brake just sends you back to the scale."],
        ["Can you do this with a DOT inspection?", "Yes. Ask for both when you call."]
      ]
    ),
    Service.new(
      slug: "box-truck-repair",
      name: "Box Truck Repair",
      icon: "fa-solid fa-truck",
      h1: "Box Truck Repair in Las Vegas",
      summary: "Box truck repair, maintenance, and diagnostics for commercial delivery trucks in Las Vegas.",
      lede: "Delivery trucks break down the same way semis do, on a tighter schedule. We diagnose and repair diesel box trucks: engines, electrical, brakes, A/C, and the maintenance that keeps a route running.",
      problems: [
        "A route truck will not start at the warehouse",
        "It lost power or threw a light mid-shift",
        "The brakes, charging system, or A/C need work",
        "Oil service is overdue and the truck cannot sit all week"
      ],
      included: [
        "Engine and electrical diagnosis",
        "Brake inspection and adjustment",
        "A/C and charging repairs",
        "Preventive maintenance for box trucks that work every day"
      ],
      faqs: [
        ["Do you only work on semis?", "No. Box trucks are a regular part of the shop, along with semis, trailers, motor homes, and cranes."],
        ["Can you turn a delivery truck around the same day?", "That is the goal for diagnosis, maintenance, and repairs we can finish in a bay. Call with the truck's size and the symptom."]
      ]
    ),
    Service.new(
      slug: "motor-home-repair",
      name: "Motor Home Repair",
      icon: "fa-solid fa-caravan",
      h1: "Motor Home Repair in Las Vegas",
      summary: "Diesel motor home repairs, diagnostics, and maintenance for coaches passing through Las Vegas.",
      lede: "A diesel motor home that quits in Las Vegas needs a heavy-duty shop, not a car garage. We diagnose and repair the same systems we work on in commercial trucks: engine, electrical, brakes, suspension, A/C, and aftertreatment.",
      problems: [
        "The coach derated or will not regen on a trip",
        "It overheated, lost power, or will not start",
        "The living area is fine, and the chassis is the problem",
        "Brakes, suspension, or A/C need work before you leave town"
      ],
      included: [
        "Diesel engine and aftertreatment diagnosis",
        "Electrical, charging, and no-start repairs",
        "Brake, suspension, and A/C work on the chassis",
        "An estimate after we see the coach"
      ],
      faqs: [
        ["Do you repair the living quarters?", "We repair the diesel chassis: engine, electrical, brakes, suspension, A/C, and aftertreatment. We do not do body work or interior remodeling."],
        ["Can you clean a motor home DPF?", "Yes. DPF removal, cleaning, reinstallation, and the diagnosis around it are the same service we do on commercial trucks."]
      ]
    ),
    Service.new(
      slug: "crane-repair",
      name: "Crane Repair",
      icon: "fa-solid fa-truck",
      h1: "Crane Repair in Las Vegas",
      summary: "Mechanical repair for crane trucks in Las Vegas. Engine, electrical, brakes, and the maintenance that keeps the truck working.",
      lede: "We service the trucks that carry cranes, in the shop and on a call within about 100 miles. That covers the engine, electrical, brakes, and maintenance. We do not do body work.",
      problems: [
        "The crane truck will not start or lost power",
        "A warning light came on before a job",
        "Brakes, charging, or an air leak need attention",
        "The truck is due for service and cannot sit all week"
      ],
      included: [
        "Engine and electrical diagnosis",
        "Brake inspection and adjustment",
        "Charging and no-start repairs",
        "Maintenance on crane trucks that work every day"
      ],
      faqs: [
        ["Do you rebuild the crane itself?", "We repair the truck: engine, electrical, brakes, and maintenance. We do not do body work."],
        ["Can you take it the same day?", "Same-day repairs are available when the job and the parts allow. Call with the truck and the symptom."]
      ]
    ),
    Service.new(
      slug: "roadside-assistance",
      name: "Roadside Assistance",
      icon: "fa-solid fa-road",
      h1: "24/7 Truck Roadside Assistance in Las Vegas",
      summary: "24/7 mobile truck and trailer repair around Las Vegas, Henderson, North Las Vegas, Boulder City, and Pahrump.",
      lede: "If the truck is on the shoulder, call. We dispatch around the clock for commercial trucks on I-15, US-95, and US-93, and through the Las Vegas valley out to about 100 miles from the shop.",
      problems: [
        "The truck died on I-15, US-95, or US-93",
        "It will not start in a yard in Henderson or North Las Vegas",
        "An air leak, electrical fault, or derate stranded the driver",
        "You need someone on the way before the load appointment"
      ],
      included: [
        "24/7 dispatch",
        "Typical response of 30–45 minutes in Las Vegas and Henderson",
        "Typical response of 35–50 minutes in North Las Vegas",
        "Typical response of 60–90 minutes in Boulder City and Pahrump, depending on the call",
        "Mobile diagnosis, with a tow to the shop only when the repair cannot be finished on the shoulder"
      ],
      faqs: [
        ["Are you really 24 hours?", "Roadside dispatch is 24/7. The shop itself is open Monday through Friday, 8:30am to 5:30pm."],
        ["How far do you go?", "About 100 miles from 1260 Rockpebble Ave in North Las Vegas, including the valley and the main highways."]
      ]
    )
  ].freeze
end
