extends RichTextLabel

var dialogue = ["(A) Close"]
var page = 0

func _ready():
	set_bbcode("(A) Close")
	set_visible_characters(0)


func _on_Timer2_timeout():
	set_visible_characters(get_visible_characters() + 1)
