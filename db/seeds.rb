Region.destroy_all
Team.destroy_all
TeamMember.destroy_all
User.destroy_all

Region.create! [
  {
    name: 'North America',
    abbrev: 'NA',
  },
  {
    name: 'Europe',
    abbrev: 'EU',
  },
  {
    name: 'Oceania',
    abbrev: 'OCE',
  },
  {
    name: 'South America',
    abbrev: 'SA',
  },
  {
    name: 'Asia-Pacific',
    abbrev: 'APAC',
  },
  {
    name: 'Middle East & North Africa',
    abbrev: 'MENA',
  },
]

Team.create! [
  {
    name: 'G2 Esports',
    abbrev: 'G2',
    region_id: Region.first.id,
  },
  {
    name: 'Dignitas',
    abbrev: 'DIG',
    region_id: Region.second.id,
  },
]

User.create! [
  {
    username: "JKnaps",
    first_name: 'Jacob',
    last_name: 'Knapman',
    age: 22,
    password: 'jknaps',
  },
  {
    username: "Chicago",
    first_name: 'Reed',
    last_name: 'Wilen',
    age: 20,
    password: 'chicago',
  },
  {
    username: "Atomic",
    first_name: 'Massimo',
    last_name: 'Franceschi',
    age: 18,
    password: 'atomic',
  },
  {
    username: "Joreuz",
    first_name: 'Joris',
    last_name: 'Robben',
    age: 17,
    password: 'joreuz',
  },
  {
    username: "ApparentlyJack",
    first_name: 'Jack',
    last_name: 'Benton',
    age: 18,
    password: 'jack',
  },
  {
    username: "ScrubKilla",
    first_name: 'Kyle',
    last_name: 'Robertson',
    age: 18,
    password: 'scrub',
  },
  {
    username: "Satthew",
    first_name: 'Matthew',
    last_name: 'Ackermann',
    age: 22,
    password: 'satthew',
  },
  {
    username: "Yujuice",
    first_name: 'Albert',
    last_name: 'Pangilinan',
    age: 23,
    password: 'asdf',
  },
  {
    username: "Cat",
    first_name: 'Liam',
    last_name: 'Parmar',
    age: 23,
    password: 'password',
  }
]

TeamMember.create! [
  {
    ign: 'JKnaps',
    country: 'Canada',
    role: 0,
    team_id: Team.first.id,
    control_scheme: 1,
    user_id: User.find(1).id,
  },
  {
    ign: 'Chicago',
    country: 'USA',
    role: 0,
    team_id: Team.first.id,
    control_scheme: 1,
    user_id: User.find(2).id,
  },
  {
    ign: 'Atomic',
    country: 'USA',
    role: 0,
    team_id: Team.first.id,
    control_scheme: 1,
    user_id: User.find(3).id,
  },
  {
    ign: 'Joreuz',
    country: 'Netherlands',
    role: 0,
    team_id: Team.last.id,
    control_scheme: 1,
    user_id: User.find(4).id,
  },
  {
    ign: 'ApparentlyJack',
    country: 'England',
    role: 0,
    team_id: Team.last.id,
    control_scheme: 1,
    user_id: User.find(5).id,
  },
  {
    ign: 'Scrub Killa',
    country: 'Scotland',
    role: 0,
    team_id: Team.last.id,
    control_scheme: 1,
    user_id: User.find(6).id,
  },
  {
    ign: 'Satthew',
    country: 'USA',
    role: 2,
    team_id: Team.first.id,
    control_scheme: 0,
    user_id: User.find(7).id,
  }
]

Event.create! [
  {
    name: 'RLCS 2021-2022 Fall Major',
    venue: 'ESL Studio',
    city: 'Stockholm',
    country: 'Sweden',
  },
  {
    name: 'RLCS 2021-2022 Winter Major',
    venue: 'YouTube Theater',
    city: 'Los Angeles',
    country: 'United States',
  },
  {
    name: 'RLCS 2021-2022 Spring Major',
    venue: 'Copper Box Arena',
    city: 'London',
    country: 'England',
  },
  {
    name: 'RLCS 2021-2022 World Championships',
    venue: 'Dickies Arena',
    city: 'Dallas',
    country: 'United States',
  },
]
