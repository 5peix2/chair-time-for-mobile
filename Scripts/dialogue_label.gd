extends Label

const CARD = preload("res://Scenes/chair_card.tscn")

@export var isIntro: bool

var intro = [
"Chairs.",
"What are chairs?",
"It seems like a simple question, but anything can be used as a chair.",
"You just have to sit on it.",
"Welcome to the world of chairs!",
"The games you will find here are not very complex.",
"They are made to be played while watching something else.",
"A slow TV program, a boring class, a simple video or stream...",
"That way you can avoid getting distracted by your own thoughts.",
"You can also play them to kill time on the bus or in the waiting room, of course.",
"But that's not all!",
"It is possible to collect all kinds of chairs.",
"You will see the most absurd chairs in the universe.",
"But every long journey starts with a single step, so here you go.",
"[GiveChair]",
"That's all you need to know.",
"Have fun, and remember:",
"The ground is the biggest chair in the world.",
"Sit down and enjoy!"
]

var outro = [
"Congratulations!",
"You've completed the chair collection! All 150 chairs!",
"I hope this silly little game helped you pay attention.",
"And if not, I hope you at least had fun!",
"I made this game because I had trouble concentrating in some subjects.",
"I still don't know if the problem was me or the teacher...",
"Most mobile games demand too much attention, so I made this one.",
"I also had a lot of funny ideas for chairs and wanted to put them somewhere.",
"But there are no more chairs left!",
"You can keep playing if you enjoyed the 'experience'.",
"To encourage you to do so, I've prepared a little surprise on the title menu!",
"Thanks for playing! And remember:",
"Anything is a chair if you can sit on it.",
"Bye-bye!"
]

var dialogue = []
var i = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if isIntro: dialogue = intro
	else: dialogue = outro
	text = dialogue[i]


func _on_next_button_button_up() -> void:
	SceneTransitionEffect.play_click_sound()
	i += 1
	if i < dialogue.size():
		if dialogue[i] == "[GiveChair]": give_chair()
		else: text = dialogue[i]
	else:
		SceneTransitionEffect.inAnim("title_menu")

func give_chair() -> void:
	var new_card = CARD.instantiate()
	get_node("../../..").add_child(new_card)
	new_card.ID = 0


func _on_next_button_mouse_entered() -> void:
	SceneTransitionEffect.play_hover_sound()
