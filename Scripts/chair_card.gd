extends CanvasLayer

var ID: int = -1 #Position in the chair array (in Global)

@export var title_label: Label
@export var description_label: Label
@export var chair_image: TextureRect
@export var type_label: Label
@export var new_label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Wait until an ID is given
	while ID == -1:
		await get_tree().process_frame
	
	playSFX()
	
	#The ID defindes the chair
	match ID:
		0: set_card_info("Chair",load("res://Sprites/chairs/Chair.png"),"Everything begins here.")
		1: set_card_info("Armchair",load("res://Sprites/chairs/Armchair.png"),"Now your arms can rest, too.")
		2: set_card_info("Office chair",load("res://Sprites/chairs/Office.png"),"Spin! Spin! Spin!")
		3: set_card_info("Reclining chair",load("res://Sprites/chairs/Reclining.png"),"From 90 degrees to 92!")
		4: set_card_info("Rocking chair",load("res://Sprites/chairs/Rocking.png"),"Rated 80+.")
		5: set_card_info("Acapulco chair",load("res://Sprites/chairs/Acapulco.png"),"It's more comfortable than it looks.")
		6: set_card_info("Hanging chair",load("res://Sprites/chairs/Hanging.png"),"Newton approves.")
		7: set_card_info("Chaise Longue",load("res://Sprites/chairs2/ChaiseLongue.tres"),"It's literally a long chair.")
		8: set_card_info("Papasan",load("res://Sprites/chairs/Papasan.png"),"It feels like resting in a nest.")
		9: set_card_info("Egg chair",load("res://Sprites/chairs/Egg.png"),"If the chair is this big, imagine the bird!")
		10: set_card_info("Gamer chair",load("res://Sprites/chairs2/Gamer.tres"),"Did you know they evolved from sports car seats?")
		11: set_card_info("Kaidrev",load("res://Sprites/chairs/Kaidref.png"),"A Swedish chair that comes disassembled. You'll never know if that leftover bolt was extra.")
		12: set_card_info("Japanese chair",load("res://Sprites/chairs2/Japanese.tres"),"Legs are overrated.")
		13: set_card_info("Toilet",load("res://Sprites/chairs/Toilet.png"),"Do you know anyone who hasn't used this chair?")
		14: set_card_info("Folding chair",load("res://Sprites/chairs/Folding.png"),"Ready to travel the world.")
		15: set_card_info("Camping chair",load("res://Sprites/chairs/Camping.png"),"Let me hold your drink, sir.")
		16: set_card_info("Street chair",load("res://Sprites/chairs/Street.png"),"The perfect place to throw bread at pigeons.")
		17: set_card_info("Deck chair",load("res://Sprites/chairs2/Deck.tres"),"If you see one, there's a pool nearby.")
		18: set_card_info("Folding hammock",load("res://Sprites/chairs2/Hammock.tres"),"Behold, the bed-chair!")
		19: set_card_info("Swing chair",load("res://Sprites/chairs/Swing.png"),"Doing a full 360: every child's dream.")
		20: set_card_info("Wheelchair",load("res://Sprites/chairs/Wheel.png"),"Fast and cool, right until you hit the stairs.")
		21: set_card_info("Stroller",load("res://Sprites/chairs/BabyWheel.png"),"For babies who want to see the world.")
		22: set_card_info("High chair",load("res://Sprites/chairs2/BabyFood.tres"),"Here comes the airplane!")
		23: set_card_info("Baby car seat",load("res://Sprites/chairs/BabyCar.png"),"Very safe... and surprisingly hard to draw.")
		24: set_card_info("Children's chair",load("res://Sprites/chairs2/Child.tres"),"For children, or very small adults.")
		25: set_card_info("Car seat",load("res://Sprites/chairs2/Car.tres"),"Everyone wants to ride shotgun, but nobody wants to drive.")
		26: set_card_info("Bus chair",load("res://Sprites/chairs2/Bus.tres"),"There's a 90% chance there is gum under here.")
		27: set_card_info("Reserved bus chair",load("res://Sprites/chairs2/Reserved.tres"),"Who gets top priority: the pregnant, the elderly, or the injured?")
		28: set_card_info("Plane seat",load("res://Sprites/chairs2/Plane.tres"),"Pray you don't get the middle seat.")
		29: set_card_info("Pilot seat",load("res://Sprites/chairs2/Pilot.tres"),"Landing a plane isn't that hard... right?")
		30: set_card_info("Copilot seat",load("res://Sprites/chairs2/Copilot.tres"),"If the plane crashes, at least it's not entirely your fault.")
		31: set_card_info("Rocket seat",load("res://Sprites/chairs2/Rocket.tres"),"Where did you say we were going again?")
		32: set_card_info("Ejectable seat",load("res://Sprites/chairs2/Ejectable.tres"),"Don't push that button unless it's an emergen- Oh, there he goes.")
		33: set_card_info("Bar chair",load("res://Sprites/chairs/Bar.png"),"How many of these can you stack?")
		34: set_card_info("Cinema seat",load("res://Sprites/chairs/Cinema.png"),"Usually surrounded by spilled popcorn, loud chewers, and glaring phone screens.")
		35: set_card_info("Desk",load("res://Sprites/chairs/School.png"),"Sorry, lefties.")
		36: set_card_info("Massage",load("res://Sprites/chairs/Massage.png"),"Chair goes brrrrrr!")
		37: set_card_info("Hairdresser chair",load("res://Sprites/chairs/Barbershop.png"),"It has met hundreds of people, but not a single bald guy.")
		38: set_card_info("Gym chair",load("res://Sprites/chairs/Gym.png"),"The only chair that refuses to let you rest.")
		39: set_card_info("Rollercoaster seat",load("res://Sprites/chairs/RollerCoaster.png"),"You only truly appreciate sitting down after waiting in line for an hour.")
		40: set_card_info("Fair chair",load("res://Sprites/chairs/Fair.png"),"Hit the bullseye and watch them plunge into the water! Peak entertainment.")
		41: set_card_info("Accessibility chair",load("res://Sprites/chairs/Stair.png"),"It climbs the stairs for you. Perfect for the elderly or the exceptionally lazy.")
		42: set_card_info("Lifeguard chair",load("res://Sprites/chairs2/Lifeguard.tres"),"Alright bro, you win the breath-holding contest... Bro?")
		43: set_card_info("Grandstand",load("res://Sprites/chairs2/Grandstand.tres"),"It has seen a lot of games. And even more butts.")
		44: set_card_info("Director chair",load("res://Sprites/chairs/Director.png"),"Lights, chair, action!")
		45: set_card_info("Waiting room chair",load("res://Sprites/chairs/Wait.png"),"Usually found in packs of three or four. The more uncomfortable they are, the better.")
		46: set_card_info("Tennis referee chair",load("res://Sprites/chairs2/Tennis.tres"),"Has taken more than a few stray tennis balls to the face.")
		47: set_card_info("Electric chair",load("res://Sprites/chairs2/Electric.tres"),"No, it doesn't do massages.")
		48: set_card_info("Trap chair",load("res://Sprites/chairs2/Trap.tres"),"Welcome! Come on in and have a seat in this totally normal, not-at-all-suspicious chair.")
		49: set_card_info("Throne",load("res://Sprites/chairs2/Throne.tres"),"The king of chairs.")
		50: set_card_info("Elegant chair",load("res://Sprites/chairs/Elegant.png"),"An elegant seat for an elegant derrière.")
		51: set_card_info("Steampunk chair",load("res://Sprites/chairs/Steampunk.png"),"So many gears... and not a single one actually does anything.")
		52: set_card_info("Cyberpunk chair",load("res://Sprites/chairs/Cyberpunk.png"),"Who needs a holographic chair?")
		53: set_card_info("Funny chair",load("res://Sprites/chairs/Funny.png"),"A man is sentenced to the electric chair. The guard asks for his last request. He replies, 'Can you hold my hand?'")
		54: set_card_info("Impressionist chair",load("res://Sprites/chairs/Impressionist.png"),"Perfect for a Starry Night.")
		55: set_card_info("Cubist chair",load("res://Sprites/chairs/Cubist.png"),"Wait, where are the cubes?")
		56: set_card_info("Surrealist chair",load("res://Sprites/chairs/Surrealist.png"),"Reality? Sorry, we're all out of that right now.")
		57: set_card_info("Abstract chair",load("res://Sprites/chairs/Abstract.png"),"You don't just look at it, you have to FEEL the chair.")
		58: set_card_info("Minimalist chair",load("res://Sprites/chairs/Minimalist.png"),"No details. Just chair.")
		59: set_card_info("Pixel chair",load("res://Sprites/chairs/Pixel.png"),"Press 'A' to sit.")
		60: set_card_info("Gaudí chair",load("res://Sprites/chairs/Gaudi.png"),"It has been under construction for over a century.")
		61: set_card_info("Spherical chair",load("res://Sprites/chairs/Spheric.png"),"Good luck getting it to stay upright.")
		62: set_card_info("Cubic chair",load("res://Sprites/chairs/Cubic.png"),"Chair x Chair x Chair.")
		63: set_card_info("Pyramid shaped chair",load("res://Sprites/chairs/Pyramid.png"),"The ancient Egyptians would have loved it.")
		64: set_card_info("Stone chair",load("res://Sprites/chairs/Stone.png"),"Not exactly known for its lumbar support.")
		65: set_card_info("Ice chair",load("res://Sprites/chairs/Ice.png"),"Give it a few minutes, and it'll become a water chair.")
		66: set_card_info("Fire chair",load("res://Sprites/chairs/Fire.png"),"This is fine.")
		67: set_card_info("Glass chair",load("res://Sprites/chairs/Glass.png"),"If you frequently trip over your furniture, this is NOT the chair for you.")
		68: set_card_info("Diamond chair",load("res://Sprites/chairs/Diamond.png"),"Handle with extreme care.")
		69: set_card_info("Paper chair",load("res://Sprites/chairs/Paper.png"),"Highly economical. Barely functional.")
		70: set_card_info("Cardboard chair",load("res://Sprites/chairs/Cardboard.png"),"Who cares what's inside? The box is the best part!")
		71: set_card_info("Slime chair",load("res://Sprites/chairs/Slime.png"),"Part piece of furniture, part friendly pet.")
		72: set_card_info("Edible chair",load("res://Sprites/chairs/Edible.png"),"Chicken, fish, fruits, veggies, bread, and cheese. A balanced diet in one seat.")
		73: set_card_info("Sweet chair",load("res://Sprites/chairs/Sweet.png"),"Forget the chair, where's the gingerbread house?")
		74: set_card_info("Natural chair",load("res://Sprites/chairs/Natural.png"),"Nature provides everything you need.")
		75: set_card_info("Musical chair",load("res://Sprites/chairs/Musical.png"),"The only instrument capable of playing 'The Chair Song'.")
		76: set_card_info("Block chair",load("res://Sprites/chairs/Block.png"),"If you get tired of sitting, you can just take it apart and build something else.")
		77: set_card_info("Dark chair",load("res://Sprites/chairs/Dark.png"),"Every supervillain's origin story starts here.")
		78: set_card_info("Cloudy chair",load("res://Sprites/chairs/Cloud.png"),"100% water vapor.")
		79: set_card_info("Balloon chair",load("res://Sprites/chairs2/Balloon.tres"),"To infinity and beyond! Wait, wrong movie...")
		80: set_card_info("Puzzle chair",load("res://Sprites/chairs/Puzzle.png"),"The real puzzle is figuring out how to sit without it falling apart.")
		81: set_card_info("Naval chair",load("res://Sprites/chairs/Naval.png"),"Can be used on land or at sea.")
		82: set_card_info("Pirate chair",load("res://Sprites/chairs/Pirate.png"),"It downloads video games from unofficial sources.")
		83: set_card_info("Furry chair",load("res://Sprites/chairs/Furry.png"),":3")
		84: set_card_info("Alien chair",load("res://Sprites/chairs/Alien.png"),"There are butts on other planets!")
		85: set_card_info("Robot chair",load("res://Sprites/chairs/Robot.png"),"Even chairs have AI now.")
		86: set_card_info("Magic chair",load("res://Sprites/chairs/Magic.png"),"I cast 'Hunchbackus'!")
		87: set_card_info("Sleeping chair",load("res://Sprites/chairs/Sleepy.png"),"It has cushions for your back and a soft seat.")
		88: set_card_info("Zombie chair",load("res://Sprites/chairs/Zombie.png"),"A zombie chair apocalypse would be way worse than a regular one.")
		89: set_card_info("Vampire chair",load("res://Sprites/chairs/Vampire.png"),"Just don't put it near a window.")
		90: set_card_info("Frankenstein's chair",load("res://Sprites/chairs/Frankenstein.png"),"A strange way to recycle.")
		91: set_card_info("Mummy chair",load("res://Sprites/chairs/Mummy.png"),"For mummies who don't want to lie down for all eternity.")
		92: set_card_info("Ghost chair",load("res://Sprites/chairs/Ghost.png"),"Boo!")
		93: set_card_info("Christmas chair",load("res://Sprites/chairs/Christmas.png"),"Gee, I wonder what it could be!")
		94: set_card_info("Fashion chair",load("res://Sprites/chairs/Fashion.png"),"Sit in style.")
		95: set_card_info("Angel chair",load("res://Sprites/chairs/Angel.png"),"Wait, does this mean chairs can die?")
		96: set_card_info("Demon chair",load("res://Sprites/chairs/Demon.png"),"You can sit here, but it'll cost you your soul.")
		97: set_card_info("Bird chair",load("res://Sprites/chairs/Bird.png"),"Which came first: the Egg chair or the Bird chair?")
		98: set_card_info("RGB chair",load("res://Sprites/chairs/RGB.png"),"It improves your gaming skills by exactly 0%.")
		99: set_card_info("Gambling chair",load("res://Sprites/chairs/Casino.png"),"Spin the wheel to see if you get to sit.")
		100: set_card_info("Chaaaaair",load("res://Sprites/chairs/Wide.png"),"It's not a bench, it's just a chair for a very wide person.")
		101: set_card_info("Tall chair",load("res://Sprites/chairs/Tall.png"),"Good luck climbing up there.")
		102: set_card_info("Short chair",load("res://Sprites/chairs/Short.png"),"If you want to change a lightbulb, you'd better use another chair.")
		103: set_card_info("Chair in italics",load("res://Sprites/chairs/Italic.png"),"Back pain guaranteed.")
		104: set_card_info("CHAIR",load("res://Sprites/chairs/Big.png"),"Look at this absolute unit!")
		105: set_card_info("Minichair",load("res://Sprites/chairs/Mini.png"),"It can't get any smaller... right?")
		106: set_card_info("Microchair",load("res://Sprites/chairs/Micro.png"),"It definitely can't get any smaller. Right? RIGHT?")
		107: set_card_info("Bad Idea",load("res://Sprites/chairs/BadIdea.png"),"Why?")
		108: set_card_info("Fakir chair",load("res://Sprites/chairs/Fakir.png"),"For anyone seeking a challenge.")
		109: set_card_info("Flamingo chair",load("res://Sprites/chairs/Flamingo.png"),"Legs are expensive.")
		110: set_card_info("Biped chair",load("res://Sprites/chairs/Biped.png"),"Highly ironic.")
		111: set_card_info("Tripod chair",load("res://Sprites/chairs/Tripod.png"),"It's not missing a leg, it's just like this.")
		112: set_card_info("Five-legged chair",load("res://Sprites/chairs/FiveLegged.png"),"Five legs! It's bound to bring you good luck.")
		113: set_card_info("Centipede chair",load("res://Sprites/chairs/Centipede.png"),"I don't know if it has exactly a hundred legs... but I guarantee it won't be wobbling anytime soon.")
		114: set_card_info("Siamese chair",load("res://Sprites/chairs/Siamese.png"),"The chair conjoined twins have been waiting for.")
		115: set_card_info("Backchair",load("res://Sprites/chairs/Back.png"),"Don't ask me where I found it...")
		116: set_card_info("Charry the chair",load("res://Sprites/chairs2/Charry.tres"),"A normal chair? *puts on a fedora* Charry the chair?!")
		117: set_card_info("Sexy chair",load("res://Sprites/chairs/Sexy.png"),"Hey.")
		118: set_card_info("Chairette",load("res://Sprites/chairs/Chairette.png"),"Because of course there's a feminine version.")
		119: set_card_info("Rude chair",load("res://Sprites/chairs/Rude.png"),"Not cool, bro.")
		120: set_card_info("Floating chair",load("res://Sprites/chairs/Floating.png"),"It just floats. Don't ask why.")
		121: set_card_info("Distracted chair",load("res://Sprites/chairs/Distracted.png"),"Psst! Over here!")
		122: set_card_info("Cha",load("res://Sprites/chairs/Cha.png"),"It was half price for a reason.")
		123: set_card_info("Ir",load("res://Sprites/chairs/Ir.png"),"...and then he sat down.")
		124: set_card_info("Invisible chair",load("res://Sprites/chairs/Invisible.png"),"Trust me, it's there!")
		125: set_card_info("Antichair",load("res://Sprites/chairs/Anti.png"),"You're supposed to stand on it.")
		126: set_card_info("Riahc",load("res://Sprites/chairs2/Riahc.tres"),"!emag eht ot noitnetta hcum os gniyap rof sknaht ,siht daer nac uoy fI .oot eM .riahc siht esu dluow ohw gnirednow eb tsum uoY")
		127: set_card_info("Exchairibur",load("res://Sprites/chairs2/Excalibur.tres"),"Whosoever pulls this 'sword' shall be worthy to sit upon it.")
		128: set_card_info("Confusing chair",load("res://Sprites/chairs/Ragebait.png"),"I don't get it either.")
		129: set_card_info("Chair skeleton",load("res://Sprites/chairs/Skeleton.png"),"Yes, all chairs have one.")
		130: set_card_info("Doodle",load("res://Sprites/chairs/Doodle.png"),"Every great idea starts as a scribble.")
		131: set_card_info("3D chair",load("res://Sprites/chairs/3D.png"),"Now with an extra dimension!")
		132: set_card_info("Real chair",load("res://Sprites/chairs/Realist.png"),"Things just got REAL.")
		133: set_card_info("Collage",load("res://Sprites/chairs/Collage.png"),"I'll take one of everything, please.")
		134: set_card_info("Chair icon",load("res://Sprites/chairs/Icon.png"),"An iconic chair.")
		135: set_card_info("Low resolution chair",load("res://Sprites/chairs/LowRes.png"),"If this looks like a normal chair to you, you need glasses.")
		136: set_card_info("Optic chair",load("res://Sprites/chairs/Optic.png"),"It's just shapes! It doesn't make any sense!")
		137: set_card_info("Atomic chair",load("res://Sprites/chairs/Atomic.png"),"Literally ten atoms. The smallest chair in history.")
		138: set_card_info("The Chair constellation",load("res://Sprites/chairs/Constellation.png"),"A seat for the gods.")
		139: set_card_info("Infinite chair",load("res://Sprites/chairs/Infinite.png"),"Sit down, and you will never stand up again.")
		140: set_card_info("Conceptual chair",load("res://Sprites/chairs/Conceptual.png"),"Let your mind rest.")
		141: set_card_info("Char",load("res://Sprites/chairs2/Char.tres"),"h")
		142: set_card_info("Chair()",load("res://Sprites/chairs2/Code.tres"),"C++? Nah, I use Chair++.")
		143: set_card_info("Binary chair",load("res://Sprites/chairs/Binary.png"),"Guess what it says.")
		144: set_card_info("Textual chair",load("res://Sprites/chairs2/Textual.tres"),"A word is worth a thousand pictures. Wait, that's not right...")
		145: set_card_info("Error chair",load("res://Sprites/chairs/Error.png"),"[NULL]")
		146: set_card_info("The Chair Song",load("res://Sprites/chairs/Song.png"),"You'll need the Musical chair to play this.")
		147: set_card_info("Chair.mp3",load("res://Sprites/chairs/MP3.png"),"'Music to my ears.'")
		148: set_card_info("Chair word search",load("res://Sprites/chairs/WordSearch.png"),"Find them all!")
		149: set_card_info("Musical chairs",load("res://Sprites/chairs2/Game.tres"),"The best chair game... second only to this one.")
		
	#The chairs are ordered by types
	if ID < 50:
		type_label.text = "Common"
		type_label.add_theme_color_override("font_color",Color("ebcd59"))
	elif ID < 100:
		type_label.text = "Themed"
		type_label.add_theme_color_override("font_color",Color("53dc98"))
	elif ID < 130:
		type_label.text = "Chairspecial"
		type_label.add_theme_color_override("font_color",Color("ff6d69"))
	else:
		type_label.text = "Unique"
		type_label.add_theme_color_override("font_color",Color("a998ed"))
	
func set_card_info(title: String, image: Resource, description: String) -> void:
	title_label.text = title
	chair_image.texture = image
	description_label.text = description


func _on_exit_card_button_button_up() -> void:
	SceneTransitionEffect.play_click_sound()
	queue_free()
	
func set_new() -> void:
	new_label.visible = true

func playSFX() -> void:
	$BgAppearSFX.play()
	await get_tree().create_timer(1).timeout
	$CardSFX.play()

func _on_exit_card_button_mouse_entered() -> void:
	SceneTransitionEffect.play_hover_sound()
