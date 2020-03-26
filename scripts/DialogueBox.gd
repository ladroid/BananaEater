extends RichTextLabel

var dialogue = ["I need banana!!!", 
				"I need more banana!!!", 
				"Give me more!!!"]
var page = 0

func _ready():
	randomize()
	set_bbcode(dialogue[rand_range(0, 3)])
	set_visible_characters(0)


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
