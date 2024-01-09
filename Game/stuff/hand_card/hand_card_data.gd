class_name HandCardData

extends Resource

# holds all of the data necessary to create a card from scratch
enum value_range_A {YELLOW,LIGHTBLUE,PEACHPUFF}

enum value_range_B {A,B,C,D}

export(value_range_A) var value_A

export(value_range_B) var value_B
