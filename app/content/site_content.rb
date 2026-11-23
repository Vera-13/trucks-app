class SiteContent
  Service = Struct.new(
    :slug, :name, :card_name, :summary, :h1, :seo_title, :lede, :icon,
    :problems, :problems_heading, :included, :included_heading,
    :faqs, :fleets, :steps, :showcase,
    :detail_heading, :detail_body, :detail_after, :detail_items, :detail_list_label,
    :cta_title, :cta_text, :photo_alt, :button_label,
    :lead_sections, :sections,
    keyword_init: true
  )

  def self.menu
    {
      "Truck & Trailer Repair" => %w[
        semi-truck-repair engine-repair transmission-repair
        electrical-battery-repair suspension-repair trailer-repair
        brake-repair ac-repair box-truck-repair
      ],
      "Maintenance & Specialty Services" => %w[
        dpf-cleaning preventive-maintenance dot-inspections
        carb-inspections roadside-assistance specialty-vehicle-repair
      ]
    }.transform_values { |slugs| slugs.map { |slug| find!(slug) } }
  end

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
      name: "Semi-Truck Repair",
      icon: "fa-solid fa-truck",
      showcase: true,
      h1: "Semi Truck Repair in Las Vegas",
      summary: "Same-day semi truck repair in Las Vegas for owner-operators and fleets. Engine, electrical, transmission, trailer, DOT, and roadside.",
      lede: [
        "Keep your truck moving with expert diagnostics and dependable repairs at Trucks of Nevada. We service commercial semi-trucks and trailers, specializing in engine problems, electrical failures, DPF/DEF/SCR systems, transmission issues, and preventive maintenance.",
        "Whether you're a local owner-operator, managing a fleet, or passing through Las Vegas, our experienced technicians are ready to help minimize downtime."
      ],
      problems_heading: "Common Semi-Truck Problems We Repair",
      problems: [
        "Check engine lights, fault codes, and engine performance issues",
        "Loss of power, engine derates, and no-start conditions",
        "DPF, DEF, SCR, and emissions system problems",
        "Transmission shifting problems and clutch issues",
        "Electrical faults, wiring, batteries, and charging systems",
        "Air brake, suspension, and trailer system failures",
        "Cooling system problems and A/C repairs",
        "DOT inspections and preventive maintenance"
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
      name: "DPF Cleaning & Aftertreatment Repair",
      card_name: "DPF & Aftertreatment Services",
      icon: "fa-solid fa-filter",
      h1: "DPF Cleaning & Aftertreatment Repair in Las Vegas",
      seo_title: "DPF Cleaning & Aftertreatment Repair Las Vegas",
      summary: "Professional DPF cleaning, DEF, SCR, EGR and NOx sensor repairs for semi-trucks in Las Vegas. Expert diagnostics and derate troubleshooting. Call (702) 333-2463.",
      lede: [
        "Professional DPF Cleaning, DEF & SCR System Repairs for Heavy-Duty Semi-Trucks",
        "A clogged DPF, failed regeneration, or DEF system fault can quickly lead to reduced engine power, warning lights, and costly downtime.",
        "At Trucks of Nevada, we specialize in heavy-duty diesel aftertreatment diagnostics, DPF cleaning, and emissions system repairs for commercial semi-trucks in Las Vegas.",
        "From DPF restrictions and failed regenerations to SCR efficiency faults, NOx sensor failures, and engine derates, our technicians use advanced diagnostic equipment to identify the problem and perform the necessary repairs.",
        "We don't just clear fault codes. We diagnose the underlying issue, repair the affected components, and verify system operation to help prevent recurring problems."
      ],
      problems_heading: "Common DPF & Aftertreatment Problems We Diagnose",
      problems: [
        "DPF warning light or excessive soot accumulation",
        "Failed, incomplete, or frequent regenerations",
        "Engine derate, reduced power, or speed limitations",
        "DEF system faults and poor DEF dosing",
        "SCR efficiency and NOx conversion faults",
        "Failed NOx sensors or exhaust temperature sensors",
        "EGR system faults and excessive soot production",
        "Check engine lights related to emissions systems",
        "DPF restrictions that return shortly after regeneration or cleaning"
      ],
      included_heading: "Our DPF Cleaning & Aftertreatment Services",
      included: [
        "Professional DPF cleaning",
        "DPF removal and reinstallation",
        "DPF replacement",
        "DOC cleaning and replacement",
        "Forced and parked regenerations",
        "DPF differential pressure testing",
        "Soot-load diagnostics and regeneration history analysis",
        "Diagnosis of recurring DPF restrictions"
      ],
      sections: [
        {
          "heading" => "DPF Cleaning, Regeneration & Filter Replacement",
          "paragraphs" => [
            "A diesel particulate filter (DPF) captures soot from engine exhaust. Over time, accumulated soot and ash can restrict exhaust flow and affect engine performance.",
            "DPF cleaning and forced regeneration are not the same service. Regeneration burns accumulated soot under appropriate operating conditions, while professional DPF cleaning addresses deposits, including ash, that regeneration cannot remove.",
            "We evaluate the filter's condition and related engine systems to determine the appropriate service."
          ]
        },
        {
          "heading" => "DEF, SCR, EGR & Emissions System Repairs",
          "paragraphs" => [
            "Modern diesel aftertreatment systems rely on multiple components working together to control emissions and maintain proper engine operation.",
            "A failure in one component can trigger warning lights, reduced power, or engine derate conditions.",
            "Our aftertreatment repair services include:"
          ],
          "items" => [
            "DEF pump, doser, and injector diagnostics and repairs",
            "DEF tank, heater, and quality sensor repairs",
            "SCR catalyst diagnostics and replacement",
            "Inlet and outlet NOx sensor replacement",
            "EGR valve and cooler repairs",
            "DOC and exhaust temperature sensor diagnostics",
            "Aftertreatment wiring and electrical repairs",
            "SCR efficiency and NOx conversion testing",
            "Engine derate and speed-limit troubleshooting",
            "Post-repair calibrations, resets, and system verification"
          ],
          "after" => [
            "Using heavy-duty OEM diagnostic software, we evaluate fault codes, live operating data, and component performance to identify the cause of aftertreatment failures.",
            "Our goal is to correct the underlying problem rather than temporarily eliminate a warning light."
          ]
        },
        {
          "heading" => "Our DPF & Aftertreatment Diagnostic Process",
          "numbered" => true,
          "items" => [
            "Comprehensive System Diagnostics. We retrieve active and stored fault codes, review regeneration history, and evaluate aftertreatment system performance using heavy-duty diagnostic equipment.",
            "Identify the Root Cause. We inspect relevant components, including the DPF, DOC, DEF dosing system, SCR catalyst, NOx sensors, EGR system, and related electrical circuits, as indicated by the diagnostic findings.",
            "Recommend the Appropriate Repair. Depending on the condition of the system, service may involve professional DPF cleaning, regeneration, component repair, or replacement.",
            "Complete the Necessary Service. Our technicians perform the required repairs, cleaning-related removal and reinstallation, or component replacement.",
            "Verify System Operation. When applicable, we complete required resets and calibrations, review operating data, and verify aftertreatment performance before returning the truck to service."
          ]
        }
      ],
      faqs: [
        ["Is DPF cleaning the same as a forced regeneration?", "No. A forced regeneration uses elevated exhaust temperatures to burn accumulated soot. Professional DPF cleaning addresses soot and ash deposits, including material that regeneration cannot remove. The appropriate service depends on the filter's condition and diagnostic results."],
        ["Can you remove, clean, and reinstall my DPF?", "Yes. Trucks of Nevada provides complete DPF service, including removal, professional cleaning, and reinstallation for heavy-duty semi-trucks."],
        ["Why does my DPF keep clogging?", "Recurring DPF restrictions may result from excessive engine soot production, incomplete regenerations, EGR problems, faulty sensors, or other engine and aftertreatment issues. We diagnose the underlying cause rather than repeatedly treating the restriction alone."],
        ["Can you repair a truck that is in engine derate?", "Yes. We diagnose engine derate conditions related to DPF, DEF, SCR, NOx sensor, and other aftertreatment system faults. The required repair depends on the diagnostic findings and the condition of the affected components."],
        ["Do you repair DEF and SCR systems?", "Yes. We diagnose and repair DEF pumps, dosing components, tank heaters, quality sensors, SCR catalysts, NOx sensors, and related electrical systems on commercial semi-trucks."],
        ["Can you perform a forced regeneration?", "Yes. We perform forced or parked regenerations when appropriate. Before proceeding, we evaluate relevant fault codes and system conditions to determine whether regeneration is suitable."],
        ["How long does DPF cleaning take?", "Service time depends on the filter's condition, removal and installation requirements, and whether additional repairs are necessary. Contact us to discuss your truck and current scheduling availability."],
        ["Will DPF cleaning turn off my check engine light?", "It depends on the cause of the fault. Cleaning may resolve a restriction-related problem, but warning lights caused by failed sensors, DEF dosing faults, SCR issues, or other system malfunctions require additional diagnosis and repair."],
        ["Should I clean or replace my DPF?", "Not every restricted DPF requires replacement. We evaluate the filter's condition to determine whether cleaning is appropriate or replacement is necessary."],
        ["What diesel trucks do you service?", "We provide DPF cleaning, aftertreatment diagnostics, and emissions system repairs for commercial heavy-duty semi-trucks, including owner-operator and fleet vehicles."]
      ],
      cta_title: "DPF Problems? Get Your Semi-Truck Back on the Road.",
      cta_text: "A DPF warning light, failed regeneration, or engine derate can disrupt deliveries and create costly downtime. At Trucks of Nevada, we provide professional heavy-duty DPF cleaning, DEF and SCR repairs, and advanced aftertreatment diagnostics to help get your truck operating properly again."
    ),
    Service.new(
      slug: "trailer-repair",
      name: "Commercial Trailer Repair",
      icon: "fa-solid fa-truck-moving",
      h1: "Commercial Trailer Repair in Las Vegas",
      summary: "Commercial trailer repair in Las Vegas, including trailer brake repair, trailer suspension repair, reefer repair, trailer ABS repair, and DOT trailer inspections.",
      photo_alt: "Commercial trailer brake and suspension repair at Trucks of Nevada in Las Vegas",
      lede: "Keep your trailers road-ready with professional repair and maintenance services from Trucks of Nevada. We specialize in commercial trailer brake systems, suspension, ABS diagnostics, electrical repairs, reefer systems, and DOT inspections. From routine maintenance to unexpected breakdowns, we help owner-operators and fleets minimize downtime and get back on the road.",
      problems_heading: "Common Trailer Problems We Repair",
      problems: [
        "Brake problems, ABS warning lights, or worn brake components",
        "Air suspension failures, damaged airbags, or uneven trailer ride height",
        "Wheel bearing problems, leaking wheel seals, or axle damage",
        "Malfunctioning trailer lights, wiring faults, or electrical issues",
        "Reefer cooling failures, engine problems, or refrigeration faults",
        "Damaged roof or side panels",
        "Landing gear problems or suspension wear",
        "Trailers requiring DOT inspections or preventive maintenance"
      ],
      included_heading: "Our Trailer Repair Services",
      included: [
        "Brake Systems: Brake chambers, slack adjusters, drums, shoes, pads, and ABS diagnostics and repairs.",
        "Suspension & Axles: Airbags, leaf springs, shocks, hangers, axle alignment, axle repairs, and wheel bearings.",
        "Electrical Systems: Wiring harnesses, marker lights, LED lighting, and ABS electrical troubleshooting.",
        "Reefer Repairs: Refrigeration system repairs, reefer engine service, electrical troubleshooting, and trailer chassis maintenance.",
        "Additional Repairs: Landing gear, liftgate electrical and hydraulic systems, roof and side-panel repairs.",
        "Maintenance & Inspections: Annual DOT inspections, preventive maintenance, lubrication, and fleet inspections."
      ],
      detail_heading: "Commercial Trailers We Service",
      detail_body: [
        "At Trucks of Nevada, we provide repair and maintenance services for a wide range of commercial trailers operating throughout Las Vegas and surrounding areas.",
        "Whether you operate a single trailer or manage an entire fleet, we provide professional diagnostics, repairs, and maintenance to help keep your equipment safe, reliable, and ready for the road."
      ],
      detail_items: [
        "Dry van trailers",
        "Refrigerated trailers (reefers)",
        "Flatbed trailers",
        "Step deck trailers",
        "Lowboy and equipment trailers",
        "Car hauler trailers",
        "Tank trailers",
        "Dump trailers"
      ],
      cta_title: "Need Commercial Trailer Repair in Las Vegas?",
      cta_text: "Don't let trailer problems delay your next delivery. From brake and suspension repairs to reefer diagnostics and emergency roadside assistance, Trucks of Nevada provides dependable commercial trailer service for owner-operators and fleets. Visit our Las Vegas repair facility or contact us to arrange mobile service.",
      faqs: [
        ["What types of commercial trailers do you repair?", "We service dry vans, refrigerated trailers, flatbeds, step decks, lowboys, car haulers, tank trailers, and dump trailers. Our services include brake repairs, suspension, electrical systems, reefer repairs, and preventive maintenance."],
        ["Do you provide mobile trailer repair in Las Vegas?", "Yes. Trucks of Nevada offers mobile trailer repair and 24/7 roadside assistance for commercial trailers in the Las Vegas area. Service availability depends on the location, type of repair, and technician availability."],
        ["Can you perform DOT inspections on commercial trailers?", "Yes. We provide annual DOT trailer inspections, pre-trip inspections, and fleet maintenance inspections. We can also identify and repair mechanical issues found during an inspection."],
        ["Do you repair refrigerated trailers and reefer units?", "Yes. We provide refrigerated trailer repairs, including reefer engine and refrigeration system repairs, electrical troubleshooting, brake repairs, and suspension maintenance."]
      ]
    ),
    Service.new(
      slug: "transmission-repair",
      name: "Transmission Repair",
      icon: "fa-solid fa-gears",
      h1: "Heavy-Duty Truck Transmission Repair in Las Vegas",
      seo_title: "Heavy-Duty Truck Transmission Repair Las Vegas",
      summary: "Heavy-duty truck transmission repair in Las Vegas. Manual and automated transmission diagnostics, clutch repairs, calibration and replacement. Call today.",
      lede: [
        "At Trucks of Nevada, we provide comprehensive transmission diagnostics, repairs, rebuilding, and replacements for commercial semi-trucks and heavy-duty vehicles.",
        "From manual and automated transmission failures to clutch problems, shifting issues, and electronic faults, our technicians handle everything from advanced troubleshooting to complete internal transmission repairs. We focus on accurate diagnostics, dependable repairs and minimizing costly downtime."
      ],
      problems_heading: "Common Transmission Problems",
      problems: [
        "Hard shifting, slipping, or gears not engaging",
        "Transmission fault codes, warning lights, or derates",
        "Clutch slipping, overheating, or engagement problems",
        "Grinding noises, vibrations, or internal transmission damage",
        "Transmission fluid leaks or complete transmission failure"
      ],
      included_heading: "Our Transmission Repair Services",
      included: [
        "Manual and automated transmission diagnostics and repairs",
        "Internal transmission rebuilding and component replacement",
        "Clutch, actuator, and transmission control system repairs",
        "Transmission programming, calibration, and troubleshooting",
        "Complete transmission removal, installation, and replacement"
      ],
      faqs: [
        ["Do you repair automated manual transmissions?", "Yes. We diagnose and repair heavy-duty automated manual transmissions, including Detroit DT12, Volvo I-Shift, and Eaton automated systems. Services include clutch repairs, electronic troubleshooting, actuator repairs, and transmission calibration."],
        ["Do you rebuild or replace heavy-duty truck transmissions?", "Yes. Trucks of Nevada provides internal transmission rebuilding, mechanical repairs, and complete transmission replacements. We evaluate the transmission's condition and recommend the most practical repair solution."],
        ["Can you diagnose transmission problems without replacing the entire transmission?", "Absolutely. Shifting problems can be caused by electronic controls, clutch components, actuators, sensors, or internal mechanical failures. Our technicians identify the underlying problem before recommending repairs."]
      ]
    ),
    Service.new(
      slug: "electrical-battery-repair",
      name: "Electrical Diagnostics & Repair",
      icon: "fa-solid fa-car-battery",
      h1: "Semi-Truck Electrical & Battery Repair in Las Vegas",
      summary: "Semi-truck electrical diagnostics, ECM programming, wiring repairs, and battery and charging service in Las Vegas.",
      lede: [
        "Modern commercial trucks rely on complex electrical systems and electronic control modules to operate efficiently. When electrical faults, communication failures, or module problems occur, accurate diagnostics are essential to prevent unnecessary repairs and costly downtime.",
        "At Trucks of Nevada, we specialize in advanced semi-truck electrical diagnostics, ECM programming, electronic control module replacement, parameter configuration, wiring repairs, and battery and charging system services.",
        "Our technicians use professional diagnostic equipment and manufacturer-specific software to troubleshoot electrical and electronic systems on Volvo, Freightliner, Kenworth, Peterbilt, International, Mack, and other heavy-duty commercial trucks.",
        "From intermittent electrical faults to complex module communication issues, we focus on identifying the root cause and delivering reliable repairs that keep your truck moving."
      ],
      problems_heading: "Common Semi-Truck Electrical Problems We Diagnose",
      problems: [
        "No-Start & Intermittent Starting Problems — Truck won't crank, starts intermittently, or experiences unexpected electrical shutdowns.",
        "Battery & Charging System Failures — Dead batteries, alternator problems, low charging voltage, and excessive battery drain.",
        "Electrical Warning Lights & Fault Codes — Dashboard warnings, communication errors, and electronic system malfunctions.",
        "ECM & Electronic Control Module Problems — Module communication failures, programming issues, incorrect parameter settings, and electronic control system faults.",
        "CAN Bus & Vehicle Network Faults — Communication problems between electronic control modules and vehicle systems.",
        "Wiring Harness & Connector Failures — Damaged wiring, corroded terminals, poor grounds, short circuits, and open circuits.",
        "Trailer Electrical & ABS Problems — Inoperative trailer lights, ABS warning lights, damaged wiring, and seven-way connector faults.",
        "Intermittent Electrical Failures — Electrical problems that appear and disappear, requiring advanced troubleshooting to identify the underlying cause."
      ],
      included_heading: "Our Heavy-Duty Electrical & Electronic Repair Services",
      included: [
        "Advanced Semi-Truck Electrical Diagnostics",
        "ECM & ECU Programming",
        "Electronic Control Module Replacement & Programming",
        "Vehicle Parameter Configuration & Calibration",
        "CAN Bus & Vehicle Communication Network Diagnostics",
        "Wiring Harness & Electrical Circuit Repairs",
        "Sensor & Electronic Control System Troubleshooting",
        "Battery Testing & Replacement",
        "Alternator & Charging System Diagnostics",
        "Starter & No-Crank Troubleshooting",
        "Short Circuit & Parasitic Battery Drain Diagnostics",
        "Truck & Trailer Lighting and ABS Electrical Repairs"
      ],
      detail_heading: "Semi-Truck ECM Programming & Electronic Module Services",
      detail_body: [
        "Modern heavy-duty trucks depend on multiple electronic control modules to manage engine performance, transmission operation, emissions systems, and other critical vehicle functions.",
        "At Trucks of Nevada, we provide professional ECM and ECU diagnostics, electronic control module replacement, programming, and vehicle parameter configuration for commercial semi-trucks."
      ],
      detail_list_label: "Our services include:",
      detail_items: [
        "ECM and ECU Programming",
        "Electronic Control Module Replacement & Setup",
        "Vehicle Parameter Configuration",
        "Module Communication Diagnostics",
        "CAN Bus Network Troubleshooting",
        "Electronic System Calibration & Configuration",
        "Advanced Fault Code Diagnostics"
      ],
      detail_after: [
        "Using professional diagnostic software and specialized equipment, our technicians identify electronic system faults and perform the necessary programming or configuration to restore proper operation.",
        "Professional diagnostics. Accurate programming. Reliable repairs."
      ],
      cta_title: "Electrical Problems Keeping Your Truck Off the Road?",
      cta_text: "Don't waste time and money replacing parts without knowing the cause of the problem. At Trucks of Nevada, we focus on accurate electrical diagnostics and dependable repairs for commercial semi-trucks and trailers. Whether you're dealing with a no-start condition, charging system failure, wiring problem, or complex electronic fault, our team is ready to help.",
      faqs: [
        ["Do you provide ECM programming for semi-trucks?", "Yes. Trucks of Nevada provides ECM and ECU programming, electronic control module replacement, and vehicle parameter configuration for commercial heavy-duty trucks. Contact us with your truck's make, model, and year to discuss the programming services required."],
        ["Can you program a replacement electronic control module?", "Yes. We provide electronic control module replacement and programming services, including configuration and setup when supported by the vehicle and diagnostic software."],
        ["Can you diagnose complicated or intermittent electrical problems?", "Yes. Our technicians troubleshoot complex electrical faults, wiring problems, CAN Bus communication failures, and electronic control module issues using professional diagnostic equipment."],
        ["Why does my semi-truck keep draining its batteries?", "Repeated battery discharge may be caused by failing batteries, charging system problems, parasitic electrical draws, poor connections, or wiring faults. We perform electrical testing to identify the underlying problem before recommending repairs."]
      ]
    ),
    Service.new(
      slug: "engine-repair",
      name: "Heavy-Duty Engine Repair",
      icon: "fa-solid fa-gauge-high",
      h1: "Heavy-Duty Diesel Engine Repair in Las Vegas",
      seo_title: "Heavy-Duty Diesel Engine Repair Las Vegas",
      summary: "Heavy-duty diesel engine repair in Las Vegas. Semi-truck diagnostics, cylinder heads, injectors, turbochargers and cooling system repairs. Call Trucks of Nevada.",
      lede: [
        "From check engine lights and performance issues to complete engine overhauls, Trucks of Nevada provides comprehensive diesel engine diagnostics and repairs for commercial semi-trucks and heavy-duty vehicles.",
        "Our experienced technicians handle everything from fuel injection and turbocharger repairs to cylinder head replacement, in-frame engine overhauls, and complete engine replacements. Using advanced diagnostic equipment, we identify the root cause of failures and deliver reliable repairs that help minimize downtime and keep your truck on the road."
      ],
      problems_heading: "Common Diesel Engine Problems",
      problems: [
        "Check engine lights, fault codes, and engine derates",
        "Loss of power, rough idle, misfires, or excessive smoke",
        "Hard starting, fuel pressure, and injector problems",
        "Engine overheating and coolant leaks",
        "Low oil pressure, oil leaks, and excessive oil consumption",
        "Turbocharger failures and boost pressure problems",
        "Cylinder head, head gasket, and internal engine damage"
      ],
      included_heading: "Our Heavy-Duty Engine Repair Services",
      included: [
        "Complete In-Frame Engine Overhauls",
        "Diesel Engine Replacement",
        "Cylinder Head & Head Gasket Replacement",
        "Advanced Engine Diagnostics & Troubleshooting",
        "Fuel Injector, Fuel Pump & Fuel System Repairs",
        "Turbocharger & Air Intake System Repairs",
        "Cooling System & Lubrication System Repairs",
        "Internal Engine Component Repairs"
      ],
      faqs: [
        ["What heavy-duty diesel engines do you service?", "We diagnose and repair commercial diesel engines, including Cummins, Detroit Diesel, Volvo, and Mack applications."],
        ["Do you perform complete diesel engine overhauls and replacements?", "Yes. Trucks of Nevada performs in-frame diesel engine overhauls, complete engine replacements, cylinder head repairs, and internal engine component repairs for commercial heavy-duty trucks."],
        ["How do I know if my diesel engine needs an overhaul or replacement?", "Excessive oil consumption, low oil pressure, engine knocking, loss of compression, and significant internal damage can indicate the need for major engine repairs. Our technicians perform diagnostics and mechanical inspections to determine the most appropriate repair option."]
      ]
    ),
    Service.new(
      slug: "suspension-repair",
      name: "Suspension Repair",
      icon: "fa-solid fa-up-down",
      h1: "Semi-Truck & Trailer Suspension Repair in Las Vegas",
      summary: "Semi-truck and trailer suspension repair in Las Vegas. Air bags, kingpins, torque rods, steering linkage, and fifth-wheel repairs.",
      lede: [
        "A properly functioning suspension and steering system is essential for vehicle stability, load distribution, handling, and safe operation. Worn or damaged components can cause uneven tire wear, poor steering response, excessive vibration, and costly downtime.",
        "At Trucks of Nevada, we specialize in heavy-duty suspension, steering, and chassis repairs for commercial semi-trucks and trailers.",
        "From leaking air bags, worn bushings, torque rods, and leaf springs to kingpin replacement, steering linkage repairs, and fifth-wheel components, our experienced technicians diagnose problems accurately and perform dependable repairs."
      ],
      problems_heading: "Common Signs of Suspension & Steering Problems",
      problems: [
        "Truck Pulling or Wandering — Difficulty maintaining a straight path, excessive steering correction, or unstable handling.",
        "Uneven or Premature Tire Wear — Worn suspension, steering, or kingpin components contributing to irregular tire wear.",
        "Air Suspension Leaks — Air bags losing pressure, uneven ride height, or suspension dropping overnight.",
        "Excessive Steering Play — Worn kingpins, tie rods, drag links, or other steering components affecting vehicle control.",
        "Rough Ride or Excessive Vibration — Worn shocks, bushings, leaf springs, or other suspension components.",
        "Clunking or Knocking Noises — Damaged torque rods, bushings, hangers, or mounting hardware.",
        "Trailer Leaning or Hopping — Suspension problems affecting stability, ride height, or load distribution.",
        "Fifth-Wheel Problems — Excessive movement, worn components, or coupling and locking concerns.",
        "DOT Inspection Violations — Suspension or steering defects identified during a DOT inspection, including damaged springs, worn components, loose mounting hardware, or excessive steering play."
      ],
      included_heading: "Our Suspension, Steering & Chassis Services",
      included: [
        "Air Suspension Diagnostics & Air Bag Replacement",
        "Leaf Spring & Shock Absorber Replacement",
        "Torque Rod, Bushing & Hanger Repairs",
        "Height Control Valves & Suspension Air Leak Repairs",
        "Kingpin Inspection & Replacement",
        "Tie Rod, Drag Link & Steering Linkage Repairs",
        "Fifth-Wheel Inspection & Component Repairs",
        "Truck & Trailer Suspension Repairs",
        "DOT-Related Suspension & Steering Repairs"
      ],
      detail_heading: "Heavy-Duty Truck & Trailer Suspension Specialists",
      detail_body: [
        "Commercial trucks and trailers operate under demanding conditions, carrying heavy loads over thousands of miles. Their suspension systems must maintain stability, distribute weight properly, and withstand constant road stress.",
        "At Trucks of Nevada, we service both air-ride and mechanical suspension systems on heavy-duty commercial trucks and trailers.",
        "Whether your semi-truck has a leaking air spring, worn torque rod bushings, damaged suspension components, or a ride-height problem, our technicians perform thorough inspections to determine the necessary repairs.",
        "We work with owner-operators and commercial fleets, helping minimize downtime through accurate diagnostics, quality workmanship, and dependable service.",
        "Serving Las Vegas, North Las Vegas, Henderson, and surrounding areas."
      ],
      faqs: [
        ["Can a bad suspension cause my semi-truck to fail a DOT inspection?", "Yes. Damaged or improperly secured suspension components, broken springs, defective mounting hardware, and other suspension-related safety issues may result in DOT inspection violations. Trucks of Nevada provides suspension inspections and repairs to address these problems."],
        ["Why does my semi-truck air suspension lose pressure overnight?", "Air suspension pressure loss can result from leaking air bags, damaged air lines, faulty fittings, or malfunctioning height control valves. Our technicians inspect and diagnose the system to identify the source of the leak."],
        ["Can worn suspension components cause uneven tire wear?", "Yes. Worn bushings, torque rods, shocks, and other suspension components can affect vehicle stability and contribute to irregular tire wear. Identifying these issues early may help prevent additional damage and operating expenses."],
        ["Do you repair both semi-truck and trailer suspensions?", "Yes. Trucks of Nevada provides suspension diagnostics and repairs for heavy-duty semi-trucks and commercial trailers, including air-ride and mechanical suspension systems."],
        ["Do you offer tire replacement or wheel alignment services?", "No. We specialize in commercial truck and trailer mechanical repairs, including suspension diagnostics and component replacement. We do not provide tire replacement or wheel alignment services."]
      ]
    ),
    Service.new(
      slug: "preventive-maintenance",
      name: "Truck Preventive Maintenance",
      icon: "fa-solid fa-oil-can",
      h1: "Semi-Truck Preventive Maintenance in Las Vegas",
      seo_title: "Semi-Truck Preventive Maintenance Las Vegas",
      summary: "Semi-truck preventive maintenance in Las Vegas. Oil changes, fluid service, inspections and fleet PM programs.",
      lede: [
        "Keep Your Trucks Running. Keep Your Business Moving.",
        "Unexpected breakdowns cost more than repairs. They disrupt deliveries, delay schedules, and take revenue-producing equipment off the road.",
        "At Trucks of Nevada, we provide comprehensive preventive maintenance for heavy-duty semi-trucks, medium-duty commercial vehicles, and trailers. From routine oil changes and fluid services to detailed mechanical inspections and electronic diagnostics, our maintenance services are designed to identify developing problems before they become expensive breakdowns.",
        "Whether you're an independent owner-operator or managing an entire fleet, we help you maintain reliable equipment, reduce avoidable downtime, and stay ahead of scheduled service requirements.",
        "Professional Maintenance. Reliable Equipment. Less Downtime."
      ],
      sections: [
        {
          "heading" => "Complete Preventive Maintenance Services for Commercial Trucks",
          "paragraphs" => [
            "Routine maintenance is one of the most effective ways to protect your investment and extend the service life of your equipment.",
            "Our preventive maintenance services address critical engine, drivetrain, cooling, and lubrication systems to help keep your trucks operating efficiently and reliably."
          ],
          "blocks" => [
            {
              "heading" => "Oil, Filter & Fluid Maintenance",
              "items" => [
                "Engine Oil & Filter Changes. Routine oil service to support proper lubrication and engine protection.",
                "Fuel Filter Replacement. Maintain clean fuel delivery and help protect sensitive fuel system components.",
                "Engine Air Filter Replacement. Support proper airflow and engine performance.",
                "Transmission Fluid Service. Maintain transmission lubrication and operating performance.",
                "Differential & Axle Fluid Service. Help protect drivetrain components against premature wear.",
                "Cooling System Service. Coolant testing and replacement to support temperature control and engine protection.",
                "Power Steering Fluid Service. Maintain proper lubrication and hydraulic system performance.",
                "Chassis Lubrication & Greasing. Service critical lubrication points to reduce friction and component wear."
              ],
              "after" => [
                "We perform maintenance according to applicable manufacturer recommendations and the operating requirements of your equipment."
              ]
            },
            {
              "heading" => "Comprehensive Truck Inspections & System Diagnostics",
              "paragraphs" => [
                "A preventive maintenance appointment should involve more than changing oil and filters.",
                "At Trucks of Nevada, we inspect critical mechanical and electrical systems to identify wear, leaks, developing faults, and potential safety concerns before they lead to unexpected downtime.",
                "Our Preventive Maintenance Inspections Include:"
              ],
              "items" => [
                "Brake System Inspections & Adjustments. Evaluate brake components and make necessary adjustments.",
                "Air System Inspections. Check air system components and investigate air leaks.",
                "Steering & Suspension Inspections. Identify worn or damaged components that may affect handling and vehicle stability.",
                "Cooling System Inspections. Examine belts, hoses, and cooling system components for wear and potential failures.",
                "Battery & Charging System Testing. Evaluate batteries, alternators, and charging system performance.",
                "Electrical & Lighting Inspections. Check lighting and electrical systems for proper operation.",
                "Fluid Leak Inspections. Identify potential engine, transmission, cooling, and drivetrain fluid leaks.",
                "Electronic Diagnostic Scanning. Check for stored fault codes and developing electronic system concerns.",
                "DPF, DEF & Aftertreatment System Checks. Evaluate emissions-related system concerns that may lead to regeneration problems or engine derates.",
                "Wheel Bearing & Seal Inspections. Identify potential lubrication leaks, wear, and component concerns."
              ],
              "after" => [
                "When maintenance reveals a problem, our technicians can discuss the recommended repair and, when practical, address minor issues during the same appointment."
              ]
            }
          ]
        },
        {
          "heading" => "Fleet Preventive Maintenance Programs",
          "paragraphs" => [
            "Consistent Maintenance. Fewer Surprises. Better Fleet Management.",
            "Managing commercial vehicles requires more than responding to breakdowns. A structured preventive maintenance program helps keep equipment service-ready while supporting predictable maintenance scheduling.",
            "Trucks of Nevada provides preventive maintenance solutions for individual owner-operators and commercial fleets throughout the Las Vegas area.",
            "Our maintenance programs can include:"
          ],
          "items" => [
            "Mileage-based preventive maintenance intervals",
            "Engine-hour-based maintenance schedules",
            "Manufacturer-recommended service intervals",
            "Coordinated maintenance appointments for fleet vehicles",
            "Preventive maintenance combined with annual DOT inspections",
            "Maintenance records and inspection reports",
            "Mobile and on-site preventive maintenance services",
            "Same-day maintenance appointments when available"
          ],
          "after" => [
            "We work with fleet managers and owner-operators to coordinate maintenance around operational demands and help minimize unnecessary time out of service.",
            "From one truck to an entire fleet, dependable maintenance starts with a consistent plan."
          ]
        },
        {
          "heading" => "Our Preventive Maintenance Process",
          "numbered" => true,
          "items" => [
            "Review Your Equipment & Maintenance Requirements. We begin by reviewing the vehicle's maintenance needs, service intervals, and any concerns reported by the driver or fleet manager.",
            "Perform Scheduled Maintenance. Our technicians complete the applicable oil, filter, fluid, and lubrication services based on the vehicle's maintenance requirements.",
            "Inspect Critical Vehicle Systems. We evaluate relevant mechanical, electrical, braking, steering, suspension, and cooling system components to identify developing concerns.",
            "Identify & Communicate Recommended Repairs. If we discover worn components, leaks, or other issues requiring attention, we explain our findings and discuss recommended repairs before proceeding with additional work.",
            "Document Service & Plan Future Maintenance. We provide maintenance documentation and help determine appropriate future service intervals based on mileage, engine hours, or manufacturer recommendations."
          ]
        }
      ],
      faqs: [
        ["How often should a semi-truck receive preventive maintenance?", "Preventive maintenance intervals depend on the truck manufacturer, engine model, mileage, engine hours, operating conditions, and type of service. We help determine appropriate maintenance intervals based on your equipment's requirements."],
        ["What is included in a semi-truck preventive maintenance service?", "Depending on the vehicle's maintenance schedule, service may include engine oil and filter changes, fuel and air filter replacement, fluid inspections, chassis lubrication, brake inspections, cooling system checks, electrical inspections, and electronic diagnostics."],
        ["Do you offer preventive maintenance for commercial fleets?", "Yes. Trucks of Nevada provides preventive maintenance programs for commercial fleets, including scheduled service intervals, inspections, maintenance documentation, and coordinated maintenance appointments."],
        ["Can I combine preventive maintenance with an annual DOT inspection?", "Yes. We perform annual DOT inspections and can coordinate them with preventive maintenance services to help reduce the number of separate shop visits."],
        ["Do you provide same-day preventive maintenance?", "Same-day service may be available depending on the maintenance required, technician availability, and current shop workload. Contact us to discuss scheduling."],
        ["Do you offer mobile or on-site preventive maintenance?", "Yes. We offer mobile and on-site preventive maintenance for commercial vehicles. Service availability depends on the location and work required."],
        ["Do you service commercial trailers?", "Yes. In addition to heavy-duty and medium-duty trucks, we provide preventive maintenance and inspections for commercial trailers."],
        ["Can you identify mechanical problems during routine maintenance?", "Yes. Our inspections can identify developing concerns such as fluid leaks, worn suspension components, air system leaks, electrical faults, and cooling system issues. When additional repairs are recommended, we explain our findings before proceeding."]
      ],
      cta_title: "Schedule Your Preventive Maintenance Service Today.",
      cta_text: "Every mile matters when your business depends on reliable equipment. At Trucks of Nevada, we help owner-operators and fleet managers stay ahead of maintenance requirements with professional inspections, routine service, and experienced heavy-duty truck diagnostics. Don't wait for a breakdown to discover a preventable problem."
    ),
    Service.new(
      slug: "dot-inspections",
      name: "DOT Inspections",
      icon: "fa-solid fa-clipboard-check",
      h1: "Annual DOT Truck & Trailer Inspections in Las Vegas",
      summary: "Need an annual DOT inspection in Las Vegas? Trucks of Nevada provides commercial semi-truck and trailer inspections, safety checks, and mechanical repairs. Call today.",
      lede: [
        "Keep your commercial truck or trailer compliant, safe, and ready for the road with professional annual DOT inspections at Trucks of Nevada.",
        "We perform annual DOT inspections for semi-trucks, tractors, and commercial trailers, checking critical safety components including brakes, steering, suspension, lighting, tires, and other required systems.",
        "Whether you're an owner-operator preparing for your annual inspection or a fleet manager maintaining multiple vehicles, our team provides thorough inspections, clear results, and repairs when needed.",
        "Most routine inspections can be completed in under an hour, depending on vehicle condition and shop availability."
      ],
      problems: [
        "Annual DOT inspection is due or about to expire",
        "Tractor and trailer need annual inspections",
        "Preparing a truck for an upcoming DOT inspection",
        "Vehicle received violations during a roadside inspection",
        "Brake, suspension, steering, or lighting issues need attention",
        "Fleet vehicles need scheduled annual safety inspections"
      ],
      included_heading: "Our DOT Inspection Services",
      included: [
        "Annual DOT Inspections for Semi-Trucks & Commercial Trailers",
        "Brake System & Air Brake Inspections",
        "Steering & Suspension Component Inspections",
        "Tires, Wheels & Wheel-End Safety Checks",
        "Lighting, Reflectors & Electrical System Inspections",
        "Frame, Coupling Devices & Fifth-Wheel Inspections",
        "Required Safety Equipment & Vehicle Component Checks",
        "Inspection Documentation & Identification of Defects",
        "Repairs for DOT-Related Mechanical Violations"
      ],
      faqs: [
        ["How often is a DOT inspection required?", "Most commercial motor vehicles subject to federal annual inspection requirements must undergo a DOT inspection at least once every 12 months."],
        ["How long does an annual DOT inspection take?", "Most routine inspections can be completed in under an hour, depending on the vehicle's condition and shop availability. Additional time may be needed if defects are discovered."],
        ["What happens if my truck or trailer fails the inspection?", "Our technicians will explain the defects identified during the inspection and recommend the necessary repairs. Trucks of Nevada can perform many mechanical repairs on-site to help bring your equipment into compliance."],
        ["Can you inspect both my semi-truck and trailer?", "Yes. We provide annual DOT inspections for commercial tractors and trailers, making it convenient for owner-operators and fleets to have both inspected at one location."]
      ]
    ),
    Service.new(
      slug: "carb-inspections",
      name: "CARB Clean Truck Check Testing",
      icon: "fa-solid fa-leaf",
      h1: "CARB Clean Truck Check Testing in Las Vegas",
      seo_title: "CARB Clean Truck Check Testing Las Vegas",
      summary: "CARB Clean Truck Check testing in Las Vegas for semi-trucks and fleets. OBD and smoke opacity testing, CARB reporting and emissions repairs. Call today.",
      button_label: "Schedule CARB Testing",
      lede: [
        "Need a CARB Clean Truck Check test for your semi-truck or commercial diesel vehicle? Trucks of Nevada is a CARB-approved testing facility in North Las Vegas, offering OBD testing, smoke opacity testing, and visual emissions inspections. We submit test results directly to CARB and provide testing documentation.",
        "Whether you received a compliance notification or need testing for your commercial fleet, we're here to help."
      ],
      problems_heading: "When You Need CARB Testing",
      problems: [
        "You received a CARB Clean Truck Check compliance notification.",
        "Your semi-truck needs scheduled emissions compliance testing.",
        "Your vehicle is registered outside California but operates in the state.",
        "Your truck failed a previous Clean Truck Check test and needs retesting.",
        "You need CARB testing for multiple commercial fleet vehicles.",
        "You need documentation confirming completed emissions testing."
      ],
      included_heading: "What We Do",
      included: [
        "CARB Clean Truck Check OBD testing",
        "Smoke opacity testing",
        "Visual emissions equipment inspections",
        "Direct submission of test results to CARB",
        "Testing documentation for your records",
        "Retesting after a failed compliance test",
        "Mobile, on-site, and fleet testing appointments"
      ],
      sections: [
        {
          "heading" => "How Our CARB Clean Truck Check Testing Works",
          "numbered" => true,
          "items" => [
            "Schedule Your Test. Call to schedule an appointment at our North Las Vegas facility. Walk-in and same-day testing may also be available. We offer mobile and on-site testing.",
            "Verify Your Vehicle Information. We review your vehicle information and identify the applicable testing procedure.",
            "Perform the Required Test. Our team performs the appropriate OBD test, smoke opacity test, and applicable visual emissions inspection.",
            "Submit Results to CARB. We submit the completed test results directly to CARB and provide documentation for your records.",
            "Diagnose and Repair Problems When Needed. If your vehicle fails, we can diagnose and repair DPF, DEF, SCR, NOx sensor, EGR, and related aftertreatment problems before applicable retesting."
          ]
        },
        {
          "heading" => "Failed a CARB Test? We Can Help With Emissions Repairs.",
          "paragraphs" => [
            "At Trucks of Nevada, our services go beyond compliance testing. We also provide heavy-duty emissions diagnostics and repairs to help identify and correct problems that may cause a vehicle to fail.",
            "Our repair capabilities include:"
          ],
          "items" => [
            "DPF diagnostics and repairs",
            "DEF system diagnostics and repairs",
            "SCR catalyst and NOx sensor diagnostics and repairs",
            "EGR system diagnostics and repairs",
            "Engine derate and speed-limit troubleshooting",
            "Aftertreatment wiring and electrical repairs",
            "Repairs following a failed Clean Truck Check test"
          ],
          "after" => [
            "Testing verifies compliance. Repairs address the underlying problem. Our technicians can help with both services."
          ]
        }
      ],
      faqs: [
        ["What is CARB Clean Truck Check testing?", "CARB Clean Truck Check is a California emissions compliance program for covered heavy-duty vehicles. Depending on the vehicle and applicable requirements, compliance testing may involve OBD testing or smoke opacity testing."],
        ["Does my truck need CARB testing if it is registered outside California?", "It may. Qualifying vehicles operating in California can be subject to Clean Truck Check requirements even when registered in another state."],
        ["Is Trucks of Nevada a CARB-approved testing facility?", "Yes. Trucks of Nevada provides CARB Clean Truck Check testing through its approved testing operation in North Las Vegas."],
        ["Do you submit the test results directly to CARB?", "Yes. We submit completed test results through the applicable CARB reporting system and provide testing documentation."],
        ["Can you test my truck if I received a CARB notification?", "Yes. Contact us to schedule the applicable compliance test for your vehicle."],
        ["What happens if my truck fails the test?", "We can diagnose and repair DPF, DEF, SCR, NOx sensor, EGR, and other aftertreatment problems. Once the necessary repairs are completed, we can perform applicable retesting."],
        ["Do you offer mobile CARB Clean Truck Check testing?", "Yes. We provide mobile and on-site testing, including testing appointments for commercial fleets."],
        ["Can I get CARB testing the same day?", "Same-day and walk-in testing may be available. We recommend calling ahead to confirm availability."]
      ],
      cta_title: "Need CARB Clean Truck Check Testing? Schedule Today.",
      cta_text: "Received a CARB compliance notification? Need emissions testing before your next California trip? Trucks of Nevada provides CARB Clean Truck Check testing for semi-trucks, commercial diesel vehicles, and fleets, with direct CARB result submission and emissions repair services when needed."
    ),
    Service.new(
      slug: "ac-repair",
      name: "Truck A/C Repair",
      icon: "fa-solid fa-snowflake",
      h1: "Semi-Truck A/C Repair in Las Vegas",
      summary: "Semi-truck A/C repair in Las Vegas. Trucks of Nevada provides compressor repairs, refrigerant leak detection, A/C diagnostics, and recharges. Call today.",
      lede: [
        "When temperatures climb in Las Vegas, a properly functioning air conditioning system is essential for driver comfort and safety.",
        "At Trucks of Nevada, we provide professional A/C diagnostics, maintenance, and repairs for commercial semi-trucks and heavy-duty vehicles. From refrigerant leaks and failing compressors to electrical faults and poor cooling performance, our technicians identify the cause and recommend the right repair.",
        "Whether your A/C has stopped cooling completely or isn't keeping up with the desert heat, we'll help get your cab comfortable again."
      ],
      problems_heading: "Common A/C System Issues",
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
        ["Why is my semi-truck A/C blowing warm air?", "Common causes include low refrigerant, leaks, compressor failures, condenser problems, or electrical faults. Our technicians diagnose the system to identify the actual problem before recommending repairs."],
        ["Can you recharge my truck's A/C system?", "Yes. We provide refrigerant recovery, evacuation, and recharge services. If the system is low on refrigerant, we recommend checking for leaks to prevent the same problem from returning."],
        ["Can you repair an A/C system that only works while driving?", "Yes. Poor cooling at idle can result from condenser airflow problems, fan operation, compressor performance, or other system faults. We inspect the system to determine the cause."],
        ["Do you service A/C systems on different semi-truck brands?", "Yes. We service A/C systems on major commercial truck brands, including Freightliner, Volvo, Kenworth, Peterbilt, International, and Mack."]
      ]
    ),
    Service.new(
      slug: "brake-repair",
      name: "Brake Repair & Inspection",
      icon: "fa-solid fa-circle-dot",
      h1: "Semi-Truck & Trailer Brake Repair in Las Vegas",
      summary: "Semi-truck and trailer brake repair in Las Vegas. Air brakes, ABS diagnostics, compressors, brake chambers, and DOT violation repairs. Call Trucks of Nevada.",
      lede: [
        "Reliable brakes are essential for safety, performance, and DOT compliance. At Trucks of Nevada, we provide comprehensive brake diagnostics, inspections, and repairs for commercial semi-trucks and trailers.",
        "From air leaks and worn brake components to ABS faults, air compressor failures, and braking performance issues, our technicians diagnose and repair mechanical, pneumatic, and electronic brake systems.",
        "Whether you're dealing with a DOT violation, preparing for an inspection, or experiencing brake problems on the road, we help get your equipment safely back in service."
      ],
      problems_heading: "Common Brake Problems We Fix",
      problems: [
        "Weak, uneven, dragging, or overheating brakes",
        "Air pressure loss, slow air buildup, or air leaks",
        "ABS warning lights and electronic brake system faults",
        "Worn brake pads, shoes, drums, or rotors",
        "Faulty brake chambers, valves, or slack adjusters",
        "Air compressor or air dryer malfunctions",
        "Out-of-adjustment brakes and DOT brake violations"
      ],
      included_heading: "Our Brake Repair Services",
      included: [
        "Semi-Truck & Trailer Brake Inspections and Repairs",
        "Air Brake System Diagnostics & Repairs",
        "Brake Pad, Shoe, Drum, Rotor & Caliper Replacement",
        "Brake Chamber, Slack Adjuster & Brake Valve Repairs",
        "Air Compressor, Air Dryer & Air Line Repairs",
        "ABS Diagnostics, Modulator, Sensor & Wiring Repairs",
        "Brake Adjustment & Pushrod Stroke Inspections",
        "DOT Brake Violation Repairs & Compliance Checks"
      ],
      faqs: [
        ["What are the signs that my semi-truck brakes need repair?", "Common signs include weak braking, air pressure loss, unusual noises, overheating, ABS warning lights, or excessive air compressor cycling. Our technicians diagnose the cause and recommend the appropriate repairs."],
        ["Can you repair DOT brake violations?", "Yes. We diagnose and repair brake-related DOT violations, including excessive pushrod stroke, air leaks, defective brake components, and ABS system faults."],
        ["Do you repair air brake systems and ABS problems?", "Yes. We service complete commercial air brake systems, including air compressors, air dryers, brake chambers, valves, ABS modulators, sensors, and electrical components."],
        ["Do you repair brakes on both semi-trucks and trailers?", "Yes. We provide brake inspections, diagnostics, adjustments, and repairs for commercial tractors and trailers, serving both owner-operators and fleets."]
      ]
    ),
    Service.new(
      slug: "box-truck-repair",
      name: "Commercial Box Truck Repair",
      icon: "fa-solid fa-truck",
      h1: "Commercial Box Truck Repair in Las Vegas",
      seo_title: "Commercial Box Truck Repair Las Vegas",
      summary: "Commercial diesel box truck repair in Las Vegas. Engine diagnostics, DPF, brakes, electrical, transmission repairs and fleet maintenance. Call Trucks of Nevada.",
      lede: [
        "Keep your deliveries on schedule with professional box truck diagnostics, maintenance, and repairs at Trucks of Nevada.",
        "We service commercial diesel box trucks, including engine and transmission problems, electrical faults, brake systems, suspension, A/C, and emissions-related issues. Whether you operate a single delivery truck or manage an entire fleet, our technicians work to minimize downtime and keep your vehicles operating reliably."
      ],
      problems_heading: "Common Box Truck Problems We Fix",
      problems: [
        "Engine warning lights, power loss, and starting problems",
        "DPF, DEF, and emissions system faults",
        "Brake problems, air leaks, and ABS warning lights",
        "Transmission and shifting issues",
        "Electrical, battery, and charging system failures",
        "A/C, cooling system, and overheating problems",
        "Suspension wear and DOT inspection violations"
      ],
      included_heading: "Our Box Truck Repair Services",
      included: [
        "Diesel Engine Diagnostics & Repair",
        "Transmission Diagnostics & Repair",
        "DPF, DEF & Aftertreatment System Repairs",
        "Brake, ABS & Suspension Repairs",
        "Electrical, Battery & Charging System Repairs",
        "Cooling System & Air Conditioning Repairs",
        "Preventive Maintenance & Oil Changes",
        "DOT Inspections & Fleet Maintenance"
      ],
      faqs: [
        ["Do you repair commercial box trucks or only semi-trucks?", "We repair both commercial diesel box trucks and semi-trucks. Our services include engine diagnostics, electrical repairs, brakes, transmissions, emissions systems, and preventive maintenance."],
        ["Do you service box truck fleets?", "Yes. We work with individual owner-operators and commercial fleets, providing scheduled maintenance, diagnostics, and repairs to help reduce unexpected downtime."],
        ["Can you diagnose check engine lights and DPF problems?", "Yes. We diagnose engine fault codes, DPF regeneration problems, DEF system faults, and other emissions-related issues using professional diagnostic equipment."],
        ["Can you complete box truck repairs the same day?", "Same-day service may be available depending on the repair, parts availability, and shop workload. Contact us to discuss your vehicle's problem and scheduling."]
      ]
    ),
    Service.new(
      slug: "specialty-vehicle-repair",
      name: "Specialty Vehicle Repair",
      icon: "fa-solid fa-truck",
      h1: "Specialty Diesel & Commercial Vehicle Repair in Las Vegas",
      seo_title: "Specialty & Commercial Vehicle Repair Las Vegas",
      summary: "Specialty diesel vehicle repair in Las Vegas. We service RVs, motorhomes, food trucks, tool trucks, buses and vocational trucks. Call Trucks of Nevada.",
      lede: [
        "Not every commercial vehicle is a semi-truck, but they all depend on reliable engines, electrical systems, and mechanical components to stay operational.",
        "At Trucks of Nevada, we provide professional diagnostics, maintenance, and repairs for specialty diesel and commercial vehicles, including motorhomes, RVs, food trucks, mobile tool trucks, buses, crane trucks, and vocational equipment.",
        "From engine and transmission problems to electrical faults, cooling systems, brakes, suspension, and emissions-related issues, our technicians service the mechanical systems that keep your vehicle running and your business moving."
      ],
      lead_sections: [
        {
          "heading" => "Specialty & Commercial Vehicles We Service",
          "blocks" => [
            {
              "heading" => "Diesel Motorhomes & RVs",
              "paragraphs" => [
                "Diesel engine, chassis, transmission, electrical, cooling system, and air conditioning repairs for motorhomes and RVs. We focus on the vehicle's mechanical and drivetrain systems."
              ]
            },
            {
              "heading" => "Food Trucks & Mobile Kitchens",
              "paragraphs" => [
                "Commercial vehicle diagnostics and repairs for food trucks, including engine performance, starting and charging systems, cooling, brakes, suspension, and preventive maintenance. Keep your mobile business operating reliably."
              ]
            },
            {
              "heading" => "Tool Trucks & Mobile Sales Vehicles",
              "paragraphs" => [
                "Mechanical and electrical repairs for commercial tool trucks and mobile sales vehicles. We service engines, transmissions, batteries, charging systems, brakes, and other vehicle components that support daily business operations."
              ]
            },
            {
              "heading" => "Commercial Buses",
              "paragraphs" => [
                "Diesel engine diagnostics, transmission repairs, electrical troubleshooting, braking systems, suspension, cooling systems, and scheduled maintenance for commercial buses."
              ]
            },
            {
              "heading" => "Crane Trucks & Vocational Vehicles",
              "paragraphs" => [
                "Engine, transmission, electrical, braking, and chassis-related repairs for crane trucks, dump trucks, and other specialized commercial vehicles."
              ]
            },
            {
              "heading" => "Other Specialty Commercial Vehicles",
              "paragraphs" => [
                "We also service applicable diesel-powered utility trucks, service vehicles, and vocational equipment with commercial truck chassis and drivetrains."
              ]
            }
          ]
        }
      ],
      problems_heading: "Common Specialty Vehicle Problems We Fix",
      problems: [
        "Check engine lights, starting problems, and loss of power",
        "Transmission faults and shifting problems",
        "Electrical, battery, and charging system failures",
        "Engine overheating and cooling system problems",
        "Brake, steering, and suspension issues",
        "DPF, DEF, SCR, and emissions system faults",
        "Air conditioning problems and mechanical breakdowns"
      ],
      included_heading: "Our Specialty Vehicle Repair Services",
      included: [
        "Advanced Diesel Engine Diagnostics & Repair",
        "Transmission & Drivetrain Repairs",
        "Electrical, Battery & Charging System Diagnostics",
        "Brake, Steering & Suspension Repairs",
        "Cooling System & Vehicle A/C Repairs",
        "DPF, DEF, SCR & Aftertreatment Repairs",
        "Preventive Maintenance & Fluid Services",
        "Commercial Vehicle Inspections"
      ]
    ),
    Service.new(
      slug: "roadside-assistance",
      name: "24/7 Roadside Assistance",
      card_name: "Semi-Truck Roadside Assistance",
      icon: "fa-solid fa-road",
      h1: "24/7 Semi-Truck Roadside Assistance in Las Vegas",
      summary: "24/7 semi-truck roadside assistance in Las Vegas. Mobile diagnostics, jump-starts, air brake repairs, engine derates and emergency truck repairs. Call today.",
      lede: [
        "Emergency Mobile Truck Repair & Diagnostics. Day or Night.",
        "A breakdown doesn't wait for business hours, and neither should your roadside assistance.",
        "At Trucks of Nevada, we provide 24/7 roadside assistance for commercial semi-trucks, medium-duty trucks, and trailers throughout the Las Vegas Valley and surrounding highways.",
        "From engine fault codes and no-start conditions to air brake problems, cooling system failures, and engine derates, our mobile technicians diagnose problems and perform roadside repairs whenever possible.",
        "Whether you're stranded along I-15, US-95, US-93, or elsewhere in the Las Vegas Valley, call our team for assistance. Service availability depends on your location, distance, and technician availability."
      ],
      problems_heading: "When You Need Roadside Assistance",
      problems: [
        "Your semi-truck broke down and you're stranded on the highway.",
        "Your truck won't start because of a dead battery, starter, or charging system problem.",
        "An air leak or air brake malfunction is preventing you from operating safely.",
        "A check engine light, fault code, or engine derate has interrupted your trip.",
        "Your DEF, DPF, or aftertreatment system is causing performance problems.",
        "Your engine is overheating or you've experienced a cooling system failure.",
        "A broken belt, damaged hose, or mechanical problem has left your truck disabled.",
        "Your truck has a fuel system or transmission problem that needs professional diagnostics."
      ],
      included_heading: "Common Roadside Emergencies We Handle",
      included: [
        "24/7 Roadside Dispatch. Call any time to request emergency assistance.",
        "Mobile Truck Diagnostics. Engine diagnostics, fault-code troubleshooting, and system testing.",
        "Battery & Starting System Service. Jump-starts, battery replacement, and starter repairs.",
        "Alternator Repairs. Diagnosis and repair of alternator and charging system problems.",
        "Air Leak & Air Brake Repairs. Troubleshooting and repairs for commercial truck air systems.",
        "Cooling System Repairs. Overheating diagnostics and cooling system repairs.",
        "Belts, Hoses & Minor Mechanical Repairs. Roadside repairs when the work can be completed safely on-site.",
        "DEF, DPF & Aftertreatment Troubleshooting. Diagnosis of emissions system faults and engine derates.",
        "Fuel System Diagnostics. Investigation of fuel-related engine performance and operating problems.",
        "Transmission Troubleshooting. Diagnosis of transmission faults and shifting concerns."
      ],
      sections: [
        {
          "heading" => "Emergency Mobile Truck Repair Services",
          "paragraphs" => [
            "Our goal is simple: identify the problem, determine the safest repair approach, and help minimize your downtime."
          ],
          "blocks" => [
            {
              "heading" => "Engine Diagnostics & Fault-Code Troubleshooting",
              "paragraphs" => [
                "Modern commercial trucks rely on complex electronic engine management systems. When warning lights, fault codes, or unexpected shutdowns interrupt your trip, our technicians provide mobile diagnostics to help identify the underlying problem.",
                "We troubleshoot engine performance concerns, operating faults, and other conditions that can leave a truck stranded."
              ]
            },
            {
              "heading" => "Battery Replacement, Jump-Starts & Starting System Repairs",
              "paragraphs" => [
                "A failed battery, starter, or alternator can bring your truck to a stop without warning.",
                "Our roadside services include battery replacement, jump-starts, alternator repairs, and starter repairs to address starting and charging system problems."
              ]
            },
            {
              "heading" => "Air Leak & Air Brake Repairs",
              "paragraphs" => [
                "Air system problems can prevent a commercial truck from operating safely.",
                "We diagnose and repair air leaks and air brake system problems, with repairs performed according to the condition of the vehicle and the safety of the roadside location."
              ]
            },
            {
              "heading" => "Cooling System & Overheating Repairs",
              "paragraphs" => [
                "An overheating engine can quickly turn a roadside delay into a major mechanical problem.",
                "Our technicians troubleshoot cooling system failures and perform applicable roadside repairs, including belt, hose, and related minor mechanical repairs."
              ]
            },
            {
              "heading" => "DEF, DPF & Engine Derate Troubleshooting",
              "paragraphs" => [
                "Aftertreatment system problems can trigger warning lights, reduced engine power, and operating restrictions.",
                "We provide mobile diagnostics for DEF, DPF, and related emissions system faults, including engine derate troubleshooting.",
                "Our technicians work to identify the cause of the problem and determine whether a roadside repair is possible or additional shop work is necessary."
              ]
            },
            {
              "heading" => "Fuel System & Transmission Diagnostics",
              "paragraphs" => [
                "Fuel delivery and transmission problems can affect engine performance, shifting, and overall vehicle operation.",
                "We provide roadside fuel system diagnostics and transmission troubleshooting to help identify faults and determine the appropriate repair approach."
              ]
            }
          ]
        },
        {
          "heading" => "How Our 24/7 Roadside Assistance Works",
          "numbered" => true,
          "items" => [
            "Call Our 24/7 Dispatch Number. Contact Trucks of Nevada at (702) 333-2463 and explain the breakdown. Provide your location, vehicle information, and a description of the problem.",
            "We Review Your Location & Service Needs. Our team evaluates your location and the type of assistance required. Roadside response is available 24/7, subject to technician availability, distance, and road conditions.",
            "A Mobile Technician Responds. When a technician is available, we arrange roadside service at your location. Our technician assesses the vehicle and performs the appropriate diagnostic procedures.",
            "We Perform Roadside Repairs When Possible. If the problem can be repaired safely with available equipment and parts, we work to complete the repair on-site.",
            "We Recommend the Next Step When Shop Repairs Are Necessary. Some breakdowns require extensive repairs or specialized shop equipment. If roadside repair is not practical, we explain the findings and recommend the appropriate next steps."
          ]
        },
        {
          "heading" => "Roadside Assistance for Commercial Trucks & Trailers",
          "paragraphs" => [
            "Trucks of Nevada provides emergency roadside assistance for:"
          ],
          "items" => [
            "Class 8 Semi-Trucks. Heavy-duty commercial trucks experiencing mechanical or operating problems.",
            "Medium-Duty Commercial Trucks. Commercial vehicles requiring mobile diagnostics and applicable mechanical repairs.",
            "Commercial Trailers. Roadside assessment and applicable repairs involving trailer air brake and related mechanical systems."
          ],
          "blocks" => [
            {
              "paragraphs" => [
                "We serve commercial drivers, owner-operators, and fleet operators throughout the Las Vegas Valley."
              ]
            },
            {
              "heading" => "Las Vegas Valley & Surrounding Highway Coverage",
              "paragraphs" => [
                "Our roadside service area includes Las Vegas, North Las Vegas, Henderson, and surrounding highways, depending on distance and technician availability.",
                "Whether your breakdown occurs at a truck stop, commercial parking area, or along a highway, contact us to confirm roadside service availability for your location."
              ]
            }
          ]
        }
      ],
      faqs: [
        ["Is your semi-truck roadside assistance available 24/7?", "Yes. Trucks of Nevada offers 24/7 roadside dispatch and technician response, subject to availability. Call (702) 333-2463 to request assistance."],
        ["What areas do you cover?", "We provide roadside assistance throughout the Las Vegas Valley and surrounding highways, depending on distance, road conditions, and technician availability."],
        ["Can you repair my semi-truck on the roadside?", "Many breakdowns can be diagnosed and repaired on-site. The type of repair depends on the problem, available parts and equipment, and whether the work can be completed safely at your location."],
        ["Can you jump-start a semi-truck or replace its batteries?", "Yes. We provide commercial truck jump-starts, battery replacement, and related starting system repairs."],
        ["Do you repair truck air leaks and air brake problems?", "Yes. We diagnose and repair air leaks and air brake system problems on commercial trucks, when the repair can be performed safely at the roadside."],
        ["Can you help with a DEF fault or engine derate?", "Yes. Our technicians provide mobile diagnostics for DEF, DPF, and aftertreatment system problems, including engine derate troubleshooting."],
        ["Do you offer roadside cooling system repairs?", "Yes. We troubleshoot overheating and cooling system problems and perform applicable roadside repairs, including belts, hoses, and minor mechanical components."],
        ["Can you diagnose transmission problems on the road?", "Yes. We provide mobile transmission troubleshooting to identify faults and determine whether further repairs are needed."],
        ["Do you provide roadside assistance for commercial trailers?", "Yes. We assist with applicable commercial trailer breakdowns, including air brake and related mechanical problems."],
        ["How quickly can a technician arrive?", "Response time varies depending on your location, traffic, distance, and technician availability. Call our dispatch number for an estimated response time."],
        ["What should I do if my truck breaks down on the highway?", "Move to a safe location if possible, activate your hazard lights, and follow applicable roadside safety procedures. Once you are safely stopped, call Trucks of Nevada at (702) 333-2463 and provide your location and a description of the problem."]
      ],
      cta_title: "Semi-Truck Broken Down? We're Available 24/7.",
      cta_text: "Don't let an unexpected breakdown keep your truck off the road longer than necessary. Whether you're dealing with a no-start condition, air brake problem, overheating engine, or aftertreatment fault, Trucks of Nevada provides mobile diagnostics and roadside repairs for commercial trucks and trailers. Call our 24/7 dispatch team to request assistance and confirm technician availability."
    )
  ].freeze
end
