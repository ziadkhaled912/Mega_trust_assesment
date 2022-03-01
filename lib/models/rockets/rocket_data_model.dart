class RocketDataModel {
  Diameter? height;
  Diameter? diameter;
  Mass? mass;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Engines? engines;
  LandingLegs? landingLegs;
  List<PayloadWeights>? payloadWeights;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? stages;
  int? boosters;
  int? costPerLaunch;
  int? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;

  RocketDataModel(
      {this.height,
        this.diameter,
        this.mass,
        this.firstStage,
        this.secondStage,
        this.engines,
        this.landingLegs,
        this.payloadWeights,
        this.flickrImages,
        this.name,
        this.type,
        this.active,
        this.stages,
        this.boosters,
        this.costPerLaunch,
        this.successRatePct,
        this.firstFlight,
        this.country,
        this.company,
        this.wikipedia,
        this.description,
        this.id});

  RocketDataModel.fromJson(Map<String, dynamic> json) {
    height =
    json['height'] != null ? Diameter.fromJson(json['height']) : null;
    diameter = json['diameter'] != null
        ? Diameter.fromJson(json['diameter'])
        : null;
    mass = json['mass'] != null ? Mass.fromJson(json['mass']) : null;
    firstStage = json['first_stage'] != null
        ? FirstStage.fromJson(json['first_stage'])
        : null;
    secondStage = json['second_stage'] != null
        ? SecondStage.fromJson(json['second_stage'])
        : null;
    engines =
    json['engines'] != null ? Engines.fromJson(json['engines']) : null;
    landingLegs = json['landing_legs'] != null
        ? LandingLegs.fromJson(json['landing_legs'])
        : null;
    if (json['payload_weights'] != null) {
      payloadWeights = <PayloadWeights>[];
      json['payload_weights'].forEach((v) {
        payloadWeights!.add(PayloadWeights.fromJson(v));
      });
    }
    flickrImages = json['flickr_images'].cast<String>();
    name = json['name'];
    type = json['type'];
    active = json['active'];
    stages = json['stages'];
    boosters = json['boosters'];
    costPerLaunch = json['cost_per_launch'];
    successRatePct = json['success_rate_pct'];
    firstFlight = json['first_flight'];
    country = json['country'];
    company = json['company'];
    wikipedia = json['wikipedia'];
    description = json['description'];
    id = json['id'];
  }
}

class Height {
  double? meters;
  int? feet;

  Height({this.meters, this.feet});

  Height.fromJson(Map<String, dynamic> json) {
    meters = json['meters'];
    feet = json['feet'];
  }

}

class Diameter {
  dynamic meters;
  dynamic feet;

  Diameter({this.meters, this.feet});

  Diameter.fromJson(Map<String, dynamic> json) {
    meters = json['meters'];
    feet = json['feet'];
  }
}

class Mass {
  int? kg;
  int? lb;

  Mass({this.kg, this.lb});

  Mass.fromJson(Map<String, dynamic> json) {
    kg = json['kg'];
    lb = json['lb'];
  }
}

class FirstStage {
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  bool? reusable;
  int? engines;
  dynamic fuelAmountTons;
  int? burnTimeSec;

  FirstStage(
      {this.thrustSeaLevel,
        this.thrustVacuum,
        this.reusable,
        this.engines,
        this.fuelAmountTons,
        this.burnTimeSec});

  FirstStage.fromJson(Map<String, dynamic> json) {
    thrustSeaLevel = json['thrust_sea_level'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_sea_level'])
        : null;
    thrustVacuum = json['thrust_vacuum'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_vacuum'])
        : null;
    reusable = json['reusable'];
    engines = json['engines'];
    fuelAmountTons = json['fuel_amount_tons'];
    burnTimeSec = json['burn_time_sec'];
  }
}

class ThrustSeaLevel {
  int? kN;
  int? lbf;

  ThrustSeaLevel({this.kN, this.lbf});

  ThrustSeaLevel.fromJson(Map<String, dynamic> json) {
    kN = json['kN'];
    lbf = json['lbf'];
  }
}

class SecondStage {
  ThrustSeaLevel? thrust;
  Payloads? payloads;
  bool? reusable;
  int? engines;
  dynamic fuelAmountTons;
  int? burnTimeSec;

  SecondStage(
      {this.thrust,
        this.payloads,
        this.reusable,
        this.engines,
        this.fuelAmountTons,
        this.burnTimeSec});

  SecondStage.fromJson(Map<String, dynamic> json) {
    thrust = json['thrust'] != null
        ? ThrustSeaLevel.fromJson(json['thrust'])
        : null;
    payloads = json['payloads'] != null
        ? Payloads.fromJson(json['payloads'])
        : null;
    reusable = json['reusable'];
    engines = json['engines'];
    fuelAmountTons = json['fuel_amount_tons'];
    burnTimeSec = json['burn_time_sec'];
  }
}

class Payloads {
  CompositeFairing? compositeFairing;
  String? option1;

  Payloads({this.compositeFairing, this.option1});

  Payloads.fromJson(Map<String, dynamic> json) {
    compositeFairing = json['composite_fairing'] != null
        ? CompositeFairing.fromJson(json['composite_fairing'])
        : null;
    option1 = json['option_1'];
  }
}

class CompositeFairing {
  Diameter? height;
  Diameter? diameter;

  CompositeFairing({this.height, this.diameter});

  CompositeFairing.fromJson(Map<String, dynamic> json) {
    height =
    json['height'] != null ? Diameter.fromJson(json['height']) : null;
    diameter = json['diameter'] != null
        ? Diameter.fromJson(json['diameter'])
        : null;
  }
}

class Engines {
  Isp? isp;
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  int? number;
  String? type;
  String? version;
  String? layout;
  int? engineLossMax;
  String? propellant1;
  String? propellant2;
  dynamic thrustToWeight;

  Engines(
      {this.isp,
        this.thrustSeaLevel,
        this.thrustVacuum,
        this.number,
        this.type,
        this.version,
        this.layout,
        this.engineLossMax,
        this.propellant1,
        this.propellant2,
        this.thrustToWeight});

  Engines.fromJson(Map<String, dynamic> json) {
    isp = json['isp'] != null ? Isp.fromJson(json['isp']) : null;
    thrustSeaLevel = json['thrust_sea_level'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_sea_level'])
        : null;
    thrustVacuum = json['thrust_vacuum'] != null
        ? ThrustSeaLevel.fromJson(json['thrust_vacuum'])
        : null;
    number = json['number'];
    type = json['type'];
    version = json['version'];
    layout = json['layout'];
    engineLossMax = json['engine_loss_max'];
    propellant1 = json['propellant_1'];
    propellant2 = json['propellant_2'];
    thrustToWeight = json['thrust_to_weight'];
  }
}

class Isp {
  int? seaLevel;
  int? vacuum;

  Isp({this.seaLevel, this.vacuum});

  Isp.fromJson(Map<String, dynamic> json) {
    seaLevel = json['sea_level'];
    vacuum = json['vacuum'];
  }
}

class LandingLegs {
  int? number;
  dynamic material;

  LandingLegs({this.number, this.material});

  LandingLegs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    material = json['material'];
  }
}

class PayloadWeights {
  String? id;
  String? name;
  int? kg;
  int? lb;

  PayloadWeights({this.id, this.name, this.kg, this.lb});

  PayloadWeights.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    kg = json['kg'];
    lb = json['lb'];
  }

}
